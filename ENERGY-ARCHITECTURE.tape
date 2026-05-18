#!/usr/bin/env tape

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "energy_architecture" :: identity-claim [d=2026-05-14 active]
  kind = "궁극의 에너지 통합 — HEXA-ENERGY 완전 아키텍처"
  brief = "n=6 원리로 핵융합+태양전지+배터리+송전망+열관리를 통합하는 궁극의 에너지 아키텍처."
  parent = "dancinlab/hexa-energy"
  sibling-md = "ENERGY-ARCHITECTURE.md"

# ─── §Log (append @A / @D events here, chronological) ────────────────
# 
# Pre-existing log entries live in ENERGY-ARCHITECTURE.md.
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
