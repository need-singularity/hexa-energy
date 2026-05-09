# hexa-energy v1.0.0 — Energy substrate (HEXA family)

**Release date**: 2026-05-06
**Closure verdict**: **SPEC_FIRST** (0/14 verbs wired; 14/14 markdown specs extracted)
**Provenance**: `canon/domains/energy/` @ `c0f1f570`

> **Cross-link** (load-bearing — fusion·RT-SC are NOT here):
> fusion → [`need-singularity/hexa-fusion`](https://github.com/need-singularity/hexa-fusion) ·
> RT-SC → [`need-singularity/hexa-rtsc`](https://github.com/need-singularity/hexa-rtsc) ·
> climate cousin → [`need-singularity/hexa-earth`](https://github.com/need-singularity/hexa-earth)

This is the **initial standalone release** of `hexa-energy`, a 14-verb / 7-group Energy substrate consolidating battery, nuclear, grid, fuel-cell, HVAC, and mineshaft specs into a single MIT-licensed public substrate. Sister-extraction of `hexa-bio` v1.0.0 (2026-05-04).

## Highlights

- **14-verb / 7-group taxonomy**:
  | Group       | Verbs                                    |
  |-------------|------------------------------------------|
  | battery     | `battery_arch`, `battery_energy`         |
  | nuclear     | `nuclear`, `smr_dc`, `dc_reactor`        |
  | grid        | `grid`, `pv_microgrid`, `solar`          |
  | fuel-cell   | `pemfc`                                  |
  | thermal     | `hvac`, `thermal`                        |
  | mining      | `mineshaft`                              |
  | meta        | `arch`, `efficiency`                     |

- **Placeholder CLI dispatcher** — `cli/hexa-energy.hexa` routes to all 7 groups + ships `status`, `selftest`, `--version`, `help`. Numerical kernels deferred.
- **Selftest** — `__HEXA_ENERGY_SELFTEST__ PASS` confirms 14 verb directories are present (sentinel-only PASS does NOT validate any empirical claim).
- **MIT licensed** — permissive, no copyleft, no aux deps required at v1.0.0.
- **GitHub canonical** — `https://github.com/need-singularity/hexa-energy`.

## Installation

```bash
# Recommended (post-hx install registration):
hx install hexa-energy@1.0.0
hexa-energy --version           # → 1.0.0

# Or git clone (works today):
git clone https://github.com/need-singularity/hexa-energy.git ~/.hexa-energy
export HEXA_ENERGY_ROOT=~/.hexa-energy
export PATH="$HEXA_ENERGY_ROOT/cli:$PATH"
hexa-energy selftest
```

## Quickstart

```bash
hexa-energy selftest                # 14-verb sentinel sweep
hexa-energy status                  # 7-group table + verdict + caveats
hexa-energy battery                 # group routing
hexa-energy nuclear
hexa-energy grid
hexa-energy fuel-cell
hexa-energy thermal
hexa-energy mining
hexa-energy meta
```

## Honest C3 caveats (raw#10)

1. **Spec-first** — 0/14 verbs ship a working `.hexa` kernel at v1.0.0; markdown specs only.
2. **Fusion out of scope** — see `hexa-fusion`.
3. **RT-SC out of scope** — see `hexa-rtsc`.
4. **Climate out of scope** — carbon-capture / env-protection live in `hexa-earth`.
5. **Selftest sentinel-only** — PASS confirms verb dirs present, not empirical validation.

## Provenance

- Extracted from `canon/domains/energy/` at SHA `c0f1f570` (2026-05-06).
- Sister: `hexa-bio` v1.0.0 extraction pattern (2026-05-04).
- Single-commit initial release.

## License

MIT — see [LICENSE](LICENSE).

Author: 박민우 <nerve011235@gmail.com>
