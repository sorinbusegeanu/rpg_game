# Heroes — Sea of Broken Oaths

## Design intent

The hero roster should support a team RPG structure with 3–5 active heroes per expedition and a larger crew that can be recruited over time.

The setting is mythic dark fantasy inspired by the Argonauts and ancient public-domain myth, but the heroes should remain original enough to support the game’s own identity.

Core party roles:

- Tank / Protector
- Fighter / Bruiser
- Archer / Ranged Damage
- Mage / Elemental Damage
- Sorcerer / Curse and Control
- Priest / Healer and Cleanser
- Rogue / Speed and Evasion
- Bard / Morale and Charm Resistance
- Seer / Prediction and Utility
- Specialist / Anti-monster or anti-boss role

## Attribute model

Use these attributes as design language for balancing and UI.

| Attribute | Meaning |
|---|---|
| Health | Maximum survivability before defeat |
| Defense | Damage reduction / protection strength |
| Power | Physical damage and weapon impact |
| Magic | Spell damage, curse strength, healing scale |
| Speed | Action interval in the heartbeat combat system; lower seconds means faster actions |
| Control | Stuns, slows, silence, charm, fear, disruption |
| Support | Healing, shields, buffs, cleanse, resurrection |
| Resolve | Resistance to fear, charm, curse, and morale damage |

Suggested speed bands:

| Speed band | Action interval |
|---|---:|
| Very Fast | 2.2s–2.4s |
| Fast | 2.5s–2.7s |
| Medium | 2.8s–3.1s |
| Slow | 3.2s–3.5s |
| Very Slow | 3.6s+ |

## Starter crew recommendation

The first playable roster should include five heroes:

1. Aeson’s Heir — balanced leader
2. Bronze-Shield Ajax — tank
3. Medea the Veiled — curse mage
4. Orion’s Daughter — archer
5. Orphean Singer — support

This gives the player a complete early party: damage, protection, control, ranged pressure, and support.

---

# Hero roster

## 1. Aeson’s Heir

**Role:** Leader / Fighter  
**Combat identity:** Balanced melee hero with rally effects and reliable damage.  
**Narrative role:** Last heir of a ruined oath-bound royal line. Commands the Argo not by divine right, but because the crew still chooses to follow.

### Characteristics

- Brave, disciplined, politically burdened
- Good introductory hero for the player
- Works in almost any team composition
- Strong against ordinary enemies, weaker against curses without support

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 220 |
| Defense | 6 |
| Power | 7 |
| Magic | 2 |
| Speed | 2.8s |
| Control | 3 |
| Support | 5 |
| Resolve | 7 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Oathblade Strike | Basic | Deals physical damage and grants a small morale boost to the lowest-health ally. |
| Rally the Crew | Support | Increases party action gain or damage for a short duration. |
| Broken Crown | Passive | Gains Resolve when an ally falls below 50% health. |
| Commanding Cut | Special | Heavy strike that also advances all allies slightly on the heartbeat timeline. |

---

## 2. Bronze-Shield Ajax

**Role:** Tank / Protector  
**Combat identity:** Slow, durable defender who absorbs pressure and protects weaker heroes.  
**Narrative role:** A veteran shieldbearer from a city destroyed by oath-breaking kings.

### Characteristics

- Loyal, stubborn, physically imposing
- Ideal front-line protector
- Strong against minions and physical attackers
- Vulnerable to magic, poison, and silence effects

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 380 |
| Defense | 10 |
| Power | 5 |
| Magic | 1 |
| Speed | 3.4s |
| Control | 4 |
| Support | 4 |
| Resolve | 8 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Shield Bash | Basic | Deals low damage and has a small chance to delay the target’s next action. |
| Shield Wall | Defensive | Reduces damage taken by all allies for several seconds. |
| Stand Before Me | Guard | Redirects some damage from the weakest ally to Ajax. |
| Bronze Bastion | Special | Grants a large shield to the party and taunts enemies. |

---

## 3. Medea the Veiled

**Role:** Sorceress / Curse Control  
**Combat identity:** High magic, poison, curse, and enemy disruption.  
**Narrative role:** A feared exile who understands the old divine laws better than priests do.

### Characteristics

- Intelligent, dangerous, morally ambiguous
- Excellent against bosses and armored enemies
- Brings poison, curse, and debuffs
- Fragile if left unprotected

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 130 |
| Defense | 2 |
| Power | 1 |
| Magic | 10 |
| Speed | 2.7s |
| Control | 9 |
| Support | 4 |
| Resolve | 6 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Black Laurel | Basic | Deals magic damage and applies a weak poison. |
| Severed Oath | Debuff | Reduces enemy damage and healing received. |
| Witchfire Thread | Control | Burns and slows one target. |
| Veil of Colchis | Special | Applies a major curse to all enemies, reducing action speed and defense. |

