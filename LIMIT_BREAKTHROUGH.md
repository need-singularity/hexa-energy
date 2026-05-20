<!-- @created: 2026-05-12 -->
<!-- @sister: LATTICE_POLICY.md §1.2 -->
---
project: hexa-energy
domain: Energy substrate — 14-verb battery + nuclear + grid + thermal + mining + meta bundle
limits_audited: 8
breakthrough_candidates: 3
hard_walls: 4
soft_walls: 2
unclear: 2
---

# LIMIT_BREAKTHROUGH.md — hexa-energy

## §1 Domain identification

`hexa-energy` is the 14-verb energy substrate covering battery (8 scales:
earphone → smartphone → laptop → drone → home-ESS → EV → ESS → grid),
data-centre reactor, HVAC, grid, energy-efficiency, mining and a meta-
axis. It is sister to `hexa-earth` (climate cousin) and references
out-of-scope siblings `hexa-fusion`, `hexa-antimatter`, `hexa-rtsc`.

The *infrastructure* nature of hexa-energy is: an energy-conversion and
storage modelling surface. Real limits split into (a) thermodynamic
ceilings (Carnot, 2nd law) that no engine can pass, (b) photovoltaic /
wind theoretical ceilings (Shockley-Queisser, Betz), (c) battery
energy-density ceilings (electrochemistry → Li-air theoretical floor),
(d) grid-scale resource limits (Li, Ni, Co, REE reserves), all of which
must be cited at standard agencies (DOE / IEA / EIA / USGS).

## §2 Real limits applicable to this project

| # | Limit | Class | Source / value | Applicability to hexa-energy |
|---|-------|-------|----------------|------------------------------|
| L1 | Carnot ceiling | physics | η ≤ 1 − T_c/T_h; combined-cycle GT at T_h ≈ 1700 K, T_c ≈ 300 K → η_max ≈ 0.82, SOTA ≈ 0.64 (Mitsubishi M501JAC) | Caps every thermal verb (HVAC reverse-cycle, dc_reactor, grid-scale thermal generation). |
| L2 | Shockley-Queisser limit | physics | η_max ≈ 33.7 % single-junction Si (E_g = 1.34 eV); multi-junction → ≈ 47 % (3J) / ~68 % (∞-J, AM1.5) | Caps any PV claim in the solar-coupled verbs; multi-junction is the breakthrough vector. |
| L3 | Betz limit (wind) | physics | η ≤ 16/27 ≈ 59.3 % | Caps wind contribution to grid-coupled verbs. |
| L4 | Battery energy density (Li-ion → Li-air) | engineering/chem | Li-ion practical ~250–300 Wh/kg (cell); Li-S theoretical ~2,500 Wh/kg; Li-air theoretical ~3,460 Wh/kg | Caps battery_arch, battery_energy and BATTERY-SCALE-1..8 across the 8-scale ladder. |
| L5 | 2nd law / Landauer for storage round-trip | physics | Every charge/discharge has ΔS ≥ 0; round-trip η < 1 by an amount tied to electrochemistry | RTE caps for grid ESS (L8) and EV (L6) verbs; Li-ion RTE ~92–95 %, redox-flow ~75–85 %. |
| L6 | Mineral reserves — Li, Co, Ni, Cu, REE | engineering | USGS 2024 — Li 26 Mt, Co 8.3 Mt, Ni 100 Mt, Cu 1 Gt | Caps the mining verb and binds long-horizon scaling of battery_scale_6/7/8 + grid. |
| L7 | Solar constant on Earth surface | physics | S₀ ≈ 1361 W/m²; clear-sky surface ≈ 1000 W/m² AM1.5 | Caps the maximum collectable PV flux per m² before efficiency multiplies. |
| L8 | Grid voltage stability / Loss-of-Load Probability | engineering | NERC LOLE target ≤ 0.1 d/yr; sub-second frequency tolerance ±0.5 Hz on 60 Hz | Caps grid-verb dispatchability — sets reliability ceiling under high-penetration variable renewables. |

(Skipped: lattice / n=14 verb-count is organising vocabulary; LATTICE_
POLICY §1.3.)

## §3 Per-limit breakthrough assessment

