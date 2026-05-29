# Chaos Manhunt

A fully featured Manhunt datapack for **Minecraft Java Edition 1.21.10** (pack_format: 69).
This is a server-side-only datapack. No client installation needed. Compatible with Vanilla, Fabric, and Forge servers.

## Core Game Rules
- **1 Runner vs multiple Hunters**
- **Runner goal**: Kill the Ender Dragon before the timer runs out.
- **Hunter goal**: Kill the Runner twice before the Dragon dies.
- **Runner has 2 lives**: Die once, respawn with brief immunity. Die twice, Hunters win.
- **Time limit**: 45 minutes total (Dread Clock). If time runs out, Hunters win.
- **Kill Bonus**: If the Runner kills a Hunter, +10 minutes is added to the clock (once per unique Hunter).

## How to Play

1. Drop the folder into your world's `datapacks` directory.
2. Run `/reload` in-game.
3. Wait for all players to join.
4. Run `/trigger manhunt_random` to randomly assign teams and begin the sequence.

### Admin Commands
- `/trigger manhunt_random` — Starts the pick sequence (lottery reel animation)
- `/trigger manhunt_start` — Skip pick sequence and force-start headstart immediately
- `/trigger manhunt_pause` — Toggle pause/resume
- `/trigger manhunt_skip` — Skip the current random event

## Features
- **Dread Clock**: Every 10 minutes, the game escalates (Hunters get Speed, compass updates faster, Runner gets Weakness/Glowing).
- **Chaos Events**: Every 8-12 minutes, a random event occurs (Meteor Strike, Thunder Surge, Blackout, Undead Surge, Hellfire, Dimension Pulse).
- **Powerups**: Special items (Carrot on a Stick) that grant unique abilities to the Runner or Hunters.
