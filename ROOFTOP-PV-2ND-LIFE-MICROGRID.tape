#!/usr/bin/env tape

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "rooftop_pv_2nd_life_microgrid" :: identity-claim [d=2026-05-14 active]
  kind = "HEXA-ROOFTOP-PV-2ND-LIFE-MICROGRID mk1 — physical-limit-anchored South Africa anchor-site microgrid"
  brief = "ROOFTOP-PV-2ND-LIFE-MICROGRID per-domain ledger · sibling of ROOFTOP-PV-2ND-LIFE-MICROGRID.md"
  parent = "dancinlab/hexa-energy"
  sibling-md = "ROOFTOP-PV-2ND-LIFE-MICROGRID.md"

# ─── §Log (append @A / @D events here, chronological) ────────────────
# 
# Pre-existing log entries live in ROOFTOP-PV-2ND-LIFE-MICROGRID.md.
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
