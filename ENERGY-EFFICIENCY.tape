#!/usr/bin/env tape

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "energy_efficiency" :: identity-claim [d=2026-05-14 active]
  kind = "AI Energy Efficiency: Mathematical Discoveries from Number Theory for Reducing AI Energy Consumption"
  brief = "**TECS-L Research Group | 2026-03-26 | Updated 2026-03-27**"
  parent = "dancinlab/hexa-energy"
  sibling-md = "ENERGY-EFFICIENCY.md"

# ─── §Log (append @A / @D events here, chronological) ────────────────
# 
# Pre-existing log entries live in ENERGY-EFFICIENCY.md.
# New per-domain history entries land here as typed events:
#
#   @A commit_<hash> :: <domain> [d=<YYYY-MM-DD> ok]
#     <- <prev-id>
#     => "<one-line description>"
#
#   @D <id> := "<decision-name>" :: <domain> [<grades>]
#     <- <evidence-id>
#     |> <verifier>
#
# See ~/core/tape/spec/tape.md for full grammar.
