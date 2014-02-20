local modWW = { }
local DSL = ProbablyEngine.dsl.get

modWW.items = { }
modWW.flagged = GetTime()
modWW.unflagged = GetTime()
modWW.queueSpell = nil
modWW.queueTime = 0
modWW.sefUnits = {}
modWW.lastSEFCount = 0
modWW.lastSEFTarget = nil

    local function onUpdate(self,elapsed)
      if self.time < GetTime() - 2.5 then
        if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
      end
    end
    mww = CreateFrame("Frame",nil,ChatFrame1)
    mww:SetSize(ChatFrame1:GetWidth(),30)
    mww:Hide()
    mww:SetScript("OnUpdate",onUpdate)
    mww:SetPoint("TOPLEFT",0,150)
    mww.text = mww:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
    mww.text:SetAllPoints()
    mww.texture = mww:CreateTexture()
    mww.texture:SetAllPoints()
    mww.texture:SetTexture(0,0,0,.50)
    mww.time = 0
    function mww:message(message)
      self.text:SetText(message)
      self:SetAlpha(1)
      self.time = GetTime()
      self:Show()
    end

    local function onUpdate(self,elapsed)
      if self.time < GetTime() - 2.8 then
        if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
      end
    end
    mww = CreateFrame("Frame",nil,ChatFrame1)
    mww:SetSize(ChatFrame1:GetWidth(),30)
    mww:Hide()
    mww:SetScript("OnUpdate",onUpdate)
    mww:SetPoint("TOP",0,0)
    mww.text = mww:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
    mww.text:SetAllPoints()
    mww.texture = mww:CreateTexture()
    mww.texture:SetAllPoints()
    mww.texture:SetTexture(0,0,0,.50)
    mww.time = 0
    function mww:message(message)
      self.text:SetText(message)
      self:SetAlpha(1)
      self.time = GetTime()
      self:Show()
    end



