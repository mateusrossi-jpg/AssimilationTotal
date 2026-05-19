# AssimilationTotal — First Implementation Steps

This is the first practical implementation plan for the MVP prototype.

The goal is to make the game playable before polishing visuals.

---

# Milestone 01 — Playable Combat Prototype

## Objective

Create the smallest playable loop:

- Player moves
- Enemy follows player
- Player auto-shoots
- Enemy takes damage
- Enemy dies
- XP drops
- Player collects XP

No boss yet. No polished art yet. No ads. No menus.

---

# Step 1 — Create Godot Project

Create a Godot 4.x project named:

```txt
AssimilationTotal
```

Recommended renderer:

```txt
Forward+ or Mobile
```

For Android-first, Mobile renderer can be tested later.

---

# Step 2 — Create Folders

```txt
assets/
assets/audio/
assets/sprites/
assets/vfx/

scenes/
scenes/player/
scenes/enemies/
scenes/weapons/
scenes/maps/
scenes/ui/

scripts/
scripts/player/
scripts/enemies/
scripts/weapons/
scripts/systems/
scripts/ui/
```

---

# Step 3 — Create Player Scene

Create:

```txt
scenes/player/Player.tscn
```

Root node:

```txt
CharacterBody2D
```

Attach:

```txt
scripts/player/player.gd
```

Minimum child nodes:

```txt
Player
├── Sprite2D
├── CollisionShape2D
├── WeaponAnchor (Node2D)
└── PickupArea (Area2D)
```

---

# Step 4 — Create Enemy Scene

Create:

```txt
scenes/enemies/EnemyDrone.tscn
```

Root node:

```txt
CharacterBody2D
```

Attach:

```txt
scripts/enemies/enemy_drone.gd
```

Minimum child nodes:

```txt
EnemyDrone
├── Sprite2D
├── CollisionShape2D
└── Hitbox (Area2D)
```

---

# Step 5 — Create Projectile Scene

Create:

```txt
scenes/weapons/PulseProjectile.tscn
```

Root node:

```txt
Area2D
```

Attach:

```txt
scripts/weapons/projectile.gd
```

Minimum child nodes:

```txt
PulseProjectile
├── Sprite2D
└── CollisionShape2D
```

---

# Step 6 — Create Pulse Gun Script

The player can own a simple automatic weapon script:

```txt
scripts/weapons/pulse_gun.gd
```

For the first prototype, this can be attached to a Node2D inside the Player.

---

# Step 7 — Create Main Scene

Create:

```txt
scenes/Main.tscn
```

Minimum structure:

```txt
Main
├── Player
├── EnemyContainer
├── ProjectileContainer
├── SpawnManager
├── Camera2D
└── CanvasLayer
```

---

# Step 8 — Create Spawn Manager

Create:

```txt
scripts/systems/spawn_manager.gd
```

Responsible for spawning EnemyDrone around the player.

---

# Step 9 — Test First Loop

The first success condition:

- Player moves with keyboard/controller/mobile later
- Enemy spawns
- Enemy chases player
- Weapon fires automatically
- Projectile damages enemy
- Enemy disappears when health reaches zero

---

# Do Not Implement Yet

Before the first loop works, do not implement:

- Boss
- Shop
- Main menu
- Save system
- Ads
- Multiple weapons
- Complex upgrades
- Advanced UI
- Cutscenes

---

# First Prototype Definition of Done

The first prototype is done when the player can move, shoot automatically, kill enemies, and survive for at least 2 minutes in a test arena.