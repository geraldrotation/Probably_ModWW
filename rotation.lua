-- ProbablyEngine Rotation Packager
-- Custom Windwalker Monk Rotation - modified from rootWind's original WW rotation
-- Forked on Jan 2nd 2014

ProbablyEngine.rotation.register_custom(269, "modWW",
{
  -- Combat

  -- Pause 
  { "pause", "modifier.lshift" },

  -- Keyboard modifiers
  { "115460", "modifier.lcontrol", "ground" },  -- Healing Sphere
  { "119381", "modifier.ralt" },              -- Leg Sweep
  { "122470", "modifier.lalt" },              -- Touch of Karma

  -- SEF on mouseover with lcontrol key
  --{ "137639", { "modifier.lcontrol", "!modifier.last(137639)" }, "mouseover" },
  { "137639", { "toggle.autosef", "@modWW.SEF()" }, "mouseover" },
  { "/cancelaura 137639", { "@modWW.cancelSEF", "toggle.autosef" }},
  --{ "/cancelaura Storm, Earth, and Fire", { "@modWW.cancelSEF", "toggle.autosef" }},

  -- Interrupts
  {{
    { "115078", { -- Paralysis when SHS, Ring of Peace, and Quaking Palm are all on CD
       "!target.debuff(116705)",
       "player.spell(116705).cooldown > 0",
       "player.spell(116844).cooldown > 0",
       "player.spell(107079).cooldown > 0",
       "!modifier.last(116705)"
    }}, 
    { "116844", { -- Ring of Peace when SHS is on CD
       "!target.debuff(116705)",
       "player.spell(116705).cooldown > 0",
       "!modifier.last(116705)"
    }}, 
    { "107079", { -- Quaking Palm when SHS and Ring of Peace are on CD
       "!target.debuff(116705)",
       "player.spell(116705).cooldown > 0",
       "player.spell(116844).cooldown > 0",
       "!modifier.last(116705)"
    }}, 
    { "116705" }, -- Spear Hand Strike
  }, "target.interruptAt(50)" },

  -- Buffs
  { "116781", { -- Legacy of the White Tiger
    "!player.buff(116781).any",
    "!player.buff(17007).any",
    "!player.buff(1459).any",
    "!player.buff(61316).any",
    "!player.buff(24604).any",
    "!player.buff(90309).any",
    "!player.buff(126373).any",
    "!player.buff(126309).any"
  }},
  { "115921", { -- Legacy of the Emperor
      "!player.buff(117666).any",
      "!player.buff(1126).any",
      "!player.buff(20217).any",
      "!player.buff(90363).any"
  }},
  -- Queued Spells
  { "119381", "@modWW.checkQueue(119381)" }, -- Leg Sweep
  { "122470", "@modWW.checkQueue(122470)" }, -- Touch of Karma
  { "117368", "@modWW.checkQueue(117368)" }, -- Grapple Weapon
  { "122783", "@modWW.checkQueue(122783)" }, -- Diffuse Magic
  { "122278", "@modWW.checkQueue(122278)" }, -- Dampen Harm
  { "116844", "@modWW.checkQueue(116844)" }, -- Ring of Peace
  { "116841", "@modWW.checkQueue(116841)" }, -- Tiger's Lust
  { "115460", "@modWW.checkQueue(115460)", "ground" }, -- Healing Sphere

  -- Cooldowns
  {{
    { "121279" }, -- Lifeblood
    { "26297" }, -- Berserking
    { "20572" }, -- Blood Fury
    { "33697" }, -- Blood Fury
    { "33702" }, -- Blood Fury

    { "123904" }, -- Invoke Xuen, the White Tiger
    {{
       { "#gloves" },
       --{ "#76089", "player.hashero" }, -- Virmen's Bite whenever we are in heroism/bloodlust
       -- TODO: G91 Landshark causes a lot of things to break - avoid using it until we can figure out how to fix it
       --{ "#77589", "@modWW.Landshark()" }, -- G91 Landshark
    }, "toggle.useItem" },
  }, "modifier.cooldowns" },

  -- Survival
  { "115072", "player.health <= 80" }, -- Expel Harm
  { "115098", "player.health <= 75" }, -- Chi Wave

  { "115203", { -- Forifying Brew at < 30% health and when DM & DH buff is not up
    "player.health < 30",
    "!player.buff(122783)", --DM
    "!player.buff(122278)" --DH
  }}, 
  { "122783", { -- Diffuse Magic at < 50% health and when FB & DH buff is not up
    "player.health < 50",
    "!player.buff(115203)", --FB
    "!player.buff(122278)" --DH
  }}, 
  { "122278", { -- Dampen Harm at < 50% health and when FB & DM buff is not up
    "player.health < 50",
    "!player.buff(115203)", --FB
    "!player.buff(122783)" --DM
  }}, 
  {{
     { "#5512", "player.health < 40" }, -- Healthstone (simpler?)
     -- This is still broken if the potion is on cooldown
     -- { "#76097", "@modWW.MasterHealingPotion()", "player.health < 40" }, -- Master Healing Potion
  }, "toggle.useItem" },

  { "115450", "player.dispellable(115450)", "player" }, -- Detox yourself if you can be dispelled

  { "137562", "player.state.disorient" }, -- 137562 = Nimble Brew
  { "137562", "player.state.fear" },
  { "137562", "player.state.stun" },
  { "137562", "player.state.root" },
  { "137562", "player.state.horror" },
  { "137562", "player.state.snare" },

  { "116841", "player.state.disorient" }, -- 116841 = Tiger's Lust
  { "116841", "player.state.stun" },
  { "116841", "player.state.root" },
  { "116841", "player.state.snare" },

  -- Shared
  {{
    { "115080", "player.buff(121125)" }, -- Touch of Death
    { "117368", "target.disarmable" }, -- Grapple Weapon
    -- Ring of Peace when Grapple Weapon debuff is not present, is on CD, and the target is in melee range
    --{ "116844", { "!player.buff(123231)", "player.spell(117368).cooldown > 0", "target.range <= 5" }},
    {{
      -- Chi Brew
      { "115399", "player.spell(115399).charges = 2" },
      { "115399", { "player.spell(115399).charges = 1", "player.spell(115399).cd <= 10", }}},
    { "player.chi <= 2" }},

    -- Tiger Palm
    { "100787", { "player.buff(125359)", "player.buff(125359).duration <= 3" }},
    { "100787", "!player.buff(125359)" }, 

    --Tigereye brew w/ agi trinket procs & the following conditions: at least 10 stacks, TeB buff not already up, and tiger power buff will be up at least 2 seconds
    {{
      --Assurance of Consequence Proc
      { "116740", "player.buff(146308).duration >= 10" },
      --Haromm's Talisman Proc
      { "116740", "player.buff(148904).duration >= 5" },
      --Heroic Haromm's Talisman Proc
      { "116740", "player.buff(148903).duration >= 5" },
      --Sigil of Rampage Proc
      { "116740", "player.buff(148895).duration >= 5" },
      --Ticking Ebon Detonator
      { "116740", "player.buff(146311).duration >= 5" },
      --Bad Juju
      { "116740", "player.buff(138939).duration >= 5" }
    }, { "player.buff(125195).count >= 10", "!player.buff(116740)", "player.buff(125359).duration > 2" }},

    --Tigereye Brew @ 15stacks (prevent capping) with the following conditions: at least 2 chi, at least 15 stacks, TeB buff not already up, tiger power buff will be up at least 2 seconds, and RsK debuff is already on the target
    { "116740", { "player.chi >= 2", "player.buff(125195).count >= 15", "!player.buff(116740)", "player.buff(125359).duration > 2", "target.debuff(130320)" }},

    -- Energizing Brew when it will take more than 5 secs to max-out energy
    { "115288", "player.timetomax > 5" },
    { "107428", "!target.debuff(130320)" }, -- Rising Stun Kick
    { "100787", -- Tiger Palm
      { "!player.buff(125359)", "target.debuff(130320)", "target.debuff(130320).duration > 1", "player.timetomax > 1" }},
    -- AoE
    {{
      { "116847" },
      { "115098" },
      { "123986", "!player.moving" },
      { "107428", { "player.chi = 4", "!player.spell(115396).exists" }}, -- Rising Stun Kick
      { "107428", { "player.chi = 5", "player.spell(115396).exists" }}, -- Rising Stun Kick
      { "101546", "!player.spell(116847).exists" }
    }, 
    {
        "toggle.multitarget",
        "modifier.enemies > 2" -- Even is AOE is enabled, don't use unless there are at least 3 enemies
    },
    },

    -- Single
    { "107428" },
    { "113656",
      { "!player.moving", "!player.buff(115288)", "player.timetomax > 4", "player.buff(125359).duration > 4" }},
    {{
      { "115098" },
      { "123986", { "!player.moving", }},
      { "124081", "!focus.buff(124081)", "focus" },
      { "124081", "!player.buff(124081)", "player" },
    }, "player.timetomax > 2" },
    { "100784", "player.buff(116768)" },
    {{
      { "100787", "player.buff(118864).duration <= 2" },
      { "100787", "player.energy >= 2" }
    }, "player.buff(118864)" },
    { "108557", "player.chi <= 2" },
    { "108557", { "player.chi <= 3", "player.spell(115396).exists" }},
    { "100780", "player.chi <= 2" },
    { "100780", { "player.chi <= 3", "player.spell(115396).exists" }},
    { "100784", "@modWW.fillBlackout" },
  }, "target.range <= 5" },

  -- Ranged
  {{
    { "115073", -- Spinning Fire Blossom - best when used glyphed to void random blossoms going all over the combat area
      {
        "target.range > 5",
        "target.range <= 50",
        "player.chi > 1"
      }
    },
    { "117952", -- Crackling Jade Lightning
      {
        "target.range > 5",
        "target.range <= 40",
        "!player.moving"
      }
    },
    { "115072", "player.chi < 4" } -- Expel Harm
  }, "@modWW.immuneEvents" },
},
{
  -- Out of Combat
  -- Buffs
  { "116781", { -- Legacy of the White Tiger
    "!player.buff(116781).any",
    "!player.buff(17007).any",
    "!player.buff(1459).any",
    "!player.buff(61316).any",
    "!player.buff(24604).any",
    "!player.buff(90309).any",
    "!player.buff(126373).any",
    "!player.buff(126309).any"
  }},
  { "115921", { -- Legacy of the Emperor
      "!player.buff(117666).any",
      "!player.buff(1126).any",
      "!player.buff(20217).any",
      "!player.buff(90363).any"
  }},
  { "115072", "player.health < 100" }, -- Expel Harm when not at full health
  { "115072", "toggle.chistacker" } -- Expel Harm
}, function()
ProbablyEngine.toggle.create('chistacker', 'Interface\\Icons\\ability_monk_expelharm', 'Stack Chi', 'Keep Chi at full even OoC...')
ProbablyEngine.toggle.create('useItem', 'Interface\\Icons\\trade_alchemy_potiona2', 'Use Items', 'Toggle for item usage since it is so buggy')
ProbablyEngine.toggle.create('autosef', 'Interface\\Icons\\spell_sandstorm', 'Auto SEF', 'Automatically cast SEF on mouseover targets')
end)