---

## 4. Orion’s Daughter

**Role:** Archer / Ranged Damage  
**Combat identity:** Fast ranged attacker with anti-flying and mark mechanics.  
**Narrative role:** A huntress raised under forbidden stars, tracking monsters across ruined coasts.

### Characteristics

- Precise, solitary, practical
- Strong against harpies, sirens, and fragile casters
- Good single-target damage
- Limited party protection

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 160 |
| Defense | 3 |
| Power | 8 |
| Magic | 2 |
| Speed | 2.4s |
| Control | 5 |
| Support | 2 |
| Resolve | 5 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Hunter’s Shot | Basic | Ranged physical attack with bonus damage against marked targets. |
| Pinning Arrow | Control | Damages and delays a target. Stronger against flying enemies. |
| Mark of the Hunt | Debuff | Marks one enemy, increasing damage taken from all allies. |
| Starfall Volley | Special | Fires a rain of arrows at all enemies; bonus damage to marked or flying targets. |

---

## 5. Orphean Singer

**Role:** Bard / Support  
**Combat identity:** Morale, healing-over-time, charm resistance, and tempo support.  
**Narrative role:** A sacred singer whose music can calm beasts, resist sirens, and remind the crew why they sail.

### Characteristics

- Gentle, perceptive, emotionally resilient
- Strong against fear, charm, confusion, and morale damage
- Enables fragile teams
- Low direct damage

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 150 |
| Defense | 3 |
| Power | 2 |
| Magic | 7 |
| Speed | 2.6s |
| Control | 6 |
| Support | 10 |
| Resolve | 9 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Song of Return | Basic | Small heal to the lowest-health ally. |
| Lyre of Clear Waters | Cleanse | Removes charm, fear, or silence from one ally. |
| Chorus of Courage | Buff | Raises party Resolve and action generation. |
| Hymn Against the Deep | Special | Heals all allies and grants temporary immunity to charm/fear. |

---

## 6. Boreas-Touched Twin

**Role:** Rogue / Wind Skirmisher  
**Combat identity:** Very fast evasive attacker with interrupts and anti-flying pressure.  
**Narrative role:** One of twin children blessed or cursed by the north wind. Only one joins the crew at first; the other may appear later as rival, boss, or unlockable hero.

### Characteristics

- Impulsive, sharp-tongued, restless
- Excellent at interrupting casters and flying enemies
- High speed, low durability
- Works best with shields or healing support

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 140 |
| Defense | 2 |
| Power | 6 |
| Magic | 4 |
| Speed | 2.2s |
| Control | 7 |
| Support | 2 |
| Resolve | 5 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Windcut | Basic | Fast strike that slightly delays the enemy action timer. |
| Gale Step | Defensive | Gains evasion for a short time. |
| Skyhook Strike | Specialist | Bonus damage against flying enemies. |
| North Wind Sever | Special | Damages one target heavily and pushes back its next action. |

---

## 7. Heraklean Wanderer

**Role:** Bruiser / Monster Slayer  
**Combat identity:** High physical burst damage, especially against bosses and large monsters.  
**Narrative role:** A wandering champion carrying the burden of old labors and unfinished penance.

### Characteristics

- Powerful, direct, guilt-driven
- Excellent boss killer
- High health and damage
- Slow and vulnerable to control effects

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 300 |
| Defense | 6 |
| Power | 10 |
| Magic | 1 |
| Speed | 3.2s |
| Control | 3 |
| Support | 1 |
| Resolve | 7 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Club Smash | Basic | Heavy physical hit. |
| Monster Breaker | Specialist | Bonus damage against Boss and Beast enemies. |
| Labor’s Burden | Passive | Gains Power as health drops. |
| Lion-Skin Wrath | Special | Massive single-target strike and temporary damage resistance. |

---

## 8. Oracle of Dodona

**Role:** Seer / Utility Support  
**Combat identity:** Prediction, cleanse, action manipulation, and anti-curse support.  
**Narrative role:** A blind oracle who hears the rustle of divine oaks and knows that prophecy is never free.

### Characteristics

