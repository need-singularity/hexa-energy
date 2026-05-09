# Origin & lineage

This repository was extracted from the **canon** monorepo on
**2026-05-06** (extraction SHA `c0f1f570`). On **2026-05-07** the repo was
restructured to the canonical hexa-sscb pattern (raw 270/271/272/273 +
arch.001 collapsed). This document records the upstream paths and the
local restructure so any change in this repo can be traced back to (or
propagated upstream to) the source-of-truth.

> **2026-05-07 (post-restructure)**: 14 verb directories were moved from
> repo root into `module/<verb>/` to align with the hexa-sscb canonical
> pattern. Upstream paths (`canon/domains/energy/<upstream-name>/`)
> remain unchanged; only the local layout was reorganised. File names
> inside each verb dir are preserved verbatim — they remain 1:1 with the
> upstream source-of-truth filenames.

## Upstream

- Repo: `canon` (local working copy at `~/core/canon`)
- Branch: `main`
- Extraction date: 2026-05-06
- Extraction SHA: `c0f1f570`
- Sister extractions on the same pattern: `hexa-bio` (2026-05-04),
  `hexa-sscb` (2026-05-06).

## Verb roster — file-by-file provenance

All 14 verbs sourced from `canon/domains/energy/<upstream-name>/`
at SHA `c0f1f570`. Local layout is `module/<verb>/<verb>.md` (plus any
sub-scale assets that lived under it upstream).

| Group | Verb (local) | Local path | Upstream path | Notes |
|---|---|---|---|---|
| battery | `battery_arch` | `module/battery_arch/battery-architecture.md` | `domains/energy/battery-architecture/` | Includes 8 scale subdirs (earphone → grid). |
| battery | `battery_energy` | `module/battery_energy/battery-energy.md` | `domains/energy/battery-energy/` | Has wired-candidate `verify_battery-energy.hexa`. |
| nuclear | `nuclear` | `module/nuclear/nuclear-reactor.md` | `domains/energy/nuclear-reactor/` | |
| nuclear | `smr_dc` | `module/smr_dc/smr-datacenter.md` | `domains/energy/smr-datacenter/` | |
| nuclear | `dc_reactor` | `module/dc_reactor/datacenter-reactor.md` | `domains/energy/datacenter-reactor/` | |
| grid | `grid` | `module/grid/power-grid.md` | `domains/energy/power-grid/` | |
| grid | `pv_microgrid` | `module/pv_microgrid/rooftop-pv-2nd-life-microgrid.md` | `domains/energy/rooftop-pv-2nd-life-microgrid/` | |
| grid | `solar` | `module/solar/solar-architecture.md` | `domains/energy/solar-architecture/` | Has helper `real-world-solar-calculator.hexa`. |
| fuel-cell | `pemfc` | `module/pemfc/pemfc.md` | `domains/energy/pemfc/` | |
| thermal | `hvac` | `module/hvac/hvac-system.md` | `domains/energy/hvac-system/` | |
| thermal | `thermal` | `module/thermal/thermal-management.md` | `domains/energy/thermal-management/` | |
| mining | `mineshaft` | `module/mineshaft/amd-ree-mineshaft-phes.md` | `domains/energy/amd-ree-mineshaft-phes/` | |
| meta | `arch` | `module/arch/energy-architecture.md` | `domains/energy/energy-architecture/` | |
| meta | `efficiency` | `module/efficiency/energy-efficiency.md` | `domains/energy/energy-efficiency/` | |

## Local restructure (2026-05-07)

Pre-restructure layout (v1.0.0 initial extraction, 2026-05-06):

```
hexa-energy/
├── arch/  battery_arch/  battery_energy/  dc_reactor/  efficiency/
├── grid/  hvac/  mineshaft/  nuclear/  pemfc/
├── pv_microgrid/  smr_dc/  solar/  thermal/         (14 verb dirs at root)
├── cli/  tests/
└── README.md  hexa.toml  install.hexa  CHANGELOG.md  RELEASE_NOTES_v1.0.0.md  LICENSE
```

Post-restructure layout (this commit):

```
hexa-energy/
├── core/energy/{spec,domain}.md + doc/      (NEW — T1 SSOT)
├── module/<verb>/                            (14 verb dirs moved here from root)
├── verify/  build/                           (NEW — T0 runnable surfaces)
├── doc/{archive,lineage}/                    (NEW — provenance + immutable archive)
├── .own                                      (NEW — mk2 own_v1 SSOT)
├── README.ai.md                              (NEW — raw 271 AI handoff)
├── cli/  tests/                              (preserved at root)
└── README.md  hexa.toml  install.hexa  CHANGELOG.md  RELEASE_NOTES_v1.0.0.md  LICENSE
```

The 14 verb directories were moved via `git mv <verb> module/<verb>` so git
history follows. No file content was changed by the move; per-verb spec
markdown filenames are preserved verbatim.

## Re-derivation policy

If you change a file in `module/<verb>/<verb>.md` here and want to push it upstream:

1. Reproduce the change in `canon/domains/energy/<upstream-name>/`.
2. Update `core/energy/domain.md` (the numerical SSOT) so it stays consistent
   with the changed verb spec.
3. If the change affects the verb roster (additions, removals, renames),
   propagate through the 5 surfaces in own 1's procedure: `domain.md` →
   `spec.md` → `hexa.toml [verbs]` → `cli/hexa-energy.hexa VERB_DIRS` →
   `verify/cross_doc_audit.py expected_verbs`.

If you change a file in `doc/archive/`, **stop** — those are immutable
snapshots and must not be edited (own 3 + raw 91).

## What was searched for and not found

- **No PDFs** referenced; the markdown sources are canonical. PDF rebuild is
  parked under `build/` for future addition.
- **No legacy CLAUDE.md** in the upstream `domains/energy/` path; the user
  directive "claude.md 금지 → .own 활용" applies prophylactically and
  `.own` is the project-local SSOT layer at v1.0.0.

## Key commits

| Commit | Date | Subject |
|---|---|---|
| `c0f1f570` | 2026-05-06 | canon working tree at extraction time |
| `60c2523` | 2026-05-06 | hexa-energy v1.0.0 initial extraction from canon@c0f1f570 |
| `5148b38` | post | roadmap: add .roadmap.hexa_energy with terminal goal + checkpoints + falsifiers |
| `0732898` | post | docs(README): normalize H1 to '# <emoji> <slug> — <tail>' prefix |
| `1e2fe8f` | post | docs(seeds): inject @canonical provenance header (canon@0570a835) |
| _this commit_ | 2026-05-07 | structural restructure to hexa-sscb pattern (core/+module/+verify/+.own+README.ai.md) |
