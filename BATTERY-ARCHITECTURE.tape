#!/usr/bin/env tape

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "battery_architecture" :: identity-claim [d=2026-05-14 active]
  kind = "HEXA-BATTERY — 궁극의 배터리 8단 완전 아키텍처"
  brief = "**Rating**: 🛸10 (Physical Limits Reached) | **BTs**: BT-27,43,57,80~84 | **DSE**: 3,750 -> 1,908 compatible"
  parent = "dancinlab/hexa-energy"
  sibling-md = "BATTERY-ARCHITECTURE.md"

# ─── §Log (append @A / @D events here, chronological) ────────────────
# 
# Pre-existing log entries live in BATTERY-ARCHITECTURE.md.
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
