<!-- gold-standard: shared/harness/sample.md -->
<!-- @doc(type=domain) -->
<!-- @own(sections=[WHY, COMPARE, REQUIRES, STRUCT, FLOW, EVOLVE, VERIFY, GROUP_LEDGER, VERB_LEDGER, INTEGRATION_TOPOLOGY, OUT_OF_SCOPE, PROVENANCE], prefix="§") -->
---
domain: energy
substrate: hexa-energy
verb_count: 14
group_count: 7
verdict_v1_0_0: SPEC_FIRST
extracted_from:
  repo: canon
  path: domains/energy/
  sha: c0f1f570
  date: 2026-05-06
requires:
  - to: canon/domains/energy/
    sha: c0f1f570
    reason: upstream SSOT for all 14 verb specs
  - to: HEXA family raw 270/271/272/273 + arch.001
    reason: structural pattern (core+module+ai-native triplet)
out_of_scope_siblings:
  - hexa-fusion
  - hexa-antimatter
  - hexa-rtsc
  - hexa-earth
---

# hexa-energy domain — 14-verb / 7-group integration substrate

> Numerical SSOT (own 4). If `module/<verb>/<verb>.md` diverges from this
> file, this file wins. The lattice equality `verb_count ≡ 14` and per-group
> distribution `2/3/3/1/2/1/2` are contractual (own 1, own 2). No verb add /
> remove / rename without updating all five surfaces (this file → spec.md →
> hexa.toml → cli VERB_DIRS → verify expected).

---

## §1 WHY

(See [`spec.md`](spec.md) §1 for the short version.)

The energy substrate sits beneath compute (chip, datacenter, fab),
mobility (EV, ESS, transport), manufacturing (industrial heat, electrolysis),
and life-support (HVAC, water-pumping, cold chain). The canon
monorepo had energy specs scattered across 14+ subdomains under
`domains/energy/`; `hexa-energy` consolidates them into one substrate with
the canonical hexa-sscb pattern (core/+module/+verify/+.own+README.ai.md).

Why not bundle fusion or antimatter? Because they are moving frontiers with
their own falsifier preregisters (`hexa-fusion`, `hexa-antimatter`). Why not
bundle RT-SC? Because it is a material-science axis with its own deadline
and risk profile (`hexa-rtsc`). Why not bundle climate? Because climate is
a *sink* for energy, not a source (`hexa-earth`).

The 14-verb / 7-group partition is the integration shape that remains after
those four exclusions.

---

## §2 COMPARE

(See [`spec.md`](spec.md) §2.)

Key axis: **integration vs single-axis**. Most energy substrates pick one
sub-axis (battery only, grid only, nuclear only). `hexa-energy` is
deliberately the integration substrate — it does not deepen any single axis;
it provides the inter-verb topology so downstream consumers can pick a
combination (e.g. `solar + battery_energy + grid` for residential PV-ESS
microgrid) without re-discovering the integration shape.

---

## §3 REQUIRES

| Precursor | alien_min | role |
|---|---|---|
| `n6-arch/domains/energy/` @ `c0f1f570` | n/a | upstream verb-spec source |
| `HEXA family raw 270-273 + arch.001` | n/a | structural pattern |
| Per-verb precursors | varies | see `module/<verb>/<verb>.md` |

Per-verb precursor stacks (alien_index requirements) inherit from upstream
verb specs and are listed inline within each `module/<verb>/<verb>.md`.

---

## §4 STRUCT — group ledger

### §4.1 Group ledger (own 2 — contractual)

| # | Group | Verbs | Count | Sister CLIs (out of scope here) |
|---|---|---|---|---|
| 1 | battery | `battery_arch`, `battery_energy` | 2 | — |
| 2 | nuclear | `nuclear`, `smr_dc`, `dc_reactor` | 3 | — |
| 3 | grid | `grid`, `pv_microgrid`, `solar` | 3 | — |
| 4 | fuel-cell | `pemfc` | 1 | — |
| 5 | thermal | `hvac`, `thermal` | 2 | — |
| 6 | mining | `mineshaft` | 1 | — |
| 7 | meta | `arch`, `efficiency` | 2 | — |
| **Σ** | **7 groups** | **14 verbs** | **14** | (4 out-of-scope siblings) |

Distribution sequence: `2 / 3 / 3 / 1 / 2 / 1 / 2` — sum 14.

### §4.2 Verb ledger (own 1 — contractual)

Canonical verb roster (alphabetical within group; group order matches §4.1):

```
battery     : battery_arch       battery_energy
nuclear     : nuclear            smr_dc            dc_reactor
grid        : grid               pv_microgrid      solar
fuel-cell   : pemfc
thermal     : hvac               thermal
mining      : mineshaft
meta        : arch               efficiency
```

For per-verb upstream provenance see [`../../doc/lineage/origin.md`](../../doc/lineage/origin.md)
"Verb roster — file-by-file provenance".

### §4.3 Integration topology

