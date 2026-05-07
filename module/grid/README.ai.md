# module/grid — AI-native handoff

> Conformance: hive raw 271 (readme-ai-native-mandate). This file is the
> canonical entry point for AI agents operating on this verb-module.
> Human entry point is [`README.md`](README.md).

## Identity

- **Verb**: `grid` (group: `grid`)
- **Parent (canonical SSOT)**: `../../core/energy/domain.md` (numerical SSOT, own 4)
- **Upstream**: `n6-architecture/domains/energy/power-grid/` @ `c0f1f570`
- **Status**: SPEC_FIRST (own 5) — markdown spec only at v1.0.0

## Edit invariants

1. **Numerical SSOT is `../../core/energy/domain.md`** (own 4). If a
   number in [`power-grid.md`](power-grid.md) diverges from `domain.md`,
   reconcile by updating either side — do NOT leave the divergence.
2. **Verb roster is contractual** (own 1). Do not rename `grid` or move
   this directory without going through the 5-surface update procedure
   (domain.md → spec.md → hexa.toml → cli VERB_DIRS → verify expected).
3. **Group membership is contractual** (own 2). `grid` belongs to group
   `grid`. Do not silently reassign.
4. **Additive-only at the doc layer**. Renames or removals of files in this
   module require updating `../../doc/lineage/origin.md` and adding a
   redirect note.
5. **No T2 → T2 imports**. Cross-verb references go through T1
   (`../../core/energy/domain.md` §4.3 integration topology), not via a
   sibling `module/<other_verb>/`.

## Common agent tasks

| Task | Where |
|---|---|
| Read the spec | [`power-grid.md`](power-grid.md) |
| Tweak a number | First update `../../core/energy/domain.md`, then mirror here |
| Wire this verb | Add `verify_grid.{hexa,py}`, register from `../../verify/energy_verify.py`, propagate wired count to spec.md/hexa.toml/cli |
| Cross-link sibling verb | Reference via `../../core/energy/domain.md` §4.3, NOT via `module/<other>` import |
| Run invariant audit | `python3 ../../verify/energy_verify.py` (verb_sentinel must include this dir) |

## Lineage

Extracted from `n6-architecture/domains/energy/power-grid/` on 2026-05-06
(SHA `c0f1f570`). Moved from repo root into `module/grid/` on 2026-05-07
during structural restructure to the hexa-sscb canonical pattern (see
`../../doc/lineage/origin.md`).
