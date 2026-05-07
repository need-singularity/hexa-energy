# hexa-energy spec — 14-verb / 7-group integration substrate (n=14 lattice)

> Energy substrate of the HEXA family. n=14 verb lattice + 7-group integration
> govern the substrate's identity. v1.0.0 ships as **SPEC_FIRST** (own 5):
> 14/14 markdown specs extracted from `n6-architecture/domains/energy/`
> @ `c0f1f570` (2026-05-06), 0/14 working `.hexa`/`.py` kernels.
>
> Sister CLIs called directly when their axes are needed (out of scope here):
> `hexa-fusion` · `hexa-antimatter` · `hexa-rtsc` · `hexa-earth`.

---

## §1 WHY

Energy is the load-bearing substrate beneath every other HEXA axis (compute,
mobility, manufacturing, life-support). The n6-architecture monorepo had
energy specs scattered across 14+ subdomains; `hexa-energy` consolidates
them into a single MIT-licensed public spec-first substrate that downstream
consumers can install via `hx install hexa-energy`.

The n=14 verb lattice is the falsification budget:

- `verb_count ≡ 14` (battery_arch, battery_energy, nuclear, smr_dc, dc_reactor,
  grid, pv_microgrid, solar, pemfc, hvac, thermal, mineshaft, arch, efficiency)
- `group_count ≡ 7` (battery / nuclear / grid / fuel-cell / thermal / mining / meta)
- per-group: `2 / 3 / 3 / 1 / 2 / 1 / 2` — sum 14
- Sum-of-divisors of 14: σ(14) = 1+2+7+14 = 24 (verb pairs across the
  partition graph; not used as a hard invariant at v1.0.0)
- Number-of-divisors: τ(14) = 4 — matches the 4-axis exclusion set
  (fusion / antimatter / RT-SC / climate-cousin earth) handled by sibling
  CLIs

Every group answers to the lattice. Where a verb roster change is proposed,
the lattice equality must be restated across all five surfaces (`domain.md`,
`spec.md`, `hexa.toml`, `cli`, `verify`).

---

## §2 COMPARE

| Axis | Other energy substrates | hexa-energy v1.0.0 |
|---|---|---|
| Scope | Single energy subtype (battery only / grid only) | 14-verb / 7-group integration substrate |
| Format | Often binary or proprietary | Spec-first markdown, MIT |
| Provenance | Vendor-confidential | n6-arch SHA-pinned (`c0f1f570`) |
| Wire status | Vendor-validated | SPEC_FIRST (0/14 wired, honest) |
| Frontier axes | Bundled or excluded | Federated to siblings (out of scope) |
| Falsifiability | Limited | n=14 lattice equality (verb_count == 14) |

---

## §3 REQUIRES (precursor domains)

Each of the 14 verbs inherits its own precursor stack from upstream
`n6-architecture/domains/energy/<upstream-name>/`. The integration
substrate adds two cross-cutting requirements:

| Precursor | Role |
|---|---|
| n6-arch domains/energy/ @ c0f1f570 | upstream SSOT for all 14 verb specs |
| HEXA family raw 270/271/272/273 + arch.001 | structural pattern (core+module+ai-native triplet) |

For per-verb precursors see `core/energy/domain.md` and
`module/<verb>/<verb>.md`.

---

## §4 STRUCT — 14 verbs / 7 groups

| Group | Verbs | Count | Source (`n6-architecture/domains/energy/`) |
|---|---|---|---|
| battery | `battery_arch`, `battery_energy` | 2 | `battery-architecture/`, `battery-energy/` |
| nuclear | `nuclear`, `smr_dc`, `dc_reactor` | 3 | `nuclear-reactor/`, `smr-datacenter/`, `datacenter-reactor/` |
| grid | `grid`, `pv_microgrid`, `solar` | 3 | `power-grid/`, `rooftop-pv-2nd-life-microgrid/`, `solar-architecture/` |
| fuel-cell | `pemfc` | 1 | `pemfc/` |
| thermal | `hvac`, `thermal` | 2 | `hvac-system/`, `thermal-management/` |
| mining | `mineshaft` | 1 | `amd-ree-mineshaft-phes/` |
| meta | `arch`, `efficiency` | 2 | `energy-architecture/`, `energy-efficiency/` |
| **total** | | **14** | |

---

