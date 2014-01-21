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
- Queued Spells (use '/modWW <spellname/spellID>')
  - Leg Sweep
  - Touch of Karma
  - Grapple Weapon
  - Diffuse Magic
  - Dampen Harm
  - Ring of Peace
  - Tiger's Lust
  - Healing Sphere
- Multitarget/AOE mode will only engage AOE abilities when both the multitarget toggle is set and there are at least 3 active enemies - this means that you can generally leave multitarget toggled on and not cast Spinning Crane Kick over and over
- Support for TigersEye Brew at 10 stacks when certain agility trinkets (AoC/Haromms/Sigil of Rampage/TED/Bad Juju) proc
- Automatic grapple weapon when the target is disarmable
- Automatic & smart Storm, Earth, and Fire on mouseover. It will not apply more than 2 clones, will prevent you from castting on your current target, and if you switch to a target with one on, it will cancel the spell. This is on a new toggle. Thanks to Tao for the routine
- International client support
- Virmen's Bite usage during Heroism



Hotkeys
====================
- Left Shift - Pause
- Left Control - Healing Sphere
- Left Alt - Touch of Karma
- Right Alt - Leg Sweep


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
- Self-Healing via Expel Harm while out of combat


Rotation
====================
- Most of the original 'rootWind' DPS rotation logic is the same and losely follows Icy-Veins
- Controlled single-target tests have shown this profile to perform within 1% of simcraft


Todo
====================
- Implement G52 Landshark usage as part of cooldowns
- Figure out how to get Healing Potions & Virmen's Bite potions to work 100% when potions are already on cooldown
- DPS fine-tuning