- Calm, cryptic, difficult to trust
- Strong against curse-heavy regions
- Improves party consistency
- Low damage and low health

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 120 |
| Defense | 2 |
| Power | 1 |
| Magic | 8 |
| Speed | 3.0s |
| Control | 6 |
| Support | 9 |
| Resolve | 10 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Foreseen Wound | Basic | Marks an enemy so the next hit against it deals bonus damage. |
| Cleanse Oath | Cleanse | Removes curse, poison, or weaken from one ally. |
| Branch-Whisper | Utility | Advances one ally’s next action slightly. |
| Prophecy of Survival | Special | Prevents one fatal blow against the party for a short duration. |

---

## 9. Thaleia of the Ash Spear

**Role:** Spearfighter / Anti-large Specialist  
**Combat identity:** Mid-speed physical attacker with reach, bleed, and anti-beast tools.  
**Narrative role:** A soldier from a burned island who joined the Argo to hunt the creature that destroyed her home.

### Characteristics

- Disciplined, severe, revenge-driven
- Strong against beasts, hydras, and cavalry-like enemies
- Good damage over time
- Less effective against spirits and constructs

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 210 |
| Defense | 5 |
| Power | 8 |
| Magic | 1 |
| Speed | 2.9s |
| Control | 5 |
| Support | 2 |
| Resolve | 6 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Spear Thrust | Basic | Physical hit with bonus against large enemies. |
| Ashen Bleed | Damage over time | Applies bleed to living enemies. |
| Brace Line | Defensive | Reduces incoming damage from the next enemy action. |
| Impale the Beast | Special | High damage to one enemy; extra effect if target is Boss or Beast. |

---

## 10. Niko the Black-Sailed Thief

**Role:** Rogue / Treasure and Disruption  
**Combat identity:** Fast attacker, loot enhancer, debuffer, and opportunistic finisher.  
**Narrative role:** A pirate-thief who knows every black market harbor between the broken kingdoms.

### Characteristics

- Clever, selfish, funny, unreliable at first
- Good economy/loot utility
- Strong against weakened enemies
- Fragile and morally risky

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 135 |
| Defense | 2 |
| Power | 6 |
| Magic | 1 |
| Speed | 2.3s |
| Control | 6 |
| Support | 3 |
| Resolve | 4 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Knife Work | Basic | Fast attack with bonus against debuffed targets. |
| Dirty Trick | Control | Blinds or weakens one enemy. |
| Pick the Bones | Passive | Slightly increases gold or material rewards after combat. |
| Black Sail Ambush | Special | Strikes multiple weakened enemies and may reset if one is defeated. |

---

## 11. Phaedra of the White Flame

**Role:** Priest / Fire Healer  
**Combat identity:** Healing, burning cleanse, anti-undead pressure.  
**Narrative role:** A temple survivor who believes the gods did not leave — they were silenced.

### Characteristics

- Faithful, intense, uncompromising
- Good against undead, plague, poison, and darkness
- Can heal and burn
- Less effective against armored bosses without damage allies

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 155 |
| Defense | 3 |
| Power | 2 |
| Magic | 8 |
| Speed | 2.9s |
| Control | 4 |
| Support | 9 |
| Resolve | 8 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| White Spark | Basic | Small holy fire damage or small ally heal depending on target. |
| Burn the Venom | Cleanse | Removes poison/plague and heals the ally. |
| Sacred Ember | Buff | Adds fire damage to ally attacks for a short time. |
| Flame of the Unbroken Vow | Special | Heals all allies and damages undead or cursed enemies. |

---

## 12. Damas the Bronze-Smith

**Role:** Engineer / Relic Specialist  
**Combat identity:** Shields, constructs, gear buffs, anti-construct knowledge.  
**Narrative role:** A shipwright and divine-metal smith trying to understand the machines the gods left behind.

### Characteristics

- Practical, skeptical, inventive
- Useful for ship/base progression and relic crafting
- Strong against constructs like Talos and bronze soldiers
- Moderate combat stats

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 200 |
| Defense | 6 |
| Power | 5 |
| Magic | 4 |
| Speed | 3.1s |
| Control | 5 |
| Support | 7 |
| Resolve | 6 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Hammer Tap | Basic | Physical hit; bonus against constructs. |
| Riveted Guard | Shield | Grants a temporary shield to one ally. |
| Relic Tune-Up | Buff | Improves one ally’s next special effect or mana gain. |
| Bronze Heart Overload | Special | Damages all constructs and grants party shields. |

---

## 13. Melanippe the Sea-Witch

**Role:** Water Mage / Control  
**Combat identity:** Slows, drowning magic, enemy action reduction, anti-fire utility.  
**Narrative role:** A witch from the reefs who knows the sea is older than the gods.

### Characteristics

