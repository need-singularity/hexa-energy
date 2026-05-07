# core/energy/doc/groups.md — group · verb cross-reference

> Per-feature deep dive holder (sscb pattern: `core/<feature>/doc/`). Initial
> content is a flat cross-reference table; deeper per-verb dives can land
> here as separate `<group>.md` files when individual verbs wire up.

## 7-group → 14-verb cross-reference

| Group | Verb | Module path | Wired? |
|---|---|---|---|
| battery | battery_arch | `module/battery_arch/` | ☐ |
| battery | battery_energy | `module/battery_energy/` | ☐ (candidate: `verify_battery-energy.hexa`) |
| nuclear | nuclear | `module/nuclear/` | ☐ |
| nuclear | smr_dc | `module/smr_dc/` | ☐ |
| nuclear | dc_reactor | `module/dc_reactor/` | ☐ |
| grid | grid | `module/grid/` | ☐ |
| grid | pv_microgrid | `module/pv_microgrid/` | ☐ |
| grid | solar | `module/solar/` | ☐ (helper: `real-world-solar-calculator.hexa`) |
| fuel-cell | pemfc | `module/pemfc/` | ☐ |
| thermal | hvac | `module/hvac/` | ☐ |
| thermal | thermal | `module/thermal/` | ☐ |
| mining | mineshaft | `module/mineshaft/` | ☐ |
| meta | arch | `module/arch/` | ☐ |
| meta | efficiency | `module/efficiency/` | ☐ |

Wired status updates land here first, then propagate to:
- `core/energy/spec.md` §6 EVOLVE (Mk-ladder)
- `hexa.toml [closure].verbs_wired`
- `cli/hexa-energy.hexa` cmd_status output
- `README.md` badge counts

(own 5 promotion procedure.)

## How groups compose downstream

The 7 groups partition the 14 verbs but downstream consumers compose across
groups. Common compositions (none validated at v1.0.0):

- **Residential PV-ESS microgrid**: `solar` (grid group) + `battery_arch` /
  `battery_energy` (battery group) + `pv_microgrid` (grid group)
- **Datacenter-reactor stack**: `smr_dc` / `dc_reactor` (nuclear group) +
  `thermal` (thermal group) + `efficiency` (meta group)
- **Building HVAC + heat-pump**: `hvac` (thermal group) + `pemfc` (fuel-cell
  group, when configured as CHP) + `efficiency` (meta group)
- **Long-duration storage**: `mineshaft` (mining group, PHES) +
  `battery_arch` (battery group, scale-8-grid)

These compositions are documented per-verb in `module/<verb>/<verb>.md`; this
file is the index, not the wire.

## Pointer back to upstream

For provenance of each verb spec markdown, see
[`../../doc/lineage/origin.md`](../../../doc/lineage/origin.md) "Verb roster
— file-by-file provenance".
