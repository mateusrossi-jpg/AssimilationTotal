# AssimilationTotal — Asset Pipeline

This document defines the MVP art production pipeline for AssimilationTotal.

The goal is to create strong, usable game assets without requiring AAA art production.

The visual quality should come from:

- strong art direction
- readable silhouettes
- simple sprites
- glow
- lighting
- fog
- VFX
- UI cohesion

Not from extremely complex drawings.

---

# Core Asset Philosophy

Concept art is not the final game asset.

Concept art defines:

- mood
- silhouette
- palette
- atmosphere
- emotional target

Game assets must be:

- simple
- readable
- small-screen friendly
- easy to animate
- optimized for Android
- consistent with the visual identity

---

# Recommended MVP Pipeline

## Step 01 — Generate Concept Reference

Use AI tools to generate:

- player references
- enemy references
- boss concepts
- HUD mockups
- environment mood boards
- VFX references

These images guide direction.

They are not always final usable assets.

---

# Step 02 — Simplify Into Game-Readable Forms

Convert concepts into simplified production assets:

- clear silhouettes
- fewer details
- strong contrast
- limited colors
- transparent PNGs
- modular parts

The asset must remain readable during gameplay chaos.

---

# Step 03 — Import Into Godot

Import assets as PNGs.

Use Godot to enhance them with:

- glow
- Light2D
- particles
- shaders
- animation
- fog
- UI overlays

Godot should create much of the final premium feel.

---

# Step 04 — Test In Gameplay

Every asset must be tested inside the game.

An asset is only good if it is readable while:

- enemies move
- projectiles fire
- fog covers the area
- UI is visible
- VFX are active
- the player is moving

---

# Player Asset Pipeline

## Concept Target

- last non-assimilated human
- dark tactical silhouette
- yellow neural glow
- subtle corruption
- readable top-down shape

## MVP Asset Style

- small top-down sprite
- dark body
- yellow core/glow
- cold white highlights
- simple animation

## Required Player Assets

- idle frame
- movement frame or simple animation
- damaged/hit flash state
- optional Sync corruption variant later

---

# Enemy Asset Pipeline

## Enemy 01 — Assimilated Drone

MVP asset requirements:

- small floating dark body
- yellow eye/core
- readable silhouette
- simple hover animation

## Enemy 02 — Assimilated Unit

MVP asset requirements:

- humanoid corrupted silhouette
- dark body
- yellow implants
- slightly asymmetric shape

## Enemy 03 — Biomechanical Crawler

MVP asset requirements:

- low crawling silhouette
- multiple limbs impression
- red/yellow danger glow
- readable movement shape

---

# Boss Asset Pipeline

## Assimilation Warden

The boss should be built as layered 2D parts when possible.

Suggested parts:

- torso/core
- head/display
- left armor section
- right armor section
- floating mechanical parts
- cables
- glow core

This makes animation easier.

The boss does not need to be fully detailed in the MVP.

It needs a memorable silhouette.

---

# Environment Asset Pipeline

## Sector 01 — Dead Grid

Use modular assets.

Required MVP environment assets:

- floor tile graphite
- damaged floor tile
- yellow floor line tile
- metal panel tile
- cable prop
- terminal prop
- smoke vent prop
- warning light prop
- broken hologram prop

The map should feel big through repetition, fog, lighting and landmarks.

---

# VFX Asset Pipeline

Most VFX should be created inside Godot.

MVP VFX:

- Pulse Gun projectile glow
- projectile impact sparks
- Shock Field ring
- enemy hit flash
- enemy death sparks
- fog particle
- smoke particle
- rain particle
- Sync glitch overlay

---

# UI Asset Pipeline

UI should be modular.

Required MVP UI pieces:

- health bar frame
- XP bar frame
- Sync meter frame
- upgrade card frame
- boss warning overlay
- pause button
- dark holographic panel background

Keep UI clean and readable.

---

# AI Art Usage Rules

AI-generated images may be used for:

- references
- mood boards
- concepts
- mockups
- inspiration
- temporary assets

Before using as final game assets, simplify and adapt them.

Do not rely on raw AI concept art for every gameplay sprite.

---

# MVP Asset Priority Order

## Priority 01
Player sprite

## Priority 02
Enemy Drone sprite

## Priority 03
Pulse projectile and impact VFX

## Priority 04
Shock Field VFX

## Priority 05
Dead Grid floor tiles

## Priority 06
Basic HUD assets

## Priority 07
Assimilation Warden boss concept/gameplay sprite

---

# Production Rule

If an asset does not improve the first playable loop, delay it.

The MVP needs:

- readability
- atmosphere
- cohesion
- performance

Not endless asset variety.

---

# Final Asset Goal

The first asset set succeeds if a gameplay screenshot immediately feels like:

- AssimilationTotal
- dark sci-fi horror
- AI assimilation
- industrial oppression
- neon yellow identity

Even if the assets are simple.