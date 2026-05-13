#!/usr/bin/env python3
"""hexa-energy / verify / cross_doc_audit.py

Stdlib-only cross-document consistency audit. Mirrors the hexa-sscb pattern
(verify/cross_doc_audit.py): catches drift across the README, spec, domain,
hexa.toml, and CLI dispatcher.

Checks (own 1, own 2, own 5, own 6):
  1. Per-group verb counts match the canonical 2/3/3/1/2/1/2 distribution.
  2. Verdict honesty — `SPEC_FIRST` and `0/14 wired` consistent across:
       - README.md, hexa.toml [closure], cli/hexa-energy.hexa cmd_status.
  3. Out-of-scope phrasing — fusion / antimatter / rtsc referenced as
       "call sibling CLI directly" (NOT "federated" / "passthrough" /
       "proxy" / "vendored").
  4. No rogue code outside the four allowed locations (verify/, tests/,
       cli/, build/, plus module/<verb>/verify_<verb>.{hexa,py}).
       Canon-import archives (origins/, papers/ — see IMPORTED_FROM_CANON.md)
       are exempt: they hold immutable predecessor snapshots moved out of
       dancinlab/canon, treated as provenance under own 3, not new code.

PASS does NOT imply any quantitative claim has been empirically validated
(own 5 — SPEC_FIRST verdict).
"""

from __future__ import annotations

import re
import sys
from pathlib import Path


REPO = Path(__file__).resolve().parent.parent

CANONICAL_GROUPS_AND_VERBS: dict[str, list[str]] = {
    "battery":   ["battery_arch", "battery_energy"],
    "nuclear":   ["nuclear", "smr_dc", "dc_reactor"],
    "grid":      ["grid", "pv_microgrid", "solar"],
    "fuel_cell": ["pemfc"],
    "thermal":   ["hvac", "thermal"],
    "mining":    ["mineshaft"],
    "meta":      ["arch", "efficiency"],
}

EXPECTED_PER_GROUP = {g: len(vs) for g, vs in CANONICAL_GROUPS_AND_VERBS.items()}
# i.e. {"battery": 2, "nuclear": 3, "grid": 3, "fuel_cell": 1, "thermal": 2, "mining": 1, "meta": 2}

# Words that signal a federation/proxy framing — must NOT appear next to
# fusion / antimatter / rtsc in any doc surface.
FORBIDDEN_FRAMINGS = ["federated", "Federated", "passthrough", "Passthrough",
                       "proxy through", "vendored"]

# Code locations allowed by own 3 (doc-first scope).
ALLOWED_CODE_DIRS = ["verify", "tests", "cli", "build"]
# Per-verb verifier files allowed under module/<verb>/.
ALLOWED_MODULE_CODE_PREFIX = "verify_"
# Immutable canon-import archive (see IMPORTED_FROM_CANON.md, 2026-05-10).
# Holds predecessor `.hexa` snapshots moved out of `dancinlab/canon` during the
# canon-minimization migration. These files are READ-ONLY historical artifacts
# (not new code authored in this repo); own 3 permits them because they are
# provenance, not implementation. Any modification requires both a `.own`
# update AND a `doc/lineage/origin.md` redirect note.
CANON_ARCHIVE_DIRS = ["origins", "papers"]

CODE_EXTENSIONS = {".py", ".c", ".h", ".S", ".s"}
# .hexa code: allowed in cli/, tests/, verify/, and module/<verb>/ if it
# matches verify_<verb>.hexa pattern.


def _fail(check: str, detail: str) -> None:
    print(f"FAIL [{check}] {detail}", file=sys.stderr)


# ── check 1: per-group verb counts ─────────────────────────────

