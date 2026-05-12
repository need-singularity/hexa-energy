# 🔋 hexa-energy — Energy substrate (HEXA family)

> **14-verb / 7-group integration substrate** governed by the **n=14 verb
> lattice**. Battery + nuclear + grid + fuel-cell + thermal + mining + meta.
> Spec-first MIT extraction from `canon/domains/energy/` @ `c0f1f570`.
>
> **Out-of-scope axes — call sibling CLIs directly when needed**:
> fusion → [`hexa-fusion`](https://github.com/dancinlab/hexa-fusion) ·
> antimatter → [`hexa-antimatter`](https://github.com/dancinlab/hexa-antimatter) ·
> RT-SC → [`hexa-rtsc`](https://github.com/dancinlab/hexa-rtsc) ·
> climate cousin → [`hexa-earth`](https://github.com/dancinlab/hexa-earth)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20102606.svg)](https://doi.org/10.5281/zenodo.20102606)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-informational.svg)](CHANGELOG.md)
[![Verbs: 14 / 7 groups](https://img.shields.io/badge/verbs-14_%2F_7_groups-blue.svg)](#verbs-14--7-groups)
[![Wired: 0/14](https://img.shields.io/badge/wired-0%2F14_(SPEC__FIRST)-orange.svg)](#status)
[![Provenance](https://img.shields.io/badge/from-n6--arch%40c0f1f570-purple.svg)](doc/lineage/origin.md)
[![Pattern](https://img.shields.io/badge/pattern-hexa--sscb_(raw_270%2F271%2F272%2F273)-blueviolet.svg)](README.ai.md)

> **Status (2026-05-07):** v1.0.0 initial extraction restructured to the
> canonical `core/<feature>/ + module/<sub>/ + README.ai.md` triplet (raw
> 270/271/272/273 + arch.001 collapsed). 14 verb specs landed under
> `module/<verb>/`; 0/14 working kernels (verdict: `SPEC_FIRST`).

---

## What is hexa-energy?

`hexa-energy` is the **energy substrate** of the HEXA family. It groups
**14 verbs across 7 groups**, extracted verbatim from
`canon/domains/energy/` at SHA `c0f1f570` on 2026-05-06, and
repackaged as a public MIT substrate that downstream consumers can install
via `hx install hexa-energy`.

The n=14 verb lattice is not decorative — it is the **falsification budget**:

- `verb_count ≡ 14` (own 1)
- `group_count ≡ 7` (own 2)
- per-group: `2 / 3 / 3 / 1 / 2 / 1 / 2` (battery / nuclear / grid /
  fuel-cell / thermal / mining / meta)

Every verb roster change must restate the lattice equality across **5
authoritative surfaces**: `core/energy/domain.md` → `core/energy/spec.md` →
`hexa.toml [verbs]` → `cli/hexa-energy.hexa VERB_DIRS` →
`verify/cross_doc_audit.py expected`. `verify/energy_verify.py` exits
non-zero if any surface diverges.

---

## Repository layout

```
hexa-energy/
├── README.md                          ← this file (public landing)
├── README.ai.md                       ← AI-native handoff (raw 271)
├── LICENSE                            ← MIT
├── .own                               ← project-local SSOT (mk2 own_v1)
├── CHANGELOG.md / RELEASE_NOTES_v1.0.0.md
├── hexa.toml                          ← hx package manifest
├── install.hexa                       ← hx install hook
├── core/
│   └── energy/                        T1 (single-feature core SSOT)
│       ├── spec.md                    ← short paper (n=14 lattice + 7-group table)
│       ├── domain.md                  ← full domain (numerical SSOT, own 4)
│       └── doc/                       ← group · verb cross-references
│           └── groups.md
├── module/                            T2 (per-verb fan-out — 14 modules)
│   ├── battery_arch/                  ← README.md + battery-architecture.md + 8 scale subdirs
│   ├── battery_energy/                ← README.md + battery-energy.md + verify_battery-energy.hexa
│   ├── nuclear/  smr_dc/  dc_reactor/
│   ├── grid/  pv_microgrid/  solar/
│   ├── pemfc/
│   ├── hvac/  thermal/
│   ├── mineshaft/
│   └── arch/  efficiency/
├── verify/                            ← runnable invariant audit (Python stdlib)
│   ├── energy_verify.py               ← n=14 verb / 7-group lattice audit
│   └── cross_doc_audit.py             ← cross-document consistency audit
├── tests/                             ← pytest acceptance scaffold
├── cli/                               ← .hexa dispatcher (hexa-energy router)
│   └── hexa-energy.hexa
├── build/                             ← pandoc PDF rebuild (TBD)
└── doc/
    ├── archive/                       ← immutable predecessor snapshots (TBD)
    └── lineage/
        └── origin.md                  ← upstream provenance + restructure record
```

The `core/<feature>/ + module/<sub>/ + README.ai.md` triplet follows
**hive raw.mk2 arch.001** (collapsed from raw 270 / 271 / 272 / 273) — the
canonical core-hierarchy pattern shared with sister repositories `hexa-bio`,
`hexa-sscb`, etc.

Imports flow **T0 → T1 → T2** only. T2 modules MUST NOT import sibling T2
modules; cross-verb references go through T1 (`core/energy/domain.md`).

---

## Module inventory

| Path | What it is |
|---|---|
| [`core/energy/spec.md`](core/energy/spec.md) | Short paper — n=14 lattice + 7-group table + Mk-ladder + verify/cost summary |
| [`core/energy/domain.md`](core/energy/domain.md) | Full domain — verb ledger / group ledger / integration topology / out-of-scope policy. **Numerical SSOT (own 4).** |
| [`core/energy/doc/groups.md`](core/energy/doc/groups.md) | Group · verb cross-reference + downstream composition examples |
| [`module/<verb>/`](module/) × 14 | Per-verb spec markdown (verbatim from upstream) + `README.md` + `README.ai.md` |
| [`verify/energy_verify.py`](verify/energy_verify.py) | n=14 verb / 7-group lattice audit (verb sentinel + group sentinel + 4-surface verb_count == 14) |
| [`verify/cross_doc_audit.py`](verify/cross_doc_audit.py) | Cross-document consistency (per-group counts + verdict honesty + out-of-scope phrasing + no-rogue-code) |
| [`cli/hexa-energy.hexa`](cli/hexa-energy.hexa) | Placeholder dispatcher — group routing + selftest + status; out-of-scope subcommands redirect to sibling CLIs |
| [`tests/`](tests/) | pytest / .hexa acceptance scaffold |
| [`build/`](build/) | Pandoc PDF rebuild (TBD) |
| [`doc/lineage/origin.md`](doc/lineage/origin.md) | File-by-file upstream provenance + restructure record |
| [`.own`](.own) | Project-local SSOT — n=14 lattice (own 1) + 7-group integration (own 2) + doc-first code-scope (own 3) + domain.md numerical SSOT (own 4) + SPEC_FIRST verdict honesty (own 5) |

---

## Status

**v1.0.0 verdict: `SPEC_FIRST`** (own 5).

- 14/14 verbs ship as markdown specs (`module/<verb>/<verb>.md`)
- **0/14** verbs ship a working `.hexa` / `.py` kernel
- `cli/hexa-energy.hexa` is a placeholder dispatcher (group routing + selftest +
  status); kernels are deferred
- `selftest` PASS = 14 `module/<verb>/` directories present (sentinel sweep
  only — no empirical claim is validated by the sweep)

Out-of-scope axes (fusion · antimatter · RT-SC · climate cousin) are NOT
subcommands of `hexa-energy`. When working in this repo and you need any of
them, **call the sibling CLI directly** — do NOT proxy or re-vendor.

---

## Install

```bash
# 1. Install hexa-lang (gives you `hexa` + `hx` package manager)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/dancinlab/hexa-lang/main/install.sh)"

# 2. Install hexa-energy
hx install hexa-energy
```

## Run

```bash
hexa-energy battery         # battery_arch, battery_energy                  [SPEC]
hexa-energy nuclear         # nuclear, smr_dc, dc_reactor                   [SPEC]
hexa-energy grid            # grid, pv_microgrid, solar                     [SPEC]
hexa-energy fuel-cell       # pemfc                                          [SPEC]
hexa-energy thermal         # hvac, thermal                                  [SPEC]
hexa-energy mining          # mineshaft                                      [SPEC]
hexa-energy meta            # arch, efficiency                               [SPEC]
hexa-energy status          # 14-verb table + verdict + caveats
hexa-energy selftest        # verify 14 verb dirs present (__HEXA_ENERGY_SELFTEST__ PASS)
hexa-energy version         # print version
hexa-energy help            # full --help (subcommands + env vars + cross-link)
```

## Verify

```bash
# Invariant audits (Python stdlib only — no third-party deps):
python3 verify/energy_verify.py        # n=14 verb / 7-group lattice (3 checks; exit 0 = PASS)
python3 verify/cross_doc_audit.py      # cross-doc consistency (4 checks; exit 0 = PASS)
```

#### When you need fusion / antimatter / RT-SC

Those axes are **not** subcommands of `hexa-energy`. Call the sibling CLIs directly:

```bash
hexa-fusion status                     # fusion frontier — separate substrate
hexa-antimatter selftest               # antimatter — separate substrate
hexa-rtsc status                       # RT-SC — separate substrate
```

The dispatcher (`cli/hexa-energy.hexa`) returns a friendly redirect on
`hexa-energy fusion` / `antimatter` / `rtsc` invocations — pointing at the
sibling CLI binary, not proxying.

---

## Cross-link

`hexa-energy` is the **source-side** energy substrate. The axes below live in
their own standalone repos — **invoke their CLIs directly**:

| Sibling                                                                  | Scope                                                              | How to use from a hexa-energy session     |
|--------------------------------------------------------------------------|--------------------------------------------------------------------|-------------------------------------------|
| [`hexa-fusion`](https://github.com/dancinlab/hexa-fusion)         | fusion-powerplant + tabletop-fusion + plasma-deep                  | `hexa-fusion …` (sibling CLI, direct)     |
| [`hexa-antimatter`](https://github.com/dancinlab/hexa-antimatter) | antimatter-factory + tabletop + PET cyclotron                      | `hexa-antimatter …` (sibling CLI, direct) |
| [`hexa-rtsc`](https://github.com/dancinlab/hexa-rtsc)             | room-temp-sc + superconductor                                      | `hexa-rtsc …` (sibling CLI, direct)       |
| [`hexa-earth`](https://github.com/dancinlab/hexa-earth)           | carbon-capture · environmental-protection · climate adaptation     | `hexa-earth …` (sibling CLI, direct)      |

Sister substrates (structural pattern reference): [`hexa-sscb`](https://github.com/dancinlab/hexa-sscb)
(compute, mk1) · [`hexa-bio`](https://github.com/dancinlab/hexa-bio) (life).

---

## Provenance

- Extracted from `canon/domains/energy/` at SHA `c0f1f570` on 2026-05-06.
- Restructured to the canonical `core/<feature>/ + module/<sub>/ + README.ai.md`
  triplet on 2026-05-07.
- Original specs remain canonical in canon; this repo is a verbatim
  copy of the 14 selected subdomains, repackaged as a public MIT substrate.
- Per-file provenance: [`doc/lineage/origin.md`](doc/lineage/origin.md).

## License

MIT — see [LICENSE](LICENSE).

Author: 박민우 <nerve011235@gmail.com>
