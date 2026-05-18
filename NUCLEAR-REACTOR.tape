#!/usr/bin/env tape

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "nuclear_reactor" :: identity-claim [d=2026-05-14 active]
  kind = "ultimate of nuclear reactor (HEXA-REACTOR)"
  brief = "HEXA-REACTOR n=6 perfect number structure axisas threea waterli/engineering limit breakthrough-pattern. core 5 kinds:"
  parent = "dancinlab/hexa-energy"
  sibling-md = "NUCLEAR-REACTOR.md"

# ─── §Log (append @A / @D events here, chronological) ────────────────
# 
# Pre-existing log entries live in NUCLEAR-REACTOR.md.
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