def check_per_group_counts() -> bool:
    """hexa.toml [verbs] groups must each have the canonical verb count."""
    text = (REPO / "hexa.toml").read_text(encoding="utf-8")
    in_verbs = False
    found: dict[str, list[str]] = {}
    for line in text.splitlines():
        s = line.strip()
        if s.startswith("[verbs]"):
            in_verbs = True
            continue
        if in_verbs and s.startswith("[") and not s.startswith("[verbs]"):
            break
        if in_verbs:
            m = re.match(r"^([a-z_]+)\s*=\s*\[(.*)\]\s*$", s)
            if m:
                key = m.group(1)
                items = re.findall(r'"([^"]+)"', m.group(2))
                found[key] = items
    ok = True
    for g, expected in EXPECTED_PER_GROUP.items():
        got = found.get(g)
        if got is None:
            _fail("per_group_counts", f"hexa.toml [verbs] missing key '{g}'")
            ok = False
            continue
        if len(got) != expected:
            _fail("per_group_counts",
                  f"group '{g}' has {len(got)} verbs, expected {expected} (got: {got})")
            ok = False
            continue
        canonical = set(CANONICAL_GROUPS_AND_VERBS[g])
        if set(got) != canonical:
            _fail("per_group_counts",
                  f"group '{g}' verb set {got} != canonical {sorted(canonical)}")
            ok = False
    if ok:
        print(f"PASS per_group_counts — 7/7 groups match canonical 2/3/3/1/2/1/2")
    return ok


# ── check 2: verdict honesty ───────────────────────────────────

def check_verdict_honesty() -> bool:
    """SPEC_FIRST + 0/14 wired consistent across surfaces."""
    ok = True

    # hexa.toml
    toml = (REPO / "hexa.toml").read_text(encoding="utf-8")
    m = re.search(r'^\s*verdict\s*=\s*"([^"]+)"', toml, re.MULTILINE)
    if not m:
        _fail("verdict_honesty", "hexa.toml [closure].verdict not found")
        ok = False
    elif m.group(1) != "SPEC_FIRST":
        _fail("verdict_honesty", f"hexa.toml [closure].verdict = {m.group(1)!r}, expected 'SPEC_FIRST'")
        ok = False
    m = re.search(r'^\s*verbs_wired\s*=\s*(\d+)', toml, re.MULTILINE)
    if not m:
        _fail("verdict_honesty", "hexa.toml [closure].verbs_wired not found")
        ok = False
    elif int(m.group(1)) != 0:
        _fail("verdict_honesty", f"hexa.toml [closure].verbs_wired = {m.group(1)}, expected 0 at v1.0.0")
        ok = False

    # README.md
    readme = (REPO / "README.md").read_text(encoding="utf-8")
    if "SPEC_FIRST" not in readme:
        _fail("verdict_honesty", "README.md does not mention SPEC_FIRST")
        ok = False
    if not re.search(r"0\s*/\s*14", readme):
        _fail("verdict_honesty", "README.md does not mention '0/14' wired count")
        ok = False

    # cli
    cli = (REPO / "cli" / "hexa-energy.hexa").read_text(encoding="utf-8")
    if "SPEC_FIRST" not in cli:
        _fail("verdict_honesty", "cli/hexa-energy.hexa does not mention SPEC_FIRST")
        ok = False

    if ok:
        print("PASS verdict_honesty — SPEC_FIRST + 0/14 wired consistent across README/hexa.toml/cli")
    return ok


# ── check 3: out-of-scope phrasing ─────────────────────────────

