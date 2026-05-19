# AssimilationTotal — Scenes And Scripts

This document defines the initial scene structure and script responsibilities for the MVP.

The goal is to keep the architecture simple, expandable, and easy to maintain.

---

# Scene Structure

## Main Scene

```txt
Main.tscn
```

### Responsibility

- Loads the arena
- Loads the player
- Starts gameplay systems
- Controls game state
- Handles restart flow
- Connects UI and gameplay

### Main Child Nodes

```txt
Main
├── Arena
├── Player
├── EnemyContainer
├── ProjectileContainer
├── SpawnManager
├── Camera2D
├── CanvasLayer
│   └── UI
```

---

# Arena Scene

```txt
Arena_DeadGrid.tscn
```

### Responsibility

- Provides gameplay space
- Holds atmosphere visuals
- Handles environmental decoration

### MVP Requirements

- Dark industrial floor
- Fog/smoke
- Neon yellow lights
- Minimal collision
- Open arena layout

---

# Player Scene

```txt
Player.tscn
```

### Responsibility

- Movement
- Health
- Taking damage
- Sync meter
- Weapon ownership
- XP collection

### Suggested Node Structure

```txt
Player
├── Sprite2D
├── CollisionShape2D
├── Hurtbox
├── WeaponPivot
├── Area2D (pickup range)
├── GPUParticles2D
└── AnimationPlayer
```

### Player Scripts

```txt
scripts/player/player.gd
scripts/player/player_health.gd
scripts/player/player_sync.gd
```

---

# Enemy Scene

## EnemyDrone.tscn

### Responsibility

- Chase player
- Deal contact damage
- Receive damage
- Die and drop XP

### Suggested Node Structure

```txt
EnemyDrone
├── Sprite2D
├── CollisionShape2D
├── Hurtbox
├── Hitbox
├── NavigationAgent2D
├── GPUParticles2D
└── AnimationPlayer
```

### Enemy Scripts

```txt
scripts/enemies/enemy_base.gd
scripts/enemies/enemy_drone.gd
```

---

# Weapon System

## PulseGun

```txt
PulseGun.tscn
```

### Responsibility

- Auto-fire toward nearest enemy
- Spawn projectiles
- Handle fire rate

### Weapon Scripts

```txt
scripts/weapons/weapon_base.gd
scripts/weapons/pulse_gun.gd
scripts/weapons/projectile.gd
```

---

# XP Pickup

## XPCrystal.tscn

### Responsibility

- Move toward player when nearby
- Add XP on pickup

### Script

```txt
scripts/systems/xp_pickup.gd
```

---

# Spawn Manager

## SpawnManager

### Responsibility

- Spawn enemies over time
- Increase difficulty gradually
- Control wave pacing
- Trigger boss spawn

### Script

```txt
scripts/systems/spawn_manager.gd
```

### MVP Logic

Simple timed spawning.

No procedural complexity yet.

---

# UI Scene

## UI.tscn

### Responsibility

- Health bar
- XP bar
- Sync meter
- Timer
- Level-up cards
- Boss warning

### Scripts

```txt
scripts/ui/ui_controller.gd
scripts/ui/levelup_screen.gd
```

---

# Boss Scene

## AssimilationWarden.tscn

### Responsibility

- First major boss encounter
- Simple attack patterns
- High atmosphere presence

### MVP Boss Attacks

1. Dash charge
2. Radial pulse attack
3. Drone summon

### Scripts

```txt
scripts/enemies/boss_base.gd
scripts/enemies/assimilation_warden.gd
```

---

# Audio Direction

## Music

- Dark ambient
- Industrial synth
- Minimal melody
- Tension focused

## Sound Effects

- Mechanical impacts
- Electrical arcs
- Distant drones
- Glitches
- Heavy industrial ambience

---

# Visual Direction Rules

## Important

Atmosphere must come mostly from:

- Lighting
- Fog
- Particles
- Audio
- Contrast
- HUD distortion

NOT from extremely detailed assets.

---

# MVP Technical Goal

The first playable prototype is successful when:

- The player can survive for several minutes
- Combat feels satisfying
- The atmosphere feels oppressive
- The boss encounter feels memorable
- The game already communicates its identity clearly

Everything else comes later.