ProbablyEngine.command.register('modWW', function(msg, box)
  local command, text = msg:match("^(%S*)%s*(.-)$")

  if command == 'toggle' then
    if ProbablyEngine.config.read('button_states', 'MasterToggle', false) then
        ProbablyEngine.buttons.toggle('MasterToggle')
        mww:message("|cFFB30000modWW off")
    else
        ProbablyEngine.buttons.toggle('MasterToggle')
        mww:message("|cFF00B34AmodWW on")
    end
  end
  if command == 'kick' then
    if ProbablyEngine.config.read('button_states', 'interrupt', false) then
      ProbablyEngine.buttons.toggle('interrupt')
      mww:message("|cFFB30000Interrupts off")
    else
      ProbablyEngine.buttons.toggle('interrupt')
      mww:message("|cFF00B34AInterrupts on")
    end
  end

  if command == 'cds' then
    if ProbablyEngine.config.read('button_states', 'cooldowns', false) then
      ProbablyEngine.buttons.toggle('cooldowns')
      mww:message("|cFFB30000Xuen off")
    else
      ProbablyEngine.buttons.toggle('cooldowns')
      mww:message("|cFF00B34AXuen on")
    end
  end

  if command == 'aoe' then
    if ProbablyEngine.config.read('button_states', 'multitarget', false) then
      ProbablyEngine.buttons.toggle('multitarget')
      mww:message("|cFFB30000AoE off")
    else
      ProbablyEngine.buttons.toggle('multitarget')
      mww:message("|cFF00B34AAoE on")
    end
  end

  if command == 'chistacker' then
    if ProbablyEngine.config.read('button_states', 'chistacker', false) then
      ProbablyEngine.buttons.toggle('chistacker')
      mww:message("|cFFB30000Auto Chi Stacking off")
    else
      ProbablyEngine.buttons.toggle('chistacker')
      mww:message("|cFF00B34AAuto Chi Stacking on")
    end
  end

  if command == 'useItem' then
    if ProbablyEngine.config.read('button_states', 'useItem', false) then
      ProbablyEngine.buttons.toggle('useItem')
      mww:message("|cFFB30000Automatic Item Usage off")
    else
      ProbablyEngine.buttons.toggle('useItem')
      mww:message("|cFF00B34AAutomatic Item Usage on")
    end
  end

  if command == 'autosef' then
    if ProbablyEngine.config.read('button_states', 'autosef', false) then
      ProbablyEngine.buttons.toggle('autosef')
      mww:message("|cFFB30000Automatic SE&F Mouseover off")
    else
      ProbablyEngine.buttons.toggle('autosef')
      mww:message("|cFF00B34AAutomatic SE&F Mouseover on")
    end
  end

  if command == 'macros' then
    modWW.createAllMacros()
  end

  if command == 'help' then
    modWW.macroHelp()
  end


  if command == "qKarma" or command == 122470 then
    modWW.queueSpell = 122470 -- Touch of Karma
    mww.message("Touch of Karma queued")
  elseif command == "qGrapple" or command == 117368 then
    modWW.queueSpell = 117368 -- Grapple Weapon
    mww.message("Grapple Weapon queued")
  elseif command == "qLust" or command == 116841 then
    modWW.queueSpell = 116841 -- Tiger's Lust
    mww.message("Tger's Lust queued")
  elseif command == "qSphere" or command == 115460 then
    modWW.queueSpell = 115460 -- Healing Sphere
    mww.message("Healing Sphere queued")
  elseif command == "qTfour" then
    if select(2,GetTalentRowSelectionInfo(4)) == 10 then
        modWW.queueSpell = 116844 -- Ring of Peace
        mww.message("Ring of Peace queued")
    elseif select(2,GetTalentRowSelectionInfo(4)) == 11 then
        modWW.queueSpell = 119392 -- Charging Ox Wave
        mww.message("Charging Ox Wave queued")
    elseif select(2,GetTalentRowSelectionInfo(4)) == 12 then
        modWW.queueSpell = 119381 -- Leg Sweep
        mww.message("Leg Sweep queued")
    end
  elseif command == "qTfive" then
    if select(2,GetTalentRowSelectionInfo(5)) == 14 then
        modWW.queueSpell = 122278 -- Dampen Harm
        mww.message("Dampen Harm queued")
    elseif select(2,GetTalentRowSelectionInfo(5)) == 15 then
        modWW.queueSpell = 122783 -- Diffuse Magic
        mww.message("Diffuse Magic queued")
    end
  else
    modWW.queueSpell = nil
  end
  if modWW.queueSpell ~= nil then modWW.queueTime = GetTime() end
end)

modWW.checkQueue = function (spellId)
    if (GetTime() - modWW.queueTime) > 10 then
        modWW.queueTime = 0
        modWW.queueSpell = nil
    return false
    else
    if modWW.queueSpell then
        if modWW.queueSpell == spellId then
            if ProbablyEngine.parser.lastCast == GetSpellName(spellId) then
                modWW.queueSpell = nil
                modWW.queueTime = 0
            end
        return true
        end
    end
    end
    return false
end

