# Apple's Dungeon Item Levels

A simple addon that shows Mythic+ item level rewards, Great Vault thresholds, and gearing information for **Midnight Season 2 (Patch 12.1)** — all in one window, without alt-tabbing to a wiki.

## Features

- **Mythic+ rewards table** — end-of-dungeon item level, Mistcrest tier, and Great Vault reward for every keystone level from +2 to +12 and beyond.
- **Current keystone detection** — automatically reads the keystone in your bags and highlights what it rewards.
- **Mistcrest sources** — where to farm each tier of Mistcrest currency (outdoor content, dungeons, raids, delves, prey hunts).
- **Upgrade tracks** — full Adventurer → Myth upgrade tables, plus The Venomous Abyss's extended Mythic ranks.
- **Vendor & crafting reference** — upgrade vendor locations, Mistcrest exchange rates, Warband discount thresholds, and profession crafting breakpoints.
- **Minimap button** — quick toggle, with a draggable position that's remembered between sessions.

## Commands

| Command | Effect |
|---|---|
| `/dil` | Toggle the main window |
| `/dil side` | Show/hide the information sidebar |

## How it works

Open the addon with `/dil` or the minimap button. The left panel shows Mythic+ rewards and your currently owned keystone; the right panel has tabs for Mistcrest sources, other gearing info, upgrade tracks, and general help.

Mistcrest amounts per individual keystone level aren't shown per-level because Blizzard hasn't published exact per-level drop amounts for Season 2 — the crest *tier* awarded at each level is shown instead, which is confirmed.

## Data

Gearing data is checked against Patch 12.1 / Midnight Season 2 sources and updated as the season's numbers are confirmed. If you spot something that doesn't match in-game, please open an issue.

## Support

Found a bug or have a feature request? Open an issue on this repository.
