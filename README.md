## hexa-energy ⚡

> **Cross-link**: fusion → [`need-singularity/hexa-fusion`](https://github.com/need-singularity/hexa-fusion) · RT-SC → [`need-singularity/hexa-rtsc`](https://github.com/need-singularity/hexa-rtsc) · climate cousin → [`need-singularity/hexa-earth`](https://github.com/need-singularity/hexa-earth)

Energy 통합 — battery + nuclear + grid + fuel-cell + HVAC + mineshaft 14-verb (fusion·rtsc 외).

`hexa-energy` is the standalone Energy substrate of the HEXA family. It groups **14 verbs across 7 groups**, extracted from `n6-architecture/domains/energy/` at SHA `c0f1f570` (2026-05-06).

---

### Why

Energy is the load-bearing layer beneath every other substrate (compute, mobility, manufacturing, life-support). The n6-architecture monorepo had energy specs scattered across 14+ subdomains; `hexa-energy` consolidates them into a single, MIT-licensed, public, spec-first substrate that downstream consumers can install via `hx install hexa-energy`.

Two energy axes are intentionally **out of scope** here:

- **Fusion** — moving frontier; merits its own substrate → `hexa-fusion`.
- **Room-temperature superconductor (RT-SC)** — speculative material-science axis with its own falsifier preregister → `hexa-rtsc`.

Climate / carbon-capture / environmental-protection sits in the cousin substrate `hexa-earth` (atmosphere & CDR is a sink, not a source).

---

### Verbs (14 / 7 groups)

| Group       | Verbs                                          | Source (`n6-architecture/domains/energy/`)                                                                                  |
|-------------|------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| battery     | `battery_arch`, `battery_energy`               | `battery-architecture/`, `battery-energy/`                                                                                   |
| nuclear     | `nuclear`, `smr_dc`, `dc_reactor`              | `nuclear-reactor/`, `smr-datacenter/`, `datacenter-reactor/`                                                                 |
| grid        | `grid`, `pv_microgrid`, `solar`                | `power-grid/`, `rooftop-pv-2nd-life-microgrid/`, `solar-architecture/`                                                       |
| fuel-cell   | `pemfc`                                        | `pemfc/`                                                                                                                     |
| thermal     | `hvac`, `thermal`                              | `hvac-system/`, `thermal-management/`                                                                                        |
| mining      | `mineshaft`                                    | `amd-ree-mineshaft-phes/`                                                                                                    |
| meta        | `arch`, `efficiency`                           | `energy-architecture/`, `energy-efficiency/`                                                                                 |

Total: **14 verbs / 7 groups**. Every verb directory holds the originating spec markdown plus any sub-scale assets that lived under it.

---

### Status

**14-verb 통합 substrate (7 그룹). spec-first (작동 .hexa CLI TBD). Fusion 및 RT-SC는 별도 standalone: `hexa-fusion`, `hexa-rtsc` 참조.**

- v1.0.0 closure: **`SPEC_FIRST`** — 0/14 verbs ship a working `.hexa` kernel; 14/14 ship as markdown specs extracted verbatim from `n6-architecture@c0f1f570`.
- The `cli/hexa-energy.hexa` CLI is a **placeholder dispatcher** (group-level routing + selftest + status). Numerical kernels are deferred.
- `selftest` PASS = 14 verb directories present. It does **not** imply any empirical claim has been validated.

---

### Install

```bash
# Recommended (post-hx install registration):
hx install hexa-energy@1.0.0
hexa-energy --version          # → 1.0.0

# Or git clone (works today):
git clone https://github.com/need-singularity/hexa-energy.git ~/.hexa-energy
export HEXA_ENERGY_ROOT=~/.hexa-energy
export PATH="$HEXA_ENERGY_ROOT/cli:$PATH"
hexa-energy selftest
```

#### Quickstart

```bash
hexa-energy selftest                # 14-verb directory sentinel sweep
hexa-energy status                  # 7-group table + verdict + caveats
hexa-energy battery                 # group routing → battery_arch, battery_energy
hexa-energy nuclear                 # group routing → nuclear, smr_dc, dc_reactor
hexa-energy grid                    # group routing → grid, pv_microgrid, solar
hexa-energy fuel-cell               # group routing → pemfc
hexa-energy thermal                 # group routing → hvac, thermal
hexa-energy mining                  # group routing → mineshaft
hexa-energy meta                    # group routing → arch, efficiency
```

---

### Cross-link

`hexa-energy` is the **source-side** energy substrate. Three sibling repos handle the axes intentionally excluded here:

| Sibling                                  | Scope                                                              | Why separate                                       |
|------------------------------------------|--------------------------------------------------------------------|----------------------------------------------------|
| [`hexa-fusion`](https://github.com/need-singularity/hexa-fusion) | fusion-powerplant + tabletop-fusion                                | Distinct frontier physics; deserves its own falsifier preregister. |
| [`hexa-rtsc`](https://github.com/need-singularity/hexa-rtsc)     | room-temp-sc + superconductor                                      | Material-science axis with its own deadline + risk profile.        |
| [`hexa-earth`](https://github.com/need-singularity/hexa-earth)   | carbon-capture · environmental-protection · climate adaptation     | Climate is a *sink* for energy, modelled separately.               |

Sister substrate (life): [`hexa-bio`](https://github.com/need-singularity/hexa-bio).

---

### Provenance

- Extracted from `n6-architecture/domains/energy/` at SHA `c0f1f570` (2026-05-06).
- Original specs remain canonical in n6-architecture; this repo is a verbatim cp -R of the 14 selected subdomains, repackaged as a public MIT substrate.
- Sister extraction pattern: `hexa-bio` v1.0.0 (2026-05-04).

### License

MIT — see [LICENSE](LICENSE).

Author: 박민우 <nerve011235@gmail.com>
