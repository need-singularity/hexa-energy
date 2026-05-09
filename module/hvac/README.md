# module/hvac — hvac verb (group: thermal)

> Per-verb module of the **hexa-energy** substrate (HEXA family). Part of
> the n=14 verb / 7-group lattice (own 1 / own 2). Verb status at v1.0.0:
> **SPEC_FIRST** (own 5) — markdown spec extracted verbatim from upstream;
> 0/14 verbs ship a working kernel.

## Identity

- **Verb**: `hvac`
- **Group**: `thermal` (one of 7 — battery / nuclear / grid / fuel-cell / thermal / mining / meta)
- **Primary spec**: [`hvac-system.md`](hvac-system.md)
- **Upstream**: `canon/domains/energy/hvac-system/` @ `c0f1f570` (extracted 2026-05-06)

## What's in this module

The primary spec is [`hvac-system.md`](hvac-system.md), a verbatim extraction
from upstream. Any sub-scale assets (sub-directories, helper `.hexa` files)
that lived under the upstream directory are preserved verbatim alongside it.

For the AI-agent handoff (invariants, edit policy, common tasks), see
[`README.ai.md`](README.ai.md).

## Substrate context

This verb is one of 2 verbs in the thermal group.
For the full integration topology and group ledger see
[`../../core/energy/domain.md`](../../core/energy/domain.md) §4.3 and §8.

## Wire status

| | |
|---|---|
| spec markdown | ✅ present (extracted verbatim from upstream) |
| working kernel | ☐ TBD (no kernel yet) |
| selftest | sentinel only (`module/hvac/` directory present) |

To wire this verb: add `verify_hvac.{hexa,py}` that auto-derives ≥ 1
quantitative claim from `hvac-system.md`, register the call from
`../../verify/energy_verify.py`, then promote the wired count in
`../../core/energy/spec.md` §6 EVOLVE + `../../hexa.toml [closure]` +
`../../cli/hexa-energy.hexa` cmd_status.
