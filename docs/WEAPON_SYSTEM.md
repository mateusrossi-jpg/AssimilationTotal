# AssimilationTotal — Weapon System

The weapon system must support two clear weapon families from the beginning:

- ranged attacks
- melee / close-range attacks

The goal is to keep the MVP simple, but avoid locking the architecture into only projectile weapons.

---

# Core Weapon Philosophy

Weapons should feel:

- automatic
- readable
- satisfying
- sci-fi
- scalable
- mobile-friendly

The player should focus on movement, positioning, survival, and upgrade choices.

Manual aiming is not part of the MVP.

---

# Weapon Families

## 1. Ranged Weapons

Ranged weapons attack enemies at a distance.

They usually use:

- projectiles
- beams
- targeting logic
- nearest enemy detection
- piercing or chaining effects later

---

# Ranged Examples

## Pulse Gun
Basic automatic projectile weapon.

## Rail Shot
Slow but powerful piercing shot.

## Electric Arc
Chain lightning between enemies.

## Drone Shot
A drone that fires automatically.

---

# 2. Melee / Close-Range Weapons

Melee weapons attack enemies near the player.

They usually use:

- circular hit areas
- pulse damage
- rotating blades
- energy fields
- area-of-effect attacks

---

# Melee Examples

## Shock Field
Electric pulse around the player.

## Energy Blade
Rotating energy slash.

## Nano Swarm
Damage over time near the player.

## Magnetic Repulse
Close-range pulse that damages and pushes enemies.

---

# MVP Weapon Set

The MVP should start with only 2 weapons:

## 1. Pulse Gun
Primary ranged weapon.

Purpose:

- long-range pressure
- basic enemy clearing
- first combat baseline

## 2. Shock Field
Primary melee/defensive weapon.

Purpose:

- close-range survival
- horde pressure control
- satisfying area pulse

---

# Why This Is Good For MVP

This creates two distinct gameplay feelings:

## Pulse Gun
"I can eliminate threats before they reach me."

## Shock Field
"I can survive when the swarm surrounds me."

This combination makes the first prototype feel much better without requiring many weapons.

---

# Recommended Script Structure

```txt
scripts/weapons/
├── weapon_base.gd
├── ranged_weapon.gd
├── melee_weapon.gd
├── pulse_gun.gd
├── shock_field.gd
└── projectile.gd
```

---

# Base Weapon Concept

All weapons should share:

- owner/player reference
- cooldown
- damage
- upgrade modifiers
- activate/attack behavior

---

# Ranged Weapon Concept

Ranged weapons should:

- find target
- aim automatically
- spawn projectile or beam
- apply damage at distance

---

# Melee Weapon Concept

Melee weapons should:

- activate around player
- damage nearby enemies
- optionally pulse on cooldown
- optionally create VFX around player

---

# MVP Upgrade Compatibility

Weapon upgrades should affect:

## Pulse Gun
- damage
- fire rate
- projectile speed
- extra projectile
- piercing later

## Shock Field
- radius
- damage
- cooldown
- knockback later
- pulse count later

---

# Sync Compatibility

Corrupted upgrades can modify both weapon families.

Examples:

## Pulse Gun Corrupted Upgrade
Overclock Protocol:

- increased fire rate
- increased Sync

## Shock Field Corrupted Upgrade
Neural Discharge:

- stronger field pulse
- larger radius
- increased Sync

---

# Visual Direction

## Ranged

- sharp energy shots
- neon yellow projectile trails
- electric impacts
- muzzle flashes

## Melee

- circular energy pulses
- electric rings
- unstable glow
- close-range sparks

---

# MVP Rule

Do not create many weapons early.

Create only:

- one ranged weapon
- one melee weapon

Make them feel excellent before expanding.

---

# Success Goal

The weapon system succeeds when:

- Pulse Gun feels satisfying at range
- Shock Field feels satisfying under pressure
- both systems are upgradeable
- the architecture can expand later without becoming complex now