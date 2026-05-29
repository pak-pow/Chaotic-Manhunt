# Chaos Manhunt

A fully featured Manhunt datapack for **Minecraft Java Edition 1.21.10** (pack_format: 69).
This is a server-side-only datapack. No client installation needed. Compatible with Vanilla, Fabric, and Forge servers.

---

## ⚔️ Core Game Rules
- **1 Runner vs multiple Hunters**
- **Runner goal**: Kill the Ender Dragon before the timer runs out.
- **Hunter goal**: Kill the Runner twice before the Dragon dies.
- **Runner has 2 lives**: Die once, respawn with brief immunity. Die twice, Hunters win.
- **Time limit**: 45 minutes total (Dread Clock). If time runs out, Hunters win.
- **Kill Bonus**: If the Runner kills a Hunter, +10 minutes is added to the clock (once per unique Hunter).

## 🚀 How to Play

1. Drop the `Chaos_Manhunt/` folder into your world's `datapacks` directory.
2. Run `/reload` in-game.
3. You should see `[CHAOS MANHUNT] Loaded! Use /trigger manhunt_random to begin.`
4. Wait for all players to join.
5. Run `/trigger manhunt_random` to randomly assign teams and begin the sequence.

> **Note:** All players must be online before running `/trigger manhunt_random`. The pick sequence assigns roles automatically.

### Admin Commands
| Command | Effect |
|---|---|
| `/trigger manhunt_random` | Starts the pick sequence (lottery reel animation) |
| `/trigger manhunt_start` | Skip pick sequence — force-starts headstart immediately |
| `/trigger manhunt_pause` | Toggle pause/resume |
| `/trigger manhunt_skip` | Skip the current random event |

## ✨ Features
- **Dread Clock**: Every 10 minutes, the game escalates (Hunters get Speed, compass updates faster, Runner gets Weakness/Glowing).
- **Chaos Events**: Every 8-12 minutes, a random event occurs (Meteor Strike, Thunder Surge, Blackout, Undead Surge, Hellfire, Dimension Pulse).
- **Powerups**: Special items (Carrot on a Stick) that grant unique abilities to the Runner or Hunters.

---

## 🏗️ Architecture Decisions

### Compass Tracking
Uses **function macros** (`$` prefix on command lines) introduced in 1.20.2. Storage `manhunt:tracking` holds `RunnerX`, `RunnerY`, `RunnerZ`, `RunnerDim` as integers and a dimension string. Each tracking cycle calls the macro function as each Hunter, injecting coordinates directly into the offhand compass item via `item replace`. `tracked:false` means no physical Lodestone is needed.

### Random Event RNG
Uses `scoreboard players random` (1.20.2+) instead of loot-table dummy entities. Clean and dependency-free.

### Dragon Kill Detection
Advancement `dragon_killed` uses `player_killed_entity` trigger with entity type `minecraft:ender_dragon`. The reward function `win/runner_wins` guards `team=Runner` internally, so Hunters killing the dragon don't trigger a win.

### Hunter Kill Bonus
Uses an advancement (`hunter_kill_bonus`) that fires when any player kills a Hunter-team player. The reward function revokes itself via `advancement revoke @s only manhunt:hunter_kill_bonus` so it can fire again on the next kill. A `mh.justdied` tag (set in `tracking/on_hunter_death`) identifies WHICH Hunter was just killed, and `mh.killed=0` ensures uniqueness.

### Hunter Respawn Delay
Per-Hunter `mh.spectator` score = `deaths × 200 ticks`. Each tick while `mh.spectator > 0`, `hunter_spectate_tick` forces gamemode spectator and decrements the timer. On expiry, restores survival and teleports to nearest living Hunter using the tag-exclusion pattern.

### Powerup Detection
Uses `execute if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[custom_data~{manhunt_powerup:"..."}]` — the `~` operator for partial NBT match on the `custom_data` component. This is 1.20.5+ syntax, available in 1.21.10.

---

## 📂 File Map

```
Chaos_Manhunt/
├── pack.mcmeta                              pack_format 69
├── data/minecraft/tags/function/
│   ├── load.json                            → setup/init
│   └── tick.json                            → loop/main
└── data/manhunt/
    ├── advancement/
    │   ├── dragon_killed.json               → win/runner_wins
    │   └── hunter_kill_bonus.json           → timer/kill_bonus_check
    ├── loot_table/powerups/
    │   ├── runner_chest.json                Phantom Cloak/Dash/Decoy×10, Lifeline×1
    │   └── hunter_chest.json                True Sight/Tracker/Bloodlust/Sabotage×10
    └── function/
        ├── setup/       init · headstart · headstart_end
        ├── loop/        main (tick router)
        ├── admin/       triggers · toggle_pause · resume_game · skip_event
        ├── pick_sequence/ start · animate · flash_fast · flash_slow
        │                  begin_slowdown · reveal · show_roles · assign
        ├── tracking/    loop · do_update · update_compass (macro)
        │                update_compass_decoy (macro) · alert_nether/end/overworld
        │                on_hunter_death · hunter_spectate_tick · tp_to_nearest_hunter
        ├── timer/       tick · do_tick · kill_bonus_check · process_kill_bonus · grant_bonus
        ├── lives/       check · on_death · lose_life_1
        ├── dread_clock/ tick · milestone_15/25/35/40
        ├── events/      engine · pick_and_start · countdown_3/2/1/fire
        │                meteor_strike · thunder_surge · blackout · undead_surge
        │                hellfire · dimension_pulse · dimension_pulse_end
        ├── powerups/    check_use · activate · deliver_hunter_powerup
        │                phantom_cloak · dash · decoy_ping · decoy_activate · decoy_end
        │                lifeline · true_sight · tracker_pulse · tracker_ping
        │                bloodlust · sabotage
        └── win/         runner_wins · hunters_win_death · hunters_win_timeout
```

---

## ⚠️ Known Limitations & Next Steps

- **Chest loot injection** — Runner powerups are in `loot_table/powerups/runner_chest.json` but are NOT yet automatically injected into village/temple/dungeon chests. To do this, you would add `data/manhunt/loot_tables/...` override files targeting the vanilla chest loot tables, or use a global loot modifier (requires Fabric/Forge). For vanilla-only, use `/loot give @a loot manhunt:powerups/runner_chest` to hand items to the Runner manually.
- **Decoy Ping fake coordinates** — Currently points to X:500, Y:Runner's Y, Z:0 as the decoy. A more convincing decoy would use a random offset from the Runner's real position. This requires math that's complex in pure vanilla — scoreboard arithmetic to add offsets.
- **Multi-Runner support** — The current system assumes exactly 1 Runner. Multiple Runners would require iterating team members differently.
- **Testing shortcuts** — To test specific states:
  - `/scoreboard players set $game mh.state 3` — skip to active game
  - `/team join Runner <name>` — manually assign Runner
  - `/scoreboard players set $runner mh.timer 200` — set timer to 10s for quick timeout test
  - `/scoreboard players set $game mh.realtime 17980` — test Dread Clock 15-min milestone in ~1 second