Energy verbs interconnect (downstream consumer can compose them); upstream
specs in `module/<verb>/<verb>.md` describe each verb in isolation. This
section is the canonical map of how they compose.

```
                ┌─────────────────────────────────────────────────┐
                │           hexa-energy integration map           │
                │                                                 │
   sources      │   solar ── pv_microgrid ──┐                     │
                │                           │                     │
                │   nuclear ── smr_dc ──────┼── grid ── (loads)   │
                │   nuclear ── dc_reactor ──┘                     │
                │                                                 │
                │   pemfc ──────────────────────────► (loads)     │
                │                                                 │
   storage      │   battery_arch (topology) ◄─── battery_energy   │
                │                                  (chemistry)    │
                │                          ▲                      │
                │                          │ buffers              │
                │                          ▼                      │
                │                       grid bus                  │
                │                                                 │
   thermal      │   hvac ◄────► thermal ────────► loads + sources │
                │   (building HVAC)  (chip/fab thermal)           │
                │                                                 │
   mining       │   mineshaft ──── (PHES + REE + AMD waste)       │
                │                                                 │
   meta         │   arch ── governs whole-substrate topology      │
                │   efficiency ── governs energy-flow KPIs        │
                └─────────────────────────────────────────────────┘
```

Edges are conceptual (downstream consumers wire them physically); v1.0.0
does not validate any flow.

---

## §5 FLOW — T0 → T1 → T2 import flow

Repository-level import flow (raw 270/271/272/273 + arch.001):

```
T0 (verify/, tests/, cli/, build/, README*, .own, hexa.toml)
  │  imports
  ▼
T1 (core/energy/{spec,domain}.md, doc/)
  │  imports (one-way)
  ▼
T2 (module/<verb>/, 14 modules)
```

T2 → T2 imports are forbidden. If `module/<verb_a>/` needs information from
`module/<verb_b>/`, the reference goes through T1 (`core/energy/domain.md`
§4.3 integration topology).

---

## §6 EVOLVE — Mk-ladder

(See [`spec.md`](spec.md) §6.)

| Mk | Repo version | Date target | Wired count | Promotion criterion |
|---|---|---|---|---|
| mk1 | v1.0.0 | 2026-05-06 | 0/14 | extraction landed |
| mk1.x | v1.x.0 | TBD | 1/14 | first verb wires (≥ 1 quantitative auto-derivation) |
| mk2 | v2.0.0 | TBD | ≥ 7/14 | one verb per group wired |
| mk3 | v3.0.0 | TBD | 14/14 | full substrate wired; verdict → `WIRED` |

Mk-ladder monotonicity (own — implicit): never insert an Mk regression below
an existing Mk (same rule as `hexa-sscb` Mk.I → Mk.V).

---

## §7 VERIFY — invariant checks

(See [`spec.md`](spec.md) §7 for the short summary.)

### §7.1 verify/energy_verify.py (stdlib Python)

Checks:

1. **Verb sentinel sweep** — 14 `module/<verb>/` directories present, each
   non-empty, each contains exactly one `<verb>.md` (or matching descriptive
   filename per `doc/lineage/origin.md`).
2. **Group sentinel sweep** — 7 group names appear in `hexa.toml [verbs]`,
   in the canonical order battery / nuclear / grid / fuel_cell / thermal /
   mining / meta.
3. **n=14 lattice equality** — `verb_count == 14` across:
   - this file (`core/energy/domain.md`) §4.2 verb ledger
   - `core/energy/spec.md` §4 STRUCT table
   - `hexa.toml [closure].verbs_total`
   - `cli/hexa-energy.hexa VERB_DIRS` array length

PASS = exit 0. FAIL emits the divergence location + expected vs observed.

### §7.2 verify/cross_doc_audit.py (stdlib Python)

Checks:

1. **Per-group verb counts** match `2/3/3/1/2/1/2` across the 5 surfaces.
2. **Verdict honesty** — `SPEC_FIRST` and `0/14 wired` consistent across:
   - `README.md` status badge
   - `hexa.toml [closure].verdict` and `[closure].verbs_wired`
   - `cli/hexa-energy.hexa cmd_status` output
3. **Out-of-scope phrasing** — `hexa-fusion`/`hexa-antimatter`/`hexa-rtsc`
   referenced as "call sibling CLI directly" (not "federated" / "passthrough" /
   "proxy" / "vendored" anywhere). own 6 in README.ai.md is the explicit policy.
4. **No rogue code** — only `verify/`, `tests/`, `cli/`, `build/`,
   `module/<verb>/verify_<verb>.{hexa,py}` host code (per own 3 doc-first
   scope).

PASS = exit 0. FAIL emits the violating file path + the violated invariant.

### §7.3 What verify/ does NOT check

- Empirical validity of any quantitative claim in `module/<verb>/<verb>.md`
  (own 5 — SPEC_FIRST).
- Cross-substrate compatibility with `hexa-fusion` / `hexa-antimatter` etc.
  (out of scope; their CLIs validate themselves).
