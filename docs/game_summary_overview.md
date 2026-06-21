# Game Overview: [Title TBD]
**Genre:** Strategy RPG | **Theme:** Dark & Mysterious | **Style:** Card-based Combat System

---

### 1. Core Concept & Atmosphere
The player controls a party of up to five heroes journeying through a dark, dense forest. The game transitions between two primary states:
*   **Exploration Mode:** A "World_Scroll" view where the characters move automatically from left to right. The world feels heavy and mysterious, with environmental hazards (Thickens that slow progress; Miasms that present dangers).
*   **Combat Mode:** Triggered by a **5-second Fade-to-Black transition**, taking the player into a "Card-style" arena where the focus shifts to strategy and power.

### 2. The Party (Your Core Heroes)
The party consists of five distinct roles, each with a unique presence in the game:
*   **Elera (Priest):** Support / High Agility (**2.4s action rate**)
*   **Korgath (Tank):** Heavy Protection / Low Agility (**3.4s_action_rate**)
*   **Silas (Defender):** Resilience / Low Agility (**3.4s_action_rate**)
*   **Kaelen (Mage):** High Damage / High Agility (**2.4s action rate**)
*   **Ignus (AOE DD):** Balanced Damage / Mid Agility (**3.0s_action_rate**)

### 3. Combat Mechanics
The combat system is designed to be dynamic and high-impact:
*   **Intertwined Initiative:** Instead of turn-based, the game uses a **Time-based Heartbeat**. Heroes and enemies are placed on a shared timeline based on their specific speed (2.4s/3s/3.4s). They "pulse" when it is time to act.
*   **The Mana System:** Each hero has a 1000_point **Action Bar**. They gain +100 mana by performing regular actions and +200_mana_when they take damage.
*   **Special Moves:** When a hero reaches **1000 Mana**, their card will light up. Using a special move consumes all 1000 points instantly, resulting in a **"Brutal Impact"** (a heavy audio/visual blast) and significant damage to the target.

### 4. World & Progression
*   **The Reward Loop:** Enemies are split into **Minions** (fodder) and **Bosses** (central threat). Defeated enemies provide "Weight," which is converted into **Gold** and **Experience**.
*   **Proportional Scaling:** Rewards_scale_based on the difference between the boss and minions. A higher-weight target provides a larger reward.
*   **The Castle (Home_Base):** A dedicated haven where you spend your Gold to upgrade attributes or items. You can choose even which part of your character's power to boost from 1-5 options.

### 5. Core Logic & UI Highlights
*   **Progress Track:** Every card features a clear, dual-bar_indicator (Green for health, Blue for action/mana).
*   **Feedback Loop:** A "Pulse" informs the player when their specific hero's action_timer has hit its mark.
*   **Summary View:** After each fight, you are shown a list of your gains before deciding whether to stay in the forest or return home.

---

### Summary of Development Progress:
1.  **Core Data Engine:** (Defined entities, mana rules, and action_interval logic).
2.  **World & Combat Heartbeat:** (Implemented automated movement, hazard detection, and the concurrent-timer combat system).
3.  **Transition Pipeline:** (Drafted the 5s fade-to-black, transition states, and reward calculation formulas).
4.  **UI Concept:** (Designed the card layouts with dual-bar visual feedback and premium special-move triggers).
