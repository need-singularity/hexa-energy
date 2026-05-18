#!/usr/bin/env tape

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "battery_scale_4_drone" :: identity-claim [d=2026-05-14 active]
  kind = "Battery 8-stage — Stage 4: drone/e-mobility (0.5~5 kWh)"
  brief = "<!-- @own(sections=[WHY, COMPARE, n=6 parameter mapping, STRUCT, FLOW, Manufacturer mapping, Physical limits, Verification summary, DSE exhaustive search, BT breakthrough nodes, Impossibility theorem "
  parent = "dancinlab/hexa-energy"
  sibling-md = "BATTERY-SCALE-4-DRONE.md"

# ─── §Log (append @A / @D events here, chronological) ────────────────
# 
# Pre-existing log entries live in BATTERY-SCALE-4-DRONE.md.
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
