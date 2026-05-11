# hexa-energy — AI-native handoff

> Conformance: hive raw 271 (readme-ai-native-mandate). This file is the
> canonical entry point for AI agents (Claude / Hexa / etc.) operating
> on this repository. Human entry point is [`README.md`](README.md).

## Identity

- **Name**: `hexa-energy` (Energy substrate, HEXA family)
- **Axis**: `energy` (battery + nuclear + grid + fuel-cell + thermal + mining + meta)
- **n=14 verb lattice** (own 1):
  - verb_count ≡ 14
  - group_count ≡ 7
  - per-group: battery 2 · nuclear 3 · grid 3 · fuel-cell 1 · thermal 2 · mining 1 · meta 2
- **Verdict**: `SPEC_FIRST` (own 5) — 0/14 verbs wired, 14/14 markdown spec
- **Parent (canonical SSOT)**: `canon/domains/energy/`
- **Distribution**: `https://github.com/dancinlab/hexa-energy` (public)

## Hierarchy (canonical pattern — raw 270/271/272/273 + arch.001 collapsed)

```
hexa-energy/                        T0 (repo root)
├── README.md                       T0 (human entry)
├── README.ai.md                    T0 (this file — AI handoff)
├── .own                            T0 (project-local SSOT, mk2 own_v1)
├── LICENSE / CHANGELOG / .gitignore T0
├── hexa.toml / install.hexa        T0 (hx package manifest)
├── core/energy/                    T1 (single-feature core SSOT)
│   ├── spec.md                     ← short paper (canonical short form)
│   ├── domain.md                   ← full domain (canonical long form, numerical SSOT)
│   └── doc/                        ← group · verb cross-references, deep dives
├── module/                         T2 (per-verb fan-out, 14 modules)
│   ├── battery_arch/               ← README.md + battery-architecture.md + scale subdirs
│   ├── battery_energy/             ← README.md + battery-energy.md + verify_battery-energy.hexa
│   ├── nuclear/  smr_dc/  dc_reactor/
│   ├── grid/  pv_microgrid/  solar/
│   ├── pemfc/
│   ├── hvac/  thermal/
│   ├── mineshaft/
│   └── arch/  efficiency/
├── verify/                         T0 (runnable invariant audit, stdlib Python)
├── tests/                          T0 (pytest acceptance scaffold)
├── cli/                            T0 (.hexa dispatcher — hexa-energy router)
├── build/                          T0 (pandoc PDF rebuild, when added)
└── doc/                            T0 (human-only)
    ├── archive/                    ← immutable predecessor snapshots (when added)
    └── lineage/                    ← origin manifest + n6-arch commit refs
```

Imports flow **T0 → T1 → T2** only. T2 modules MUST NOT import sibling T2
modules; cross-module references go through T1 (`core/energy/`).

## Invariants (must not violate when editing)

1. **n=14 verb identity holds** (own 1): any change touching the verb roster must
   simultaneously update `core/energy/domain.md` verb table, `core/energy/spec.md`
   "Verbs (14 / 7 groups)" table, `hexa.toml` `[verbs]` section, and
   `cli/hexa-energy.hexa` `VERB_DIRS` list. If counts diverge, `verify/cross_doc_audit.py`
   exits non-zero.
2. **7-group integration contractual** (own 2): the 7 group names (battery / nuclear /
   grid / fuel-cell / thermal / mining / meta) and per-group verb counts (2/3/3/1/2/1/2)
   are contractual. No silent fold (e.g. battery+nuclear → "storage") or split.
3. **doc-first code-scope** (own 3): code is permitted ONLY in `verify/`, `tests/`,
   `cli/`, `build/`. Adding code outside these four locations requires updating
   the README layout block, README.ai.md hierarchy, and `.own` decl **before**
   the implementing PR.
4. **`core/energy/domain.md` is numerical SSOT** (own 4): if `module/<verb>/<verb>.md`
   diverges from `domain.md`, `domain.md` wins. Reconcile by updating either side,
   not by leaving the divergence in place.
5. **SPEC_FIRST verdict honest** (own 5): until a verb has a working `.hexa` /
   `.py` kernel that auto-validates ≥ 1 quantitative claim from its `<verb>.md`,
   it counts as `spec`, not `wired`. README badge, `hexa.toml [closure]`, and
   `cli cmd_status` must all reflect the true `wired/spec/total` ratio.
6. **Out-of-scope axes call sibling CLIs directly**: when working in this repo
   and you need fusion, antimatter, or RT-SC logic — call `hexa-fusion …`,
   `hexa-antimatter …`, or `hexa-rtsc …` directly. Do NOT proxy them through
   `hexa-energy` or vendor copies of their specs here.

## Edit policy

- **Additive-only** at the doc layer. Do not rename, move, or delete files
  in `core/` / `module/` without updating `doc/lineage/origin.md` and adding
  a redirect note.
- **English primary** in commit messages and new prose; existing Korean prose
  in `module/<verb>/*.md` is preserved verbatim from upstream.
- Architectural changes (adding a new module, splitting `core/energy/`,
  adding a new verb or group) require updating this file's hierarchy diagram
  and the corresponding `.own` `decl` lines **before** the implementing PR.
- The cli dispatcher (`cli/hexa-energy.hexa`) is `@no-lock-needed` and
  `@resolver-bypass` — it is a placeholder that must remain pure-local and
  must not auto-launch heavy kernels at v1.0.0.

## Common agent tasks

| Task | Where to look first |
|---|---|
| Add a new verb | `core/energy/domain.md` verb table → `spec.md` → `hexa.toml [verbs]` → `cli/hexa-energy.hexa` `VERB_DIRS` → `.own` own 1 decl → create `module/<new_verb>/` with `README.md` + `<verb>.md` + `README.ai.md` |
| Add a new group | `.own` own 2 decl 7 lines + `domain.md` group ledger + `spec.md` group table + `hexa.toml [verbs]` key + `cli` `_verbs_in_group` switch + `verify/cross_doc_audit.py` `expected_groups` |
| Wire a verb (markdown → kernel) | Add `module/<verb>/verify_<verb>.{hexa,py}` that auto-derives ≥ 1 number; register call from `verify/energy_verify.py`; promote `wired` count in `cli cmd_status`; update README badge + `.own` own 5 promote-at |
| Adjust verb roster ordering | `core/energy/domain.md` is canonical; propagate to all 5 surfaces via own 1 procedure |
| Run invariant check | `python3 verify/energy_verify.py && python3 verify/cross_doc_audit.py` (exit 0 required) |
| Cross-link a sister substrate | `README.md` "Cross-link" table only — do NOT add CLI passthrough or vendor specs from `hexa-fusion`/`hexa-antimatter`/`hexa-rtsc`/`hexa-earth` |
| Provenance-trace a number | `doc/lineage/origin.md` for upstream commit; `module/<verb>/<verb>.md` for verbatim claim; `core/energy/domain.md` for canonical SSOT |

## Lineage tag

This repo was extracted from `canon` on 2026-05-06.
Source: `canon/domains/energy/` @ `c0f1f570`. Per-file provenance
in [`doc/lineage/origin.md`](doc/lineage/origin.md).

The structural restructure to the hexa-sscb pattern (core/+module/+verify/+
.own + README.ai.md) landed on 2026-05-07. Pre-restructure layout had 14
verb directories at repo root; they are now in `module/<verb>/`.