- Upstream sync state — `module/<verb>/<verb>.md` may have drifted from
  `n6-arch/domains/energy/<upstream-name>/` since 2026-05-06; manual sync
  remains the operator's job (re-derivation policy in
  `doc/lineage/origin.md`).

---

## §8 GROUP_LEDGER (extended)

### §8.1 Battery group (2 verbs)

| Verb | Local path | Upstream | Scope |
|---|---|---|---|
| `battery_arch` | `module/battery_arch/battery-architecture.md` | `battery-architecture/` | 8 scale subdirs (earphone → smartphone → laptop → drone → home-ess → ev → ess → grid) |
| `battery_energy` | `module/battery_energy/battery-energy.md` | `battery-energy/` | chemistry + cell + pack energy density; **wired-candidate** `verify_battery-energy.hexa` |

### §8.2 Nuclear group (3 verbs)

| Verb | Local path | Upstream | Scope |
|---|---|---|---|
| `nuclear` | `module/nuclear/nuclear-reactor.md` | `nuclear-reactor/` | reactor architecture |
| `smr_dc` | `module/smr_dc/smr-datacenter.md` | `smr-datacenter/` | small modular reactor co-located with datacenter |
| `dc_reactor` | `module/dc_reactor/datacenter-reactor.md` | `datacenter-reactor/` | reactor design serving datacenter loads |

### §8.3 Grid group (3 verbs)

| Verb | Local path | Upstream | Scope |
|---|---|---|---|
| `grid` | `module/grid/power-grid.md` | `power-grid/` | grid topology + dispatch |
| `pv_microgrid` | `module/pv_microgrid/rooftop-pv-2nd-life-microgrid.md` | `rooftop-pv-2nd-life-microgrid/` | rooftop PV + 2nd-life battery microgrid |
| `solar` | `module/solar/solar-architecture.md` | `solar-architecture/` | solar PV architecture; helper `real-world-solar-calculator.hexa` |

### §8.4 Fuel-cell group (1 verb)

| Verb | Local path | Upstream | Scope |
|---|---|---|---|
| `pemfc` | `module/pemfc/pemfc.md` | `pemfc/` | proton-exchange membrane fuel cell |

### §8.5 Thermal group (2 verbs)

| Verb | Local path | Upstream | Scope |
|---|---|---|---|
| `hvac` | `module/hvac/hvac-system.md` | `hvac-system/` | building HVAC |
| `thermal` | `module/thermal/thermal-management.md` | `thermal-management/` | chip / fab thermal management |

### §8.6 Mining group (1 verb)

| Verb | Local path | Upstream | Scope |
|---|---|---|---|
| `mineshaft` | `module/mineshaft/amd-ree-mineshaft-phes.md` | `amd-ree-mineshaft-phes/` | abandoned-mineshaft pumped-hydro energy storage + REE recovery + AMD remediation |

### §8.7 Meta group (2 verbs)

| Verb | Local path | Upstream | Scope |
|---|---|---|---|
| `arch` | `module/arch/energy-architecture.md` | `energy-architecture/` | whole-substrate energy architecture |
| `efficiency` | `module/efficiency/energy-efficiency.md` | `energy-efficiency/` | energy-flow KPIs + efficiency invariants |

---

## §9 OUT_OF_SCOPE — sibling CLIs (call directly)

The following four axes are NOT subcommands of `hexa-energy`. When working
inside this repo and you need any of them — call the sibling CLI directly:

| Sibling | Scope | How to invoke |
|---|---|---|
| [`hexa-fusion`](https://github.com/dancinlab/hexa-fusion) | fusion-powerplant + tabletop-fusion + plasma-deep | `hexa-fusion …` |
| [`hexa-antimatter`](https://github.com/dancinlab/hexa-antimatter) | antimatter-factory + tabletop + PET cyclotron | `hexa-antimatter …` |
| [`hexa-rtsc`](https://github.com/dancinlab/hexa-rtsc) | room-temp-sc + superconductor | `hexa-rtsc …` |
| [`hexa-earth`](https://github.com/dancinlab/hexa-earth) | carbon-capture · environmental-protection · climate adaptation | `hexa-earth …` |

Do NOT proxy them through `hexa-energy`. Do NOT re-vendor their specs here.
The CLI dispatcher (`cli/hexa-energy.hexa`) returns a friendly redirect on
`hexa-energy fusion` / `antimatter` / `rtsc` invocations, pointing at the
sibling CLI binary.

---

## §10 PROVENANCE

This file consolidates content from the v1.0.0 `README.md` (extraction-time)
plus the per-verb spec headings under `canon/domains/energy/`
@ `c0f1f570`. Per-file mapping in
[`../../doc/lineage/origin.md`](../../doc/lineage/origin.md).

This file is the numerical SSOT (own 4). All numbers in the repository (badge
counts, hexa.toml fields, cli output) must be reconcilable to this file.
