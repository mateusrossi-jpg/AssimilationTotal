# AssimilationTotal — Godot Visual Implementation

This document explains how to reproduce the approved visual direction inside Godot without trying to build AAA assets immediately.

The goal is to create the visual feeling with simple production-ready layers:

- dark modular environment
- yellow emissive lines
- fog/smoke particles
- glow effects
- minimal HUD
- readable silhouettes
- Sync corruption overlays

---

# Core Strategy

Do not start with complex art.

Start with a simple playable scene and layer atmosphere gradually.

The visual style should be built with:

1. modular floor tiles
2. simple props
3. CanvasModulate darkness
4. Light2D / PointLight2D accents
5. particles for fog, smoke and sparks
6. glow/bloom
7. HUD overlays
8. Sync distortion later

---

# Step 01 — Dark Base Arena

Create the first map:

```txt
scenes/maps/Arena_DeadGrid.tscn
```

Use a `Node2D` root.

Suggested structure:

```txt
Arena_DeadGrid
├── TileMapLayer_Floor
├── TileMapLayer_Details
├── Props
├── Lights
├── Particles
└── BackgroundDarkness
```

The first arena can use placeholder tiles:

- dark gray floor
- damaged floor
- yellow floor lines
- metal panel details

---

# Step 02 — Use CanvasModulate

Add a `CanvasModulate` node to the main scene.

Set it to a dark gray/blue tone.

This makes the whole scene darker and allows local lights to create atmosphere.

Visual goal:

- dark but readable
- industrial horror mood
- yellow highlights visible

---

# Step 03 — Add Yellow Light Sources

Use `PointLight2D` or `Light2D` nodes for:

- floor light strips
- warning lights
- reactor glow
- weapon glow
- Sync effects

Keep lights selective.

Do not flood the whole screen with light.

---

# Step 04 — Create Fog And Smoke

Use `GPUParticles2D` for:

- fog patches
- smoke vents
- drifting atmosphere

Keep particle count controlled for Android.

Suggested MVP settings:

- low speed
- large soft texture
- low opacity
- slow lifetime
- limited amount

Fog should create depth, not hide gameplay.

---

# Step 05 — Player Readability

The player must always be visible.

Use:

- dark silhouette
- small white/yellow highlight
- subtle glow around neural core
- optional outline later

Avoid over-detailing the player sprite early.

---

# Step 06 — Enemy Readability

Enemies should remain readable during chaos.

MVP enemy visual rules:

- red/yellow small eye or core
- dark body
- clear silhouette
- small hit flash when damaged

Do not make enemies too detailed initially.

---

# Step 07 — Projectile Glow

Pulse Gun projectiles should use:

- small bright yellow sprite
- trail particle
- impact sparks

The projectile must be readable but not too large.

---

# Step 08 — Shock Field Visual

Shock Field should be built from:

- circular ring sprite or Line2D
- electric arc particles
- yellow glow
- radial pulse animation
- small screen shake

For MVP:

- one expanding circle
- damage nearby enemies
- sparks on hit

Advanced irregular distortion comes later.

---

# Step 09 — HUD Layer

Create:

```txt
scenes/ui/UI.tscn
```

Use `CanvasLayer`.

MVP HUD:

- health bar top-left
- XP bar bottom-center
- Sync meter right side
- timer top-center

Keep it clean.

Do not recreate all concept UI details immediately.

---

# Step 10 — Sync Corruption Later

Do not implement full Sync corruption first.

Start with:

- Sync meter fills
- yellow/red color shift
- small UI flicker when high

Later add:

- glitch overlay
- screen distortion shader
- corrupted symbols
- audio distortion

---

# MVP Visual Implementation Order

## First

- dark arena
- player visible
- enemy visible
- projectile visible

## Then

- yellow floor lines
- fog particles
- lights
- basic HUD

## Then

- hit flashes
- sparks
- Shock Field ring
- Sync meter

## Later

- screen glitch
- boss warning overlay
- animated UI corruption
- advanced shaders

---

# Android Performance Rules

Avoid early:

- too many lights
- massive particles
- full-screen shaders everywhere
- huge textures
- excessive bloom

Use scalable options.

The game should look good because of composition, contrast, fog, lighting and UI — not because of heavy assets.

---

# First Visual Milestone

The first visual milestone is successful when the scene has:

- dark industrial floor
- yellow light lines
- fog/smoke
- readable player
- readable enemies
- glowing projectiles
- basic HUD

It does not need to match the concept art perfectly yet.

It only needs to clearly feel like AssimilationTotal.