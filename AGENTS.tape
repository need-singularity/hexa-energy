#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════════════
# .tape v1.2 — grammar primer (cold-read by any LLM / agent / human)
# ══════════════════════════════════════════════════════════════════════
# Form: each entry is `@<type> <id> := "<subject>" :: <kind> [<grades>]`
#       optionally followed by body lines (2-space indent) — key=value,
#       edges (<- -> => …), or quoted prose.
#
# ENTRY TYPES (17):
#   Runtime (10): @S session  @U user  @A assistant  @T tool-call  @R result
#                 @H hook  @D decision  @K cost  @P provider  @? anomaly
#   Foundation:   @I identity-claim
#   Declarative:  @X external-citation  @F forbidden-pattern  @N note
#                 @C config  @L layout  @V spec-version
#
# EDGES (12, on body lines, 2-space indent):
#   Causal:     <- caused-by   -> triggers   == continues
#               ~> supersedes  !! aborts     |> verified-by
#   Effect:     => produces (followed by quoted natural-language)
#   Structural: <: specializes  :> generalizes  ?> soft-depends
#               !> conflicts-with  @> projects-to (e.g. @> AGENTS.md)
#
# GRADE TAGS (in [...] on entry header):
#   Delivery:   ok · err · denied · cancelled · partial · superseded
#   Governance: required · recommended · optional · draft · active · deprecated
#   Scoped:     allow:<x> · deny:<x>
#   Time/index: T<n> (turn)  N<n> (wall-sec)  d=<YYYY-MM-DD>
#
# PAYLOAD SYNTAX (body lines):
#   key = "value"           single-line string
#   key = [a, b, c]         array literal
#   key <<~EOF              heredoc (multi-line; ends with EOF on own line)
#     multi-line text
#   EOF
#   "see [@x1] §3"          inline citation by entry id
#   `cmd or path`           backtick code-span (inline only)
#
# Full spec: ~/core/tape/spec/tape.md (or github.com/dancinlab/tape)
# ══════════════════════════════════════════════════════════════════════
#
# AGENTS.tape for `dancinlab/hexa-energy`

@V := "tape" :: spec [active]
  version = "1.2"

@X wilson_pool := "wilson pool — resource utilization" :: guide [active]
  tldr = "Heavy / deterministic work (build · drill · probe · compile · test-sweep · GPU fire) → do NOT serialize on localhost; route to the host pool: `wilson pool list` then `wilson pool on <host> <cmd>`, or a ToolUse `\"host\"` field. Empty roster = degrade-to-local, fine."
  detail = "~/core/atlas/POOL.tape"

@I id001 := "hexa-energy" :: identity-claim [d=2026-05-14 active]
  kind = "HEXA-Power family — energy systems"
  brief = "HEXA-Power family · energy systems"
  parent = "dancinlab"

@L l1 := "repo-layout" :: structure [active]
  .roadmap.hexa_energy -> "file"
  AGENTS.tape -> "this file · governance + identity (.tape v1.2)"
  AMD-REE-MINESHAFT-PHES.md -> "documentation"
  BATTERY-ARCHITECTURE.md -> "documentation"
  BATTERY-ENERGY.md -> "documentation"
  BATTERY-SCALE-1-EARPHONE.md -> "documentation"
  BATTERY-SCALE-2-SMARTPHONE.md -> "documentation"
  BATTERY-SCALE-3-LAPTOP.md -> "documentation"
  BATTERY-SCALE-4-DRONE.md -> "documentation"
  BATTERY-SCALE-5-HOME-ESS.md -> "documentation"
  BATTERY-SCALE-6-EV.md -> "documentation"
  BATTERY-SCALE-7-ESS.md -> "documentation"
  BATTERY-SCALE-8-GRID.md -> "documentation"
  CHANGELOG.md -> "change log"
  CITATION.cff -> "file"
  CLAUDE.md -> "symlink → AGENTS.tape"
  DATACENTER-REACTOR.md -> "documentation"
  ENERGY-ARCHITECTURE.md -> "documentation"
  ENERGY-EFFICIENCY.md -> "documentation"
  hexa.toml -> "TOML config"
  HVAC-SYSTEM.md -> "documentation"
  IMPORTED_FROM_CANON.md -> "documentation"
  install.hexa -> "hexa-lang source"
  LATTICE_POLICY.md -> "project-local copy of dancinlab real-limits standard"
  LICENSE -> "license file"
  LIMIT_BREAKTHROUGH.md -> "per-domain HARD/SOFT_WALL · BREAKABLE_WITH_TECH · UNCLEAR audit"
  NUCLEAR-REACTOR.md -> "documentation"
  PEMFC.md -> "documentation"
  POWER-GRID.md -> "documentation"
  README.ai.md -> "documentation"
  README.md -> "human intro · 18-block format (atlas/README-FORMAT.md)"
  RELEASE_NOTES_v1.0.0.md -> "documentation"
  ROOFTOP-PV-2ND-LIFE-MICROGRID.md -> "documentation"
  ROOM-TEMP-SC.md -> "documentation"
  SMR-DATACENTER.md -> "documentation"
  SOLAR-ARCHITECTURE.md -> "documentation"
  TAPE-AUDIT.md -> ".tape v1.x adoption audit ledger"
  THERMAL-MANAGEMENT.md -> "documentation"
  arch/ -> "subdir (1 items)"
  battery_arch/ -> "subdir (1 items)"
  battery_energy/ -> "subdir (1 items)"
  build/ -> "build artifacts (gitignored typically)"
  cli/ -> "subdir (1 items)"
  core/ -> "core implementation (1 items)"
  dc_reactor/ -> "subdir (1 items)"
  doc/ -> "documentation (2 items)"
  efficiency/ -> "subdir (1 items)"
  grid/ -> "subdir (1 items)"
  hvac/ -> "subdir (1 items)"
  mineshaft/ -> "subdir (1 items)"
  module/ -> "subdir (14 items)"
  nuclear/ -> "subdir (1 items)"
  origins/ -> "subdir (5 items)"
  papers/ -> "papers / publications (1 items)"
  pemfc/ -> "subdir (1 items)"
  pv_microgrid/ -> "subdir (1 items)"
  smr_dc/ -> "subdir (1 items)"
  solar/ -> "subdir (1 items)"
  state/ -> "runtime state (gitignored typically) (2 items)"
  tests/ -> "test suite (1 items)"
  thermal/ -> "subdir (1 items)"
  verify/ -> "verification scripts (3 items)"

