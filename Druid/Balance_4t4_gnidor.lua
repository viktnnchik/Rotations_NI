local cache = {
    Info = true,
}
local spells = {
    Ogon = GetSpellInfo(770),
    Roi__nasekomih = GetSpellInfo(48468),
    Lunii__ogon = GetSpellInfo(48463),
    Gnev = GetSpellInfo(48461),
    Zvezdnii__ogon = GetSpellInfo(48465),
    Buff = GetSpellInfo(48470),
    Zvezdopad = GetSpellInfo(53201),
    Iner = GetSpellInfo(29166),
    --------------------
    Rassovaj__Draktir = GetSpellInfo(320554),
    Rassovaj__Orc = GetSpellInfo(316373),
    Rassovaj__Krovi = GetSpellInfo(316422),
    Rassovaj__Goblin = GetSpellInfo(316396),
    Rassovaj__Troll = GetSpellInfo(316407),
    --------------------
}
local queue = {
    "Info",
    "Buff",
    "Ogon",
    "Iner",
    "Rassovaj",
    "Zvezdopad",
    "Roi__nasekomih",
    "Lunii__ogon",
    "Gnev",
    "Zvezdnii__ogon",
    "",
    "",
    "",

};
local abilities = {
    
    -----------------------
    ["Info"] = function()
      if cache.Info == true then
          cache.Info = false
          print("                                         |cFFFF0000 =========================|r\
                                      |cFFFFFFFFСова 4т4|r\
                                      |cFFFF5A00Профиль by gn1dor43|r\
                                      |cFFFF0000=========================|r")
      end  
  end,
  -----------------------

    ["Ogon"] = function()
        if ni.spell.available(spells.Ogon)
        and not ni.unit.debuff("target",spells.Ogon,"player") then
            ni.spell.cast(spells.Ogon)
        end
    end,
    
  -----------------------
    ["Roi__nasekomih"] = function()
        if ni.spell.available(spells.Roi__nasekomih)
        and not ni.unit.debuff("target",spells.Roi__nasekomih,"player") then
            ni.spell.cast(spells.Roi__nasekomih)
        end
    end,
  -----------------------
    ["Lunii__ogon"] = function()
        if ni.spell.available(spells.Lunii__ogon)
        and not ni.unit.debuff("target",spells.Lunii__ogon,"player") then
            ni.spell.cast(spells.Lunii__ogon)
        end
    end,
  -----------------------
    ["Gnev"] = function()
        if not ni.unit.buff("player",48517,"exact")
        and not ni.unit.buff("player",48518,"exact")
        or ni.unit.buff("player",48517,"exact") then
            ni.spell.cast(spells.Gnev)
        end
    end,
  -----------------------
    ["Zvezdnii__ogon"] = function()
        if ni.unit.buff("player",48518,"exact")
        or ni.unit.buff("player",322774,"exact")
        and not ni.unit.buff("player",48517,"exact")
        and not ni.unit.buff("player",48518,"exact")
        or ni.unit.buff("player",48391,"exact")
        and not ni.unit.buff("player",48517,"exact")
        and not ni.unit.buff("player",48518,"exact") then
            ni.spell.cast(spells.Zvezdnii__ogon)
        end
    end,
  -----------------------
    ["Buff"] = function()
        if not ni.unit.buff("player",48470,"exact") then
            ni.spell.cast(spells.Buff)
        end
    end,
  -----------------------
    ["Zvezdopad"] = function()
        if ni.spell.available(spells.Zvezdopad) then
            ni.spell.cast(spells.Zvezdopad)
        end
    end,
  -----------------------
    ["Iner"] = function()
        if ni.power.current("player") < 60 then
            ni.spell.cast(spells.Iner)
        end
    end,
  -----------------------
    ["Rassovaj"] = function()
        if ni.spell.available(spells.Rassovaj__Draktir)
        and ni.unit.debuff("target", spells.Ogon, "player")
        or ni.spell.available(spells.Rassovaj__Orc)
        and ni.unit.debuff("target", spells.Ogon, "player") 
        or ni.spell.available(spells.Rassovaj__Krovi)
        and ni.unit.debuff("target", spells.Ogon, "player")  then
            ni.spell.cast(spells.Rassovaj__Draktir)
            ni.spell.cast(spells.Rassovaj__Orc)
            ni.spell.cast(spells.Rassovaj__Krovi)
        end
    end,
  -----------------------


}
ni.bootstrap.profile("Balance_4t4_gnidor",queue,abilities)