- Cold, mysterious, independent
- Strong in Siren Reefs and sea-themed regions
- Excellent slows and control
- Lower direct burst than fire or curse mages

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 145 |
| Defense | 3 |
| Power | 1 |
| Magic | 9 |
| Speed | 2.8s |
| Control | 9 |
| Support | 5 |
| Resolve | 7 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Salt Hex | Basic | Magic damage and minor slow. |
| Drowning Veil | Control | Reduces enemy action speed for a short duration. |
| Tidal Mercy | Support | Removes burn and grants minor healing. |
| Undertow of Names | Special | Pulls all enemies backward on the heartbeat timeline. |

---

## 14. Callistrate the Oath-Breaker

**Role:** Dark Fighter / Risk Damage  
**Combat identity:** High-risk damage dealer who grows stronger when cursed or wounded.  
**Narrative role:** A former oath-bound champion who betrayed her king to save a city and was condemned by both sides.

### Characteristics

- Ruthless, honorable in a dangerous way
- Strong with curse-heavy teams
- Benefits from being wounded or debuffed
- Can become unstable without healing/support

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 240 |
| Defense | 5 |
| Power | 9 |
| Magic | 4 |
| Speed | 3.0s |
| Control | 4 |
| Support | 1 |
| Resolve | 8 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Bitter Cut | Basic | Physical damage; more damage if Callistrate is debuffed. |
| Condemned Strength | Passive | Gains Power when cursed, poisoned, or below half health. |
| Break Their Vow | Debuff | Reduces target Defense and Resolve. |
| Traitor’s Judgment | Special | Massive hit that consumes all debuffs on herself for bonus damage. |

---

## 15. Philemon the Gentle Giant

**Role:** Guardian / Crowd Control Tank  
**Combat identity:** Large health pool, stuns, knockbacks, and protection.  
**Narrative role:** A giant-blooded exile who fears becoming the monster others already see.

### Characteristics

- Kind, restrained, physically overwhelming
- Good against groups of minions
- Can stun and interrupt
- Very slow

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 460 |
| Defense | 8 |
| Power | 7 |
| Magic | 1 |
| Speed | 3.6s |
| Control | 7 |
| Support | 3 |
| Resolve | 7 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Heavy Swing | Basic | Damages one enemy and may delay it. |
| Hold the Line | Guard | Protects adjacent or weakest allies. |
| Earth-Shaking Step | Control | Small damage and action delay to all enemies. |
| Giant’s Mercy | Special | Stuns all minions briefly and shields all allies. |

---

## 16. Ione of the Broken Mask

**Role:** Assassin / Anti-caster  
**Combat identity:** Silence, execute, high-speed pressure against mages and sirens.  
**Narrative role:** A former temple assassin who wears the mask of the god she no longer serves.

### Characteristics

- Quiet, disciplined, secretive
- Strong against sirens, priests, witches, and enemy supports
- Excellent finisher
- Low health and low defense

### Suggested attributes

| Attribute | Value |
|---|---:|
| Health | 125 |
| Defense | 2 |
| Power | 8 |
| Magic | 3 |
| Speed | 2.3s |
| Control | 8 |
| Support | 1 |
| Resolve | 6 |

### Skill suggestions

| Skill | Type | Description |
|---|---|---|
| Mask Needle | Basic | Fast strike with bonus against casters. |
| Cut the Voice | Control | Silences one enemy briefly. |
| No Witness | Passive | Gains bonus damage against enemies below 35% health. |
| Godless Execution | Special | Heavy execute strike; bonus if the target is silenced, charmed, or cursed. |

---

# Suggested unlock order

| Stage | Heroes available |
|---|---|
| Start | Aeson’s Heir, Bronze-Shield Ajax, Medea the Veiled, Orion’s Daughter, Orphean Singer |
| Early islands | Boreas-Touched Twin, Thaleia of the Ash Spear, Phaedra of the White Flame |
| Mid campaign | Heraklean Wanderer, Oracle of Dodona, Niko the Black-Sailed Thief, Damas the Bronze-Smith |
| Late campaign | Melanippe the Sea-Witch, Callistrate the Oath-Breaker, Philemon the Gentle Giant, Ione of the Broken Mask |

# Implementation notes

For the first playable prototype, map heroes into the current heartbeat combat model with these fields:

- `name`
- `role`
- `health`
- `max_health`
- `mana`
- `action_speed`
- `special_move`

Initial implementation can ignore full attribute sheets and use only:

- Health
- Mana
- Action speed
- Role
- Basic action
- Special move

Later progression can add:

- rarity
- star rank
- level
- gear slots
- relic affinity
- skill upgrade trees
- passive traits
- bond bonuses between heroes
