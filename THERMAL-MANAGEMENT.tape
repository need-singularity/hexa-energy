#!/usr/bin/env tape

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "thermal_management" :: identity-claim [d=2026-05-14 active]
  kind = "궁극의 열관리 아키텍처 — HEXA-COOL"
  brief = "**Zero thermal throttling --- every watt becomes useful work.**"
  parent = "dancinlab/hexa-energy"
  sibling-md = "THERMAL-MANAGEMENT.md"

# ─── §Log (append @A / @D events here, chronological) ────────────────
# 
# Pre-existing log entries live in THERMAL-MANAGEMENT.md.
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
