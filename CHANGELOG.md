# Changelog — hexa-energy

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] — 2026-05-06

### Added

- **Initial standalone extraction** of the Energy substrate from
  `canon/domains/energy/` at SHA `c0f1f570`.
- **14 verbs across 7 groups** (verbatim `cp -R` of the source spec dirs):
  - `battery`     — `battery_arch`, `battery_energy`
  - `nuclear`     — `nuclear`, `smr_dc`, `dc_reactor`
  - `grid`        — `grid`, `pv_microgrid`, `solar`
  - `fuel-cell`   — `pemfc`
  - `thermal`     — `hvac`, `thermal`
  - `mining`      — `mineshaft`
  - `meta`        — `arch`, `efficiency`
- **`cli/hexa-energy.hexa`** placeholder dispatcher: 7 group sub-commands
  + `status` + `selftest` + `--version` + `help`.
- **`install.hexa`** hx package-manager hook (pre = no-op; post = quick
  selftest, warn-only).
- **`hexa.toml`** manifest (name=hexa-energy, version=1.0.0, license=MIT,
  verb-group taxonomy, crosslink table).
- **`tests/test_selftest.hexa`** — verifies the `__HEXA_ENERGY_SELFTEST__ PASS`
  sentinel via the CLI router (14-verb count check).
- **MIT LICENSE.**
- **README** with cross-link banner (fusion → `hexa-fusion`, RT-SC →
  `hexa-rtsc`, climate → `hexa-earth`) on the very first line.


1. v1.0.0 is **spec-first** — 0/14 verbs ship a working `.hexa` kernel.
2. Fusion is intentionally **out of scope** (→ `hexa-fusion`).
3. RT-SC (room-temp superconductor) is intentionally **out of scope**
   (→ `hexa-rtsc`).
4. Climate / carbon-capture / env-protection lives in the cousin substrate
   `hexa-earth`.
5. `selftest` PASS == 14 verb directories present; does NOT imply any
   empirical claim validation.

### Provenance

- Extracted from: `canon/domains/energy/` @ `c0f1f570`
- Sister-extraction reference: `hexa-bio` v1.0.0 (2026-05-04)
- Single-commit initial release.