function modWW.createAllMacros( ... )
  local usedslots = select(2,GetNumMacros())
  if usedslots <= 12 then
    CreateMacro("kick", "INV_MISC_QUESTIONMARK", "#showtooltip Spear Hand Strike\n/modWW kick", 1, 1)
    CreateMacro("cds", "INV_MISC_QUESTIONMARK", "#showtooltip Invoke Xuen, the White Tiger\n/modWW cds", 1, 1)
    CreateMacro("aoe", "Ability_warlock_jinx", "/modWW aoe", 1, 1)
    CreateMacro("chistacker", "INV_MISC_QUESTIONMARK", "#showtooltip Expel Harm\n/modWW cds", 1, 1)
    CreateMacro("useItem", "Spell_Magic_PolymorphRabbit", "/modWW useItem", 1, 1)
    CreateMacro("autosef", "INV_MISC_QUESTIONMARK", "#showtooltip Storm, Earth, and Fire\n/modWW autosef", 1, 1)
    CreateMacro("qKarma", "INV_MISC_QUESTIONMARK", "#showtooltip Touch of Karma\n/modWW qKarma", 1, 1)
    CreateMacro("qGrapple", "INV_MISC_QUESTIONMARK", "#showtooltip Grapple Weapon\n/modWW qGrapple", 1, 1)
    CreateMacro("qLust", "INV_MISC_QUESTIONMARK", "#showtooltip Tiger's Lust\n/modWW qLust", 1, 1)
    CreateMacro("qSphere", "INV_MISC_QUESTIONMARK", "#showtooltip Healing Sphere\n/modWW qSphere", 1, 1)
    CreateMacro("qTfour", "ability_parry", "/modWW qTfour", 1, 1)
    CreateMacro("qTfive", "ability_parry", "/modWW qTfive", 1, 1)
  else
    print("You don't have enough free Macroslots")
  end
end
-----------------------------------------------------------------------------------------------------------------------------
-- Create Help Message ------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
function modWW.macroHelp( ... )
  print("|cFF32ff84ModWW")
  print("|cFF32ff84Commands:|r\n/modWW macros - Create all Toggle / Spellqueue Macros")
  print("|cFF32ff84Toggle Macros:|r\n/modWW toggle - Rotation on/off\n/modWW kick - Interrupt & Disarm on/off\n/modWW cds - Xuen on/off\n/modWW aoe - Multitarget-Rotation on/off\n/modWW chistacker - Chi Stacking on/off\n/modWW useItem - Auto item usage on/off\n/modWW autosef - Auto mouseover SE&F on/off")
  print("|cFF32ff84Queue Macros:|r\n/modWW qKarma | qGrapple | qLust | qSphere | qTfour | qTfive")
end



modWW.setFlagged = function (self, ...)
  modWW.flagged = GetTime()
end

modWW.setUnflagged = function (self, ...)
  modWW.unflagged = GetTime()
  if modWW.items[77589] then
    modWW.items[77589].exp = modWW.unflagged + 60
  end
end

modWW.eventHandler = function(self, ...)
  local subEvent		= select(1, ...)
  local source		= select(4, ...)
  local destGUID		= select(7, ...)
  local spellID		= select(11, ...)
  local failedType = select(14, ...)
  
  if UnitName("player") == source then
    if subEvent == "SPELL_CAST_SUCCESS" then
      if spellID == 5512 then -- Healthstone
        modWW.items[5512] = { lastCast = GetTime() }
      end
      if spellID == 124199 then -- Landshark (itemId 77589)
        modWW.items[77589] = { lastCast = GetTime(), exp = 0 }
      end
    end
  end
end

ProbablyEngine.listener.register("modWW", "COMBAT_LOG_EVENT_UNFILTERED", modWW.eventHandler)
ProbablyEngine.listener.register("modWW", "PLAYER_REGEN_DISABLED", modWW.setFlagged)
ProbablyEngine.listener.register("modWW", "PLAYER_REGEN_DISABLED", modWW.resetLists)
ProbablyEngine.listener.register("modWW", "PLAYER_REGEN_DISABLED", modWW.setUnflagged)
ProbablyEngine.listener.register("modWW", "PLAYER_REGEN_ENABLED", modWW.resetLists)

function modWW.spellCooldown(spell)
  local spellName = GetSpellInfo(spell)
  if spellName then
    local spellCDstart,spellCDduration,_ = GetSpellCooldown(spellName)
    if spellCDduration == 0 then
      return 0
    elseif spellCDduration > 0 then
      local spellCD = spellCDstart + spellCDduration - GetTime()
      return spellCD
    end
  end
  return 0
