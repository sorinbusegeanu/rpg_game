# Visual Exploration and Battle Background Direction

## Core visual principle

Exploration in **Sea of Broken Oaths** happens in two major modes:

1. **Sea navigation** — the party is represented by a small ship sailing between islands, coasts, reefs, ruins, and mythic sea hazards.
2. **Land navigation** — the party is represented by a rider, mounted scout, caravan marker, or small party symbol moving across forests, roads, marshes, ruins, temples, and mountain passes.

The player should always understand where the party is travelling and what kind of danger is nearby. The navigation symbol should be simple, readable, and iconic rather than fully simulated.

The exploration view does not need to show every party member. It should symbolize the whole party.

```text
Sea route: small Argo-style ship marker
Land route: rider / horse / banner / mounted scout marker
```

## Two exploration layers

### 1. Sea exploration

Sea exploration represents travel between major regions.

Recommended visuals:

- stylized mythic sea map
- small ship marker for the party
- island nodes
- reef hazards
- fog banks
- storm zones
- siren waters
- ruined ports
- divine ruins rising from the sea
- sea monster shadows beneath the water

Possible party marker:

```text
Small black-sailed ship
Small bronze-prowed Argo silhouette
Ship with glowing Fleece fragment on mast
```

Sea movement should feel like the crew is sailing through cursed waters rather than controlling a realistic ship simulator.

### 2. Land exploration

Land exploration represents travel inside an island or region.

Recommended visuals:

- side-scrolling or node-based terrain path
- rider or mounted scout marker
- party banner marker
- forest paths
- old roads
- ruined shrines
- marsh bridges
- temple gates
- caves
- monster lairs

Possible party marker:

```text
Rider on horse
Mounted scout with party banner
Small group silhouette
Torch-bearing traveler icon
```

The marker symbolizes the party and should remain small/readable.

## Battle background requirement

Because battles can happen in many locations, the game needs a reusable set of battle backgrounds.

Each battle background should reflect the current region and encounter type.

Recommended first set:

| Background | Use case |
|---|---|
| Forest shore | Whispering Coast, first region, wolves/raiders |
| Deep forest path | cursed forest encounters |
| Ruined shrine | cultists, oath-bound soldiers, relic fights |
| Rocky beach | sea landing battles |
| Ship deck | boarding encounters, sea ambushes |
| Reef at dusk | sirens, drowned sailors |
| Storm sea | harpies, sea spirits, storm enemies |
| Bronze ruins | Talos, animated statues, bronze soldiers |
| Poison marsh | undead, plague beasts, swamp hydra |
| Colchian temple gate | late campaign elite enemies |
| Dragon grove | final Golden Fleece encounters |

The first playable prototype only needs a few placeholders:

```text
forest_shore.png
ship_deck.png
ruined_shrine.png
poison_marsh.png
```

## Navigation background requirement

Navigation also needs separate backgrounds from battle.

### Sea navigation backgrounds

| Background | Use case |
|---|---|
| Open sea | default sailing |
| Storm sea | dangerous travel zone |
| Island coast | approaching a land region |
| Siren reef | charm/status region |
| Clashing rocks | timed hazard region |
| Dead sea fog | undead or ghost region |

### Land navigation backgrounds

| Background | Use case |
|---|---|
| Forest road | default island travel |
| Ruined coast road | first region |
| Marsh path | poison/undead region |
| Bronze causeway | construct region |
| Temple approach | boss region |
| Mountain pass | late campaign travel |

## Asset folder structure

Use this folder structure:

```text
assets/
  navigation/
    sea/
      open_sea.png
      storm_sea.png
      island_coast.png
      siren_reef.png
      clashing_rocks.png
      dead_sea_fog.png
    land/
      forest_road.png
      ruined_coast_road.png
      marsh_path.png
      bronze_causeway.png
      temple_approach.png
      mountain_pass.png
  battle_backgrounds/
    forest_shore.png
    deep_forest_path.png
    ruined_shrine.png
    rocky_beach.png
    ship_deck.png
    reef_dusk.png
    storm_sea.png
    bronze_ruins.png
    poison_marsh.png
    colchian_temple_gate.png
    dragon_grove.png
  party_markers/
    ship_marker.png
    rider_marker.png
    party_banner_marker.png
  ui/
  heroes/
  enemies/
```

## Scene implications

The current UI prototype should evolve into three visual states:

```text
SEA_NAVIGATION
LAND_NAVIGATION
COMBAT
```

The current logic has only:

```text
EXPLORATION
TRANSITION
COMBAT
```

For now, keep the logic simple and add an exploration sub-mode:

```text
exploration_mode = "SEA" or "LAND"
```

This allows one state manager to continue working while the UI chooses the right visual layer.

## Recommended first implementation

Do not implement a full world map yet.

First add:

1. one sea navigation background
2. one land navigation background
3. one ship marker
4. one rider marker
5. one battle background
6. logic to switch which marker/background is displayed based on exploration mode

Minimal prototype behavior:

```text
If exploration_mode == "SEA":
    show sea background
    show ship marker

If exploration_mode == "LAND":
    show land background
    show rider marker

If state == "COMBAT":
    show battle background
    hide navigation marker
```

## Region visual mapping

| Region | Navigation mode | Navigation background | Battle background |
|---|---|---|---|
| Open Sea | Sea | open_sea | ship_deck or storm_sea |
| Whispering Coast | Land | ruined_coast_road | forest_shore |
| Isle of Harpies | Land | mountain_pass or storm_coast | storm_sea |
| Clashing Rocks | Sea | clashing_rocks | rocky_beach |
| Bronze Island | Land | bronze_causeway | bronze_ruins |
| Siren Reefs | Sea | siren_reef | reef_dusk |
| Dead King’s Marsh | Land | marsh_path | poison_marsh |
| Colchis | Land | temple_approach | colchian_temple_gate / dragon_grove |

## Style direction

The graphics should be readable and atmospheric rather than realistic.

Recommended style:

- painterly 2D backgrounds
- dark mythic palette
- strong silhouettes
- readable UI cards
- minimal animation at first
- symbolic map markers instead of realistic party simulation

The game can later add richer animation, but the first visual priority is clear location identity.

## Implementation note

The party marker should not represent only one hero. It represents the whole expedition.

Use:

```text
Ship marker = party travelling by sea
Rider marker = party travelling by land
```

The player should emotionally understand: “my crew is moving through this dangerous region,” even before full character animation exists.
