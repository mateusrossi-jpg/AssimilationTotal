# AssimilationTotal — Gameplay Implementation Order

This document defines the exact technical implementation order for the first playable Godot MVP.

The goal is to move from planning into execution.

No more abstract expansion before the first playable loop works.

---

# Core Implementation Rule

Build the smallest playable version first.

Do not polish before the loop works.

Do not add content before the core loop is fun.

---

# Target First Loop

The first playable loop is:

1. Player moves
2. Enemies spawn
3. Enemies chase player
4. Player auto-shoots
5. Projectiles damage enemies
6. Enemies die
7. XP is collected
8. Player levels up
9. Upgrade is selected
10. Gameplay continues

This is the heart of the game.

---

# Step 01 — Create Godot Project

Create the Godot 4.x project.

Project name:

```txt
AssimilationTotal
```

Renderer recommendation:

```txt
Mobile or Forward+
```

For Android-first testing, Mobile renderer is preferred later.

---

# Step 02 — Configure Input Map

Add these input actions:

```txt
move_left
move_right
move_up
move_down
```

Suggested bindings:

## move_left
- A
- Left Arrow

## move_right
- D
- Right Arrow

## move_up
- W
- Up Arrow

## move_down
- S
- Down Arrow

---

# Step 03 — Create Folder Structure

Create:

```txt
assets/audio/
assets/sprites/
assets/vfx/

scenes/player/
scenes/enemies/
scenes/weapons/
scenes/maps/
scenes/ui/

scripts/player/
scripts/enemies/
scripts/weapons/
scripts/systems/
scripts/ui/
```

---

# Step 04 — Create Player Scene

Scene:

```txt
scenes/player/Player.tscn
```

Root:

```txt
CharacterBody2D
```

Attach script:

```txt
scripts/player/player.gd
```

Required children:

```txt
Player
├── Sprite2D
├── CollisionShape2D
├── WeaponAnchor (Node2D)
└── PickupArea (Area2D)
```

First test:

The player must move smoothly with WASD/arrow keys.

---

# Step 05 — Create Enemy Drone Scene

Scene:

```txt
scenes/enemies/EnemyDrone.tscn
```

Root:

```txt
CharacterBody2D
```

Attach script:

```txt
scripts/enemies/enemy_drone.gd
```

Required children:

```txt
EnemyDrone
├── Sprite2D
└── CollisionShape2D
```

First test:

Place one enemy in the scene and confirm it chases the player.

---

# Step 06 — Create Projectile Scene

Scene:

```txt
scenes/weapons/PulseProjectile.tscn
```

Root:

```txt
Area2D
```

Attach script:

```txt
scripts/weapons/projectile.gd
```

Required children:

```txt
PulseProjectile
├── Sprite2D
└── CollisionShape2D
```

First test:

Projectile moves and disappears after lifetime/range.

---

# Step 07 — Create Pulse Gun

Script:

```txt
scripts/weapons/pulse_gun.gd
```

Attach to:

```txt
Player/WeaponAnchor
```

Set projectile scene reference in inspector.

First test:

Pulse Gun should target nearest enemy and fire automatically.

---

# Step 08 — Create Spawn Manager

Script:

```txt
scripts/systems/spawn_manager.gd
```

Attach to a Node in Main scene:

```txt
SpawnManager
```

Set enemy scene reference in inspector.

First test:

Enemies spawn around player over time.

---

# Step 09 — Create XP Pickup

Scene:

```txt
scenes/systems/XPPickup.tscn
```

Root:

```txt
Area2D
```

Attach:

```txt
scripts/systems/xp_pickup.gd
```

First test:

XP moves toward player when nearby and increases XP on pickup.

---

# Step 10 — Enemy Drop XP

Update enemy death flow:

- enemy dies
- spawns XP pickup
- XP can be collected

First test:

Killing enemies causes XP progression.

---

# Step 11 — Level-Up UI

Create temporary simple level-up system.

MVP target:

- pause gameplay
- show 3 buttons/cards
- select one upgrade
- apply effect
- resume gameplay

No advanced animations yet.

---

# Step 12 — Basic HUD

Create UI showing:

- Health
- XP
- Level
- Sync
- Timer

First test:

UI updates from player signals.

---

# Step 13 — Sync MVP

Implement Sync as a visible meter.

MVP effects:

- increases on level-up or corrupted upgrades
- adds small damage/fire rate bonuses later
- triggers basic visual corruption later

First test:

Sync changes and UI displays it.

---

# Step 14 — Gameplay Feel Pass

Only after core loop works.

Add:

- hit flash
- small particle bursts
- projectile glow
- enemy death flash
- subtle camera shake

---

# Step 15 — Atmosphere Pass

Add:

- dark arena
- fog
- neon yellow lines
- rain/smoke particles
- industrial ambience later

---

# Step 16 — Boss Prototype

Only after the normal loop works.

Create Assimilation Warden prototype with:

- basic boss health
- direct charge
- radial pulse
- drone summon

No complex boss polish yet.

---

# Implementation Discipline

Do not implement before core loop:

- ads
- store
- save
- multiple maps
- multiple bosses
- advanced menus
- deep lore systems
- complex animation systems

---

# First Playable Definition Of Done

The first playable prototype is done when:

- player moves
- enemy spawns
- enemy chases
- player shoots automatically
- enemy dies
- XP is collected
- level-up happens
- upgrade applies
- gameplay continues

That is the first real milestone.