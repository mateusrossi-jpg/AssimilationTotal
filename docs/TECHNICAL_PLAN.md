# AssimilationTotal — Technical Plan

## Engine

**Godot 4.x**

Reason:

- Good for 2D top-down games
- Lightweight for Android
- Fast iteration
- No engine royalties for this project scale
- Strong fit for solo/indie MVP production

## MVP Technical Priority

The first technical milestone is not visual polish. It is a playable loop:

1. Player movement
2. Enemy spawn/chase
3. Automatic weapon fire
4. Enemy death
5. XP pickup
6. Level up
7. Upgrade selection
8. Boss spawn
9. Death/restart

## Architecture Rule

Keep systems simple, but separate enough to expand later.

Avoid building a massive framework before the game is fun.

## Initial Folder Structure

```txt
assets/
  audio/
  sprites/
  vfx/

docs/

scenes/
  enemies/
  maps/
  player/
  ui/
  weapons/

scripts/
  enemies/
  player/
  systems/
  ui/
  weapons/
```

## First Playable Target

The first playable target must include:

- A controllable player
- A basic arena
- One enemy type
- One automatic weapon
- Basic health/damage
- Basic enemy death

Only after this should we polish the visual layer.

## Code Style

- Keep scripts short
- Prefer clear names over clever abstractions
- Avoid premature optimization
- Use exported variables for tuning
- Use signals for communication between systems

## Godot Scene Strategy

### Main Scene
Controls the current run and connects systems.

### Player Scene
Contains player movement, health, and player state.

### Enemy Scene
Basic enemy behavior.

### Weapon Scene/System
Automatic attacks owned by the player.

### Spawn Manager
Controls enemy waves.

### UI Scene
Displays health, XP, Sync, timer and level-up choices.

## MVP Anti-Complexity Rule

Do not add these before the first playable prototype:

- Save system
- Complex menus
- Multiple characters
- Multiple maps
- Multiple bosses
- Ads
- Store/shop
- Achievements
- Cloud sync
- Complex procedural generation

## Immediate Next Step

Create the Godot project skeleton with placeholder scenes and scripts.