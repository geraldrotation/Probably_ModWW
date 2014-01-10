Probably_modWW
====================
Windwalker Monk Rotation Assist for ProbablyEngine - originally forked from the rootWW rotation


Features
====================
- Self Buffs in & out of combat
- Cooldowns
- Potions (not working correctly when used in conjunction with healthstone)
- Synapse Springs / Gloves item slot
- Chi Stacking on a toggle so that you can have max chi as combat starts
- Castcading Interrupts when cast time is at 50%: 
  - Spear Hand Strike
  - Ring of Peace (if talent chosen) when SHS is on CD
  - Pandaran racial Quaking Palm (if able to use) when SHS & Ring of Peace are both on CD
  - Paralysis when SHS, Quaking Palm, & Ring of Peace are all on CD
- Queued Spells (don't actually use this so not sure if it's working 100%)
  - Leg Sweep
  - Touch of Karma
  - Grapple Weapon
  - Diffuse Magic
  - Dampen Harm
  - Ring of Peace
  - Tiger's Lust
  - Healing Sphere
- Multitarget/AOE mode will only engage AOE abilities when both the multitarget toggle is set and there are at least 3 active enemies
- Support for TigersEye Brew at 10 stacks when certain agility trinkets (AoC/Haromms/Sigil of Rampage/TED/Bad Juju) proc
- Automatic grapple weapon when the target is disarmable
-Automatic & smart Storm, Earth, and Fire on mouseover. It will not apply more than 2 clones, will prevent you from castting on your current target, and if you switch to a target with one on, it will cancel the spell. This is on a new toggle. Thanks to Tao for the routine
-International client support


Hotkeys
====================
Left Shift - Pause
Left Control - <OPEN>
Left Alt - Touch of Karma
Healing Sphere - Right Shift
Leg Sweep - Right Alt


Survival
====================
- Expel Harm <= 80% health
- Chi Wave <= 75% health
- Forifying Brew at < 30% health and when DM & DH buff is not up
- Diffuse Magic at < 50% health and when FB & DH buff is not up
- Dampen Harm at < 50% health and when FB & DM buff is not up
- Healthstone
- Detox yourself if you can be dispelled
- Nimble Brew if you are disoriented/feared/stunned/rooted/snared
- Tiger's List if you are disoriented/stunned/rooted/snared


Todo
====================
- Implement G52 Landshark usage as part of cooldowns
- Virmen's Bite usage during hero/bloodlust
- Figure out how to get Healing Potions & Virmen's Bite potions to work 100% when potions are already on cooldown
- More cleanup and optimization and other fancy tricks

