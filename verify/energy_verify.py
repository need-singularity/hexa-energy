#!/usr/bin/env python3
"""hexa-energy / verify / energy_verify.py

Stdlib-only invariant audit for the n=14 verb / 7-group lattice.

Mirrors the hexa-sscb pattern (verify/sscb_verify.py): runnable, no
third-party deps, exit 0 on PASS, non-zero with stderr diagnostics on FAIL.

Checks (own 1, own 2, own 5):
  1. Verb sentinel sweep — 14 module/<verb>/ directories present.
  2. Group sentinel sweep — 7 group keys present in hexa.toml [verbs].
  3. n=14 lattice equality — verb_count == 14 across the four authoritative
     surfaces (domain.md verb ledger, spec.md STRUCT table, hexa.toml
     [closure].verbs_total, cli/hexa-energy.hexa VERB_DIRS array).

PASS does NOT imply any quantitative claim in module/<verb>/<verb>.md has
been empirically validated (own 5 — SPEC_FIRST verdict).
"""

from __future__ import annotations

import re
import sys
from pathlib import Path


REPO = Path(__file__).resolve().parent.parent

CANONICAL_VERBS: list[str] = [
    "battery_arch", "battery_energy",
    "nuclear", "smr_dc", "dc_reactor",
    "grid", "pv_microgrid", "solar",
    "pemfc",
    "hvac", "thermal",
    "mineshaft",
    "arch", "efficiency",
]

CANONICAL_GROUPS: list[str] = [
    "battery", "nuclear", "grid", "fuel_cell",
    "thermal", "mining", "meta",
]

EXPECTED_VERB_COUNT = 14
EXPECTED_GROUP_COUNT = 7


def _fail(check: str, detail: str) -> None:
    print(f"FAIL [{check}] {detail}", file=sys.stderr)


def check_verb_sentinel() -> bool:
    """1. Each canonical verb has a module/<verb>/ directory."""
    missing: list[str] = []
    for v in CANONICAL_VERBS:
        d = REPO / "module" / v
        if not d.is_dir():
            missing.append(v)
    if missing:
        _fail("verb_sentinel", f"missing module dirs: {missing}")
        return False
    if len(CANONICAL_VERBS) != EXPECTED_VERB_COUNT:
        _fail("verb_sentinel", f"len(CANONICAL_VERBS)={len(CANONICAL_VERBS)} != {EXPECTED_VERB_COUNT}")
        return False
    print(f"PASS verb_sentinel — {EXPECTED_VERB_COUNT}/{EXPECTED_VERB_COUNT} module dirs present")
    return True


def check_group_sentinel() -> bool:
    """2. hexa.toml [verbs] section contains the 7 canonical group keys."""
    toml = (REPO / "hexa.toml").read_text(encoding="utf-8")
    in_verbs_section = False
    found: list[str] = []
    for line in toml.splitlines():
        s = line.strip()
        if s.startswith("[verbs]"):
            in_verbs_section = True
            continue
        if in_verbs_section and s.startswith("[") and not s.startswith("[verbs]"):
            break
        if in_verbs_section:
            m = re.match(r"^([a-z_]+)\s*=", s)
            if m:
                found.append(m.group(1))
    missing = [g for g in CANONICAL_GROUPS if g not in found]
    if missing:
        _fail("group_sentinel", f"missing in hexa.toml [verbs]: {missing} (found: {found})")
        return False
    if len(found) != EXPECTED_GROUP_COUNT:
        _fail("group_sentinel", f"hexa.toml [verbs] has {len(found)} keys, expected {EXPECTED_GROUP_COUNT}")
        return False
    print(f"PASS group_sentinel — {EXPECTED_GROUP_COUNT}/{EXPECTED_GROUP_COUNT} group keys in hexa.toml")
    return True


def _count_verbs_in_domain_md() -> int | None:
    """Count canonical verb names appearing in domain.md verb ledger §4.2."""
    p = REPO / "core" / "energy" / "domain.md"
    if not p.is_file():
        _fail("verb_count_domain", f"missing {p.relative_to(REPO)}")
        return None
    text = p.read_text(encoding="utf-8")
    # We rely on the verb ledger §4.2 fenced block having each verb name.
    seen: set[str] = set()
    for v in CANONICAL_VERBS:
        if re.search(rf"\b{re.escape(v)}\b", text):
            seen.add(v)
    return len(seen)


def _count_verbs_in_spec_md() -> int | None:
    p = REPO / "core" / "energy" / "spec.md"
    if not p.is_file():
        _fail("verb_count_spec", f"missing {p.relative_to(REPO)}")
        return None
    text = p.read_text(encoding="utf-8")
    seen: set[str] = set()
    for v in CANONICAL_VERBS:
        if re.search(rf"\b{re.escape(v)}\b", text):
            seen.add(v)
    return len(seen)


def _count_verbs_in_hexa_toml_closure() -> int | None:
    text = (REPO / "hexa.toml").read_text(encoding="utf-8")
    m = re.search(r"^\s*verbs_total\s*=\s*(\d+)", text, re.MULTILINE)
    if not m:
        _fail("verb_count_toml", "hexa.toml [closure].verbs_total not found")
        return None
    return int(m.group(1))


def _count_verbs_in_cli() -> int | None:
    p = REPO / "cli" / "hexa-energy.hexa"
    if not p.is_file():
        _fail("verb_count_cli", f"missing {p.relative_to(REPO)}")
        return None
    text = p.read_text(encoding="utf-8")
    # Look for the VERB_DIRS array.
    m = re.search(r"VERB_DIRS:\s*\[str\]\s*=\s*\[([^\]]*)\]", text, re.DOTALL)
    if not m:
        _fail("verb_count_cli", "VERB_DIRS array not found in cli/hexa-energy.hexa")
        return None
    body = m.group(1)
    items = re.findall(r'"([^"]+)"', body)
    return len(items)


def check_lattice_equality() -> bool:
    """3. verb_count == 14 across the four surfaces."""
    domain_n = _count_verbs_in_domain_md()
    spec_n = _count_verbs_in_spec_md()
    toml_n = _count_verbs_in_hexa_toml_closure()
    cli_n = _count_verbs_in_cli()

    surfaces = {
        "core/energy/domain.md (canonical names present)": domain_n,
        "core/energy/spec.md (canonical names present)": spec_n,
        "hexa.toml [closure].verbs_total": toml_n,
        "cli/hexa-energy.hexa VERB_DIRS length": cli_n,
    }
    ok = True
    for name, n in surfaces.items():
        if n is None:
            ok = False
            continue
        marker = "PASS" if n == EXPECTED_VERB_COUNT else "FAIL"
        if n != EXPECTED_VERB_COUNT:
            ok = False
        print(f"{marker} lattice_equality / {name} = {n} (expected {EXPECTED_VERB_COUNT})")
    return ok


def main() -> int:
    print("hexa-energy / verify / energy_verify.py — n=14 verb / 7-group lattice audit")
    print(f"  repo root: {REPO}")
    print()
    results = [
        check_verb_sentinel(),
        check_group_sentinel(),
        check_lattice_equality(),
    ]
    print()
    if all(results):
        print(f"__HEXA_ENERGY_VERIFY__ PASS — {sum(results)}/{len(results)} checks")
        return 0
    print(f"__HEXA_ENERGY_VERIFY__ FAIL — {sum(results)}/{len(results)} checks")
    return 1


if __name__ == "__main__":
    sys.exit(main())