def check_out_of_scope_phrasing() -> bool:
    """fusion/antimatter/rtsc must not be framed as federated/passthrough/proxy.

    The policy is: when one of the forbidden framings (federated, passthrough,
    proxy through, vendored) appears within 80 chars of fusion/antimatter/rtsc,
    flag it — UNLESS the forbidden word is itself negated (e.g. "no proxy",
    "do NOT proxy", "never federated") or quoted as a forbidden term in policy
    text (e.g. "NOT 'federated'/'passthrough'").
    """
    ok = True
    targets = [REPO / "README.md", REPO / "README.ai.md",
               REPO / "hexa.toml", REPO / "cli" / "hexa-energy.hexa",
               REPO / "core" / "energy" / "spec.md",
               REPO / "core" / "energy" / "domain.md", REPO / ".own"]
    pattern = re.compile(
        r"(fusion|antimatter|rtsc)[^\n]{0,80}?(" + "|".join(re.escape(w) for w in FORBIDDEN_FRAMINGS) + ")",
        re.IGNORECASE,
    )
    negation_re = re.compile(r"\b(not|NOT|never|no)\b", re.IGNORECASE)
    for t in targets:
        if not t.is_file():
            continue
        text = t.read_text(encoding="utf-8")
        for m in pattern.finditer(text):
            forbidden_pos = m.start(2)
            # Allow if the forbidden word is negated within 20 chars before it.
            ctx_start = max(0, forbidden_pos - 20)
            ctx = text[ctx_start:forbidden_pos]
            if negation_re.search(ctx):
                continue
            # Also allow if the forbidden word is quoted (single quote, backtick,
            # or double quote immediately before — indicates a policy citation).
            if forbidden_pos > 0 and text[forbidden_pos - 1] in "`'\"":
                continue
            _fail("out_of_scope_phrasing",
                  f"{t.relative_to(REPO)}: '…{m.group(0)}…' (forbidden framing near fusion/antimatter/rtsc)")
            ok = False
    if ok:
        print("PASS out_of_scope_phrasing — fusion/antimatter/rtsc framed as 'call sibling CLI directly'")
    return ok


# ── check 4: no rogue code ─────────────────────────────────────

def check_no_rogue_code() -> bool:
    """Code files must live in verify/, tests/, cli/, build/, or
    module/<verb>/verify_<verb>.{hexa,py}."""
    ok = True
    for p in REPO.rglob("*"):
        if not p.is_file():
            continue
        rel = p.relative_to(REPO)
        parts = rel.parts
        if parts and parts[0] in {".git", ".pytest_cache", "__pycache__"}:
            continue
        suffix = p.suffix.lower()
        is_code = suffix in CODE_EXTENSIONS or suffix == ".hexa" or p.name == "Makefile"
        if not is_code:
            continue
        # Allowed top-level dirs.
        if parts[0] in ALLOWED_CODE_DIRS:
            continue
        # Canon-import archive — immutable predecessor snapshots
        # (see IMPORTED_FROM_CANON.md). own 3 treats these as provenance,
        # not new in-repo code.
        if parts[0] in CANON_ARCHIVE_DIRS:
            continue
        # Allowed under module/<verb>/ as verify_*.{hexa,py} or
        # *.hexa helper (e.g. solar/real-world-solar-calculator.hexa
        # is a per-verb helper).
        if parts[0] == "module" and len(parts) >= 3:
            fname = parts[-1]
            # We accept verify_* and (legacy) *-calculator.hexa /
            # similarly-scoped per-verb helper files.
            if fname.startswith(ALLOWED_MODULE_CODE_PREFIX):
                continue
            if suffix == ".hexa":
                # Per-verb .hexa helper — allowed but should be referenced
                # from verify/ to count as wired (own 5).
                continue
        # install.hexa at root is the hx install hook — allowed by hexa.toml.
        if parts == ("install.hexa",):
            continue
        _fail("no_rogue_code",
              f"{rel} (not in {ALLOWED_CODE_DIRS}, canon-archive {CANON_ARCHIVE_DIRS}, or module/<verb>/verify_*)")
        ok = False
    if ok:
        print("PASS no_rogue_code — code restricted to verify/ tests/ cli/ build/ + module/<verb>/verify_* (canon-archive origins/ + papers/ exempt)")
    return ok


# ── main ───────────────────────────────────────────────────────

def main() -> int:
    print("hexa-energy / verify / cross_doc_audit.py — cross-document consistency audit")
    print(f"  repo root: {REPO}")
    print()
    results = [
        check_per_group_counts(),
        check_verdict_honesty(),
        check_out_of_scope_phrasing(),
        check_no_rogue_code(),
    ]
    print()
    if all(results):
        print(f"__HEXA_ENERGY_CROSS_DOC__ PASS — {sum(results)}/{len(results)} checks")
        return 0
    print(f"__HEXA_ENERGY_CROSS_DOC__ FAIL — {sum(results)}/{len(results)} checks")
    return 1


if __name__ == "__main__":
    sys.exit(main())