end

function modWW.fillBlackout()
  local energy = UnitPower("player")
  local regen = select(2, GetPowerRegen("player"))
  local start, duration, enabled = GetSpellCooldown(107428)
  if not start then return false end
  if start ~= 0 then
    local remains = start + duration - GetTime()
    return (energy + regen * remains) >= 40
  end
  return 0
  
end


function modWW.immuneEvents(unit)
  if not UnitAffectingCombat(unit) then return false end
  -- Crowd Control
  local cc = {
    49203, -- Hungering Cold
     6770, -- Sap
     1776, -- Gouge
    51514, -- Hex
     9484, -- Shackle Undead
      118, -- Polymorph
    28272, -- Polymorph (pig)
    28271, -- Polymorph (turtle)
    61305, -- Polymorph (black cat)
    61025, -- Polymorph (serpent) -- FIXME: gone ?
    61721, -- Polymorph (rabbit)
    61780, -- Polymorph (turkey)
     3355, -- Freezing Trap
    19386, -- Wyvern Sting
    20066, -- Repentance
    90337, -- Bad Manner (Monkey) -- FIXME: to check
     2637, -- Hibernate
    82676, -- Ring of Frost
   115078, -- Paralysis
    76780, -- Bind Elemental
     9484, -- Shackle Undead
     1513, -- Scare Beast
   115268, -- Mesmerize
  }
  if modWW.hasDebuffTable(unit, cc) then return false end
  if UnitAura(unit,GetSpellInfo(116994))
		or UnitAura(unit,GetSpellInfo(122540))
		or UnitAura(unit,GetSpellInfo(123250))
		or UnitAura(unit,GetSpellInfo(106062))
		or UnitAura(unit,GetSpellInfo(110945))
		or UnitAura(unit,GetSpellInfo(143593)) -- General Nazgrim: Defensive Stance
    or UnitAura(unit,GetSpellInfo(143574)) -- Heroic Immerseus: Swelling Corruption
		then return false end
  return true
end

function modWW.hasDebuffTable(target, spells)
  for i = 1, 40 do
    local _,_,_,_,_,_,_,_,_,_,spellId = _G['UnitDebuff'](target, i)
    for k,v in pairs(spells) do
      if spellId == v then return true end
    end
  end
end

-- G91 Landshark - probably deprecated
function modWW.checkShark(target)
  if GetItemCount(77589, false, false) > 0 then
    if not modWW.items[77589] then return true end
    if modWW.items[77589].exp ~= 0 and
      modWW.items[77589].exp < GetTime() then return true end
  end
end

-- G91 Landshark - probably deprecated or not working correctly
function modWW.Landshark()
  if GetItemCount(77589, false, false) > 0 then
    if not modWW.items[77589] then return true end
    if modWW.items[77589].exp ~= 0 and
      modWW.items[77589].exp < GetTime() then return true end
  end
end

function modWW.SEF()
  local count = DSL('buff.count')('player', '137639')
  if count > modWW.lastSEFCount and modWW.lastSEFTarget then
    modWW.sefUnits[modWW.lastSEFTarget], modWW.lastSEFCount, modWW.lastSEFTarget = true, count, nil
  end

  if count < 2
     and DSL('enemy')('mouseover')
     and DSL('modifier.enemies')() > 1 then

    local mouseover, target = UnitGUID('mouseover'), UnitGUID('target')

    if mouseover and target ~= mouseover and not modWW.sefUnits[mouseover] then
      modWW.lastSEFTarget = mouseover
      return true
    end
  end

  return false
end

function modWW.cancelSEF()
  if DSL('buff')('player', '137639')
     and DSL('modifier.enemies')() < 2 then
    modWW.sefUnits, modWW.lastSEFCount, modWW.lastSEFTarget = {}, 0, nil
    return true
  end
  return false
end



ProbablyEngine.library.register("modWW", modWW)