| Limit | Class | Current state | Breakthrough vector | Trigger metric |
|-------|-------|---------------|---------------------|----------------|
| L1 Carnot | HARD_WALL | Combined-cycle ~0.64 / theoretical 0.82 | None for η_max; engineering can lift T_h with new alloys/ceramics | A claim of η > 0.82 at given T_c/T_h ⇒ falsified |
| L2 Shockley-Queisser | HARD_WALL (single-junction) / SOFT (multi-junction) | Si SOTA ~26.8 % (NREL chart); multi-junction lab > 47 % | Multi-junction, perovskite-tandem, hot-carrier, intermediate-band cells | Tandem cell ≥ 35 % in commercial module |
| L3 Betz | HARD_WALL | Modern HAWTs realise C_p ≈ 0.45–0.50 vs 0.593 | None for C_p; lift toward Betz via better airfoils, larger swept area | Field C_p ≥ 0.55 (rotor-averaged) |
| L4 Battery energy density | BREAKABLE_WITH_TECH | Li-ion ~280 Wh/kg cell SOTA; Li-S commercial ~400 Wh/kg | Solid-state Li, Li-S, Li-air; anode silicon-dominant; sulfide electrolytes | EV cell ≥ 500 Wh/kg in mass production |
| L5 RTE / 2nd-law on storage | SOFT_WALL | Li-ion ~92–95 %; redox-flow ~75–85 % | Closer to reversible electrochemistry; lower overpotentials; cryo-mode | Grid-scale RTE ≥ 90 % at ≥ 8-hr duration |
| L6 Mineral reserves | UNCLEAR | USGS reserves are economic; resources >> reserves | Recycling (closes loop), seabed nodules, asteroid mining (`hexa-space`), substitution (Na-ion, Fe-air) | Material-intensity of grid storage falls > 50 % vs 2024 baseline |
| L7 Solar surface flux | HARD_WALL | 1000 W/m² AM1.5 standard | None — orbital PV (space-based solar) lifts the *per-m²-of-collector* number but introduces transmission losses; couples to `hexa-space` | n/a at Earth surface |
| L8 Grid LOLE / stability | BREAKABLE_WITH_TECH | NERC LOLE target 0.1 d/yr; high-VRE penetration challenges met by reserves + storage + grid-forming inverters | Grid-forming inverter SOTA, long-duration storage, multi-region HVDC interconnect | LOLE ≤ 0.1 d/yr at ≥ 80 % VRE share |

## §4 Top-3 breakthrough opportunities (this project)

1. **L4 — Battery energy density (cells → 500 Wh/kg).** Highest leverage
   across 8 battery-scale verbs simultaneously. Solid-state Li / Li-S
   roadmaps (DOE Battery500, IEA Energy Technology Perspectives 2024)
   put 500 Wh/kg within reach in this decade. Concrete trigger: at
   least one BATTERY-SCALE verb cites a real cell vendor at ≥ 500
   Wh/kg. Risk: medium (manufacturing yield).
2. **L2 — PV via multi-junction / perovskite tandem.** Single-junction
   Si is approaching its Shockley-Queisser asymptote; perovskite-Si
   tandems at NREL have crossed 33 % in cells. Roadmap to commercial
   modules ≥ 35 % is the binding engineering challenge. Risk: medium
   (perovskite stability).
3. **L8 — Grid stability under high VRE share.** Grid-forming inverters
   plus long-duration storage (8–100 hr) plus multi-region HVDC drop
   LOLE below NERC target even at 80 % VRE. This is the most
   *system-engineering*-heavy of the three. Risk: low-medium (proven
   pilot, scaling is the binding step).


- The 8-scale BATTERY ladder is organising vocabulary; the only real
  invariant is electrochemistry (cell-level Wh/kg / Wh/L / cycle life).
  A scale-by-scale claim must cite Wh/kg, NOT lattice partition.
- Carnot (L1), Betz (L3), Shockley-Queisser single-junction (L2), and
  surface solar flux (L7) are HARD physical walls. Any verb output
  exceeding them is falsified, no matter how elegant the lattice fit.
- Battery "theoretical" energy densities for Li-S (2,500 Wh/kg) and
  Li-air (3,460 Wh/kg) are *active-material only*; full pack-level
  densities are 30–50 % of cell-level due to packaging, BMS, thermal.
- Mineral reserves (L6) is the most uncertain limit — under high
  recycling rates and Na-ion / Fe-air substitution, the Li ceiling
  effectively moves. Honest framing: the *resource* (vs reserve)
  number is ≈10× larger but extraction grade falls.
- Fusion and antimatter ceilings are out-of-scope by design (delegated
  to `hexa-fusion` / `hexa-antimatter`). No claim here.
- Solar constant 1361 W/m² is a stellar parameter; no engineering
  raises it. Space-based PV defers the budget to `hexa-space`.

## §6 References

- `LATTICE_POLICY.md` §1.2 (universal real-limits standard, 2026-05-12)
- NREL Best Research-Cell Efficiency Chart (2025 rev., Shockley-Queisser anchor)
- DOE Battery500 Consortium — pathway to 500 Wh/kg
- IEA Energy Technology Perspectives 2024
- USGS Mineral Commodity Summaries 2024 (Li / Co / Ni / Cu / REE)
- NERC State of Reliability Report 2024 — LOLE target
- Shockley & Queisser, *J. Appl. Phys.* 32, 510 (1961)
- Betz (1919), Carnot (1824)
