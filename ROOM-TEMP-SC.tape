#!/usr/bin/env tape

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "room_temp_sc" :: identity-claim [d=2026-05-14 active]
  kind = "room-temp-sc"
  brief = "TODO: 후속 돌파 필요"
  parent = "dancinlab/hexa-energy"
  sibling-md = "ROOM-TEMP-SC.md"

# ─── §Log (append @A / @D events here, chronological) ────────────────
# 
# Pre-existing log entries live in ROOM-TEMP-SC.md.
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