@D g_inherit := "inherits-lattice-policy" :: governance [required]
  rule = "All echoes/LATTICE_POLICY.md rules apply — real-limits-first · lattice-is-tool · verification-anchor-real-limit · no-artificial-ceilings · honesty-obligation-external."
  authority = "[@x_lattice_policy]"
  @> AGENTS.md

@D g1 := "real-limits-first" :: governance [required]
  rule = "The project's ceiling is set by REAL math/physics/engineering limits, NEVER by the n=6 invariant lattice."
  authority = "[@x_lattice_policy]"
  @> AGENTS.md

@D g2 := "lattice-is-tool" :: governance [required]
  rule = "n=6 lattice is a TOOL, not a CONSTRAINT. Use only where it naturally fits."
  <: g1
  @> AGENTS.md

@D g3 := "honesty-obligation-external" :: governance [required deny:write]
  rule = "Claims about external entities (companies · fabs · vendors) must NOT include lattice-fit assertions. Use their OWN invariants."
  @> AGENTS.md

@D g4 := "commit-conventions" :: governance [recommended]
  rule = "AI-assisted commits include \`Co-Authored-By: <model> <noreply@anthropic.com>\` trailer; Conventional Commits title."
  @> AGENTS.md

@D g_arch_vs_log_split := "v1.2 architecture-vs-history split" :: governance [required d=2026-05-14 active]
  rule = "UPPERCASE.tape files are EDITABLE architecture (latest-wins per id). Append-only event history lives in UPPERCASE.log.tape siblings."
  why = "declarative entries (governance · config · layout · identity) evolve naturally; locking them as append-only via ~> supersedes creates noisy histories. The split lets architecture stay current and history stay immutable."
  applies-to = "AGENTS.tape · all UPPERCASE.tape root files"
  authority = "[@x_tape_spec] §Domain-tape sibling §Architecture-vs-history split"
  @> AGENTS.md


@F f1 := "lattice-fit-on-external-entity" :: governance [required deny:write]
  pattern = "applying n=6 lattice as derivation rule to TSMC · ASML · IPCC · NASA · SpaceX · CERN · DeepMind · NIST · or any external vendor"
  exception = "values may coincidentally match — observation OK, derivation NOT OK"

@X x_lattice_policy := "echoes/LATTICE_POLICY.md" :: policy [d=2026-05-12 active]
  url = "https://github.com/dancinlab/echoes/blob/main/LATTICE_POLICY.md"

@X x_tape_spec := "tape v1.2 spec" :: spec [d=2026-05-14 active]
  url = "https://github.com/dancinlab/tape/blob/main/spec/tape.md"
  scope = "this file's grammar reference"

@H h1 := "agents-md-replaced" :: generator [active]
  note = "AGENTS.md replaced by this AGENTS.tape (tape v1.2)"

@H h2 := "claude-md-symlink" :: generator [active]
  rule = "CLAUDE.md → AGENTS.tape symlink"
  command = `ln -sf AGENTS.tape CLAUDE.md`
