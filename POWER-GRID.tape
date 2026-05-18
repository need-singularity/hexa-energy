#!/usr/bin/env tape

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "power_grid" :: identity-claim [d=2026-05-14 active]
  kind = "궁극의 전력망 아키텍처 — HEXA-GRID"
  brief = "n=6 완전수 산술 기반의 궁극의 전력망 설계."
  parent = "dancinlab/hexa-energy"
  sibling-md = "POWER-GRID.md"

# ─── §Log (append @A / @D events here, chronological) ────────────────
# 
# Pre-existing log entries live in POWER-GRID.md.
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
