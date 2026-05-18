#!/usr/bin/env tape

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "amd_ree_mineshaft_phes" :: identity-claim [d=2026-05-14 active]
  kind = "HEXA-AMD-REE-MINESHAFT-PHES mk1 — physical-limit-anchored acid-mine-drainage REE recovery + decommissioned-shaft pumped hydroelectric storage"
  brief = "AMD-REE-MINESHAFT-PHES per-domain ledger · sibling of AMD-REE-MINESHAFT-PHES.md"
  parent = "dancinlab/hexa-energy"
  sibling-md = "AMD-REE-MINESHAFT-PHES.md"

# ─── §Log (append @A / @D events here, chronological) ────────────────
# 
# Pre-existing log entries live in AMD-REE-MINESHAFT-PHES.md.
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