## §5 FLOW — T0 → T1 → T2

```
                 T0 repo root (README/.own/hexa.toml/cli/verify/tests)
                        │
                        ▼
                T1 core/energy/ — single SSOT
                  spec.md (this file)
                  domain.md (numerical SSOT)
                  doc/ (cross-references)
                        │
                        ▼
                T2 module/<verb>/ — per-verb fan-out (14 modules)
                  README.md / README.ai.md
                  <verb>.md (verbatim from upstream)
                  [verify_<verb>.{hexa,py}] (when wired)
```

T2 modules MUST NOT import sibling T2 modules. Cross-verb references go
through T1 (`core/energy/domain.md`).

---

## §6 EVOLVE (Mk-ladder placeholder)

| Mk | Date target | Wired count | Note |
|---|---|---|---|
| v1.0.0 (mk1) | 2026-05-06 | 0/14 | Initial extraction. `SPEC_FIRST`. |
| v1.x.0 (mk1.x) | TBD | 1/14 | First wired verb (likely `battery_energy` via `verify_battery-energy.hexa`). |
| v2.0.0 (mk2) | TBD | ≥ 7/14 | Half-wired threshold; one verb per group has a working kernel. |
| v3.0.0 (mk3) | TBD | 14/14 | Fully wired; SPEC_FIRST verdict promotes to `WIRED`. |

`SPEC_FIRST → WIRED` promotion criteria are in `.own` own 5 + this §6.
Mk-ladder monotonicity: never insert a Mk regression (lower wired count
than predecessor).

---

## §7 VERIFY — invariant checks

`verify/energy_verify.py` (stdlib Python) checks:

1. **Verb sentinel sweep**: 14 `module/<verb>/` directories present.
2. **Group sentinel sweep**: 7 group names referenced in `hexa.toml [verbs]`.
3. **n=14 lattice equality**: verb_count == 14 across `domain.md` + `spec.md` +
   `hexa.toml` + `cli VERB_DIRS`.

`verify/cross_doc_audit.py` checks:

1. Per-group verb counts match (2/3/3/1/2/1/2).
2. Verdict honesty — `SPEC_FIRST` and `0/14 wired` consistent across README +
   hexa.toml + cli output.
3. Out-of-scope axes mention is consistent (fusion / antimatter / rtsc / earth
   labelled "call sibling CLI directly", not "federated" or "passthrough").

Both verifiers must exit 0 to land any change touching the verb roster or
group taxonomy. PASS does NOT imply any empirical claim has been validated
(own 5).

---

## §8 BOM (cost profile)

| Item | Cost |
|---|---|
| Mac local default (spec read + CLI dispatcher placeholder) | $0 |
| `selftest` (verb count check) | $0 |
| `verify/energy_verify.py` | $0 (Python stdlib) |
| `verify/cross_doc_audit.py` | $0 (Python stdlib) |
| `module/<verb>/verify_<verb>.hexa` (when wired) | TBD per verb |

v1.0.0 substrate is doc-first; no CPU/GPU/cloud cost.

---

## §9 status

**v1.0.0 verdict: `SPEC_FIRST`** (own 5).

- 14/14 verbs ship as markdown specs (`module/<verb>/<verb>.md`)
- 0/14 verbs ship a working `.hexa`/`.py` kernel
- `cli/hexa-energy.hexa` is a placeholder dispatcher (group routing + selftest +
  status)
- `selftest PASS` = 14 `module/<verb>/` present (sentinel sweep only)
- Out-of-scope axes (fusion · antimatter · RT-SC · climate-cousin) call their
  sibling CLIs directly — no proxy through `hexa-energy`

---

## §10 cross-link

| Sibling | Coupling |
|---|---|
| `hexa-fusion` | Out of scope. Call `hexa-fusion …` CLI directly when needed. |
| `hexa-antimatter` | Out of scope. Call `hexa-antimatter …` CLI directly. |
| `hexa-rtsc` | Out of scope. Call `hexa-rtsc …` CLI directly. |
| `hexa-earth` | Cousin (climate sink). Call `hexa-earth …` CLI directly. |
| `hexa-bio` | Sister extraction (life substrate). Pattern reference. |
| `hexa-sscb` | Sister extraction (compute substrate). Structural pattern reference. |

For full provenance see `doc/lineage/origin.md`.
