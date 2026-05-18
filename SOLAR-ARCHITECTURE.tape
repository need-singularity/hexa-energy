#!/usr/bin/env tape

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "solar_architecture" :: identity-claim [d=2026-05-14 active]
  kind = "궁극의 태양전지 --- HEXA-SOLAR 완전 아키텍처"
  brief = "**도메인**: Solar Architecture | **등급**: 🛸10 (물리적 한계 도달) | **DSE**: 1,584 조합 | **EXACT**: 43.3%"
  parent = "dancinlab/hexa-energy"
  sibling-md = "SOLAR-ARCHITECTURE.md"

# ─── §Log (append @A / @D events here, chronological) ────────────────
# 
# Pre-existing log entries live in SOLAR-ARCHITECTURE.md.
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
