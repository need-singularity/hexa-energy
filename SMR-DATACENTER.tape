#!/usr/bin/env tape

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "smr_datacenter" :: identity-claim [d=2026-05-14 active]
  kind = "HEXA-REACTOR: 데이터센터용 소형 원자로 (SMR) — 궁극의 아키텍처"
  brief = "σ(6)·φ(6) = n·τ(6) ⟺ n = 6 (유일 해)"
  parent = "dancinlab/hexa-energy"
  sibling-md = "SMR-DATACENTER.md"

# ─── §Log (append @A / @D events here, chronological) ────────────────
# 
# Pre-existing log entries live in SMR-DATACENTER.md.
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
