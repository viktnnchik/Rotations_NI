local cache = {
  Info = true,
  stopcast = false,
}
local spells = {
    --------------------
    Rassovaj__Draktir = GetSpellInfo(320554),
    Rassovaj__Orc = GetSpellInfo(316373),
    Rassovaj__Krovi = GetSpellInfo(316422),
    Rassovaj__Goblin = GetSpellInfo(316396),
    Rassovaj__Troll = GetSpellInfo(316407),
    --------------------
    Oblik__tmi = GetSpellInfo(15473),
    Vnutr__ogon = GetSpellInfo(48168),
    Pricosnovenie__vampira = GetSpellInfo(48160),
    Slovo__bol = GetSpellInfo(48125),
    Slovo__smert = GetSpellInfo(48158),
    Chuma = GetSpellInfo(48300),
    Vzriv__razuma = GetSpellInfo(48127),
    Pitka__razuma = GetSpellInfo(48156),
    Temnoe__sokr = GetSpellInfo(319822),

}
local queue = {
  "Info",
  --"Vnutr__ogon",
  --"Oblik__tmi",
  "stop",
  "Rassovaj",
  "Slovo__smert",
  "Slovo__bol",
  "Chuma",
  "Vzriv__razuma",
  "Pitka__razuma",
  "Pricosnovenie__vampira",
  "",
  "",
}
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
  --["Oblik__tmi"] = function()
  --  if not ni.unit.buff("player",spells.Oblik__tmi,"exact") then
  --    ni.spell.cast(spells.Oblik__tmi)
  --  end
  --end,
  -----------------------
  --["Vnutr__ogon"] = function()
  --  if ni.unit.buff("player",spells.Vnutr__ogon,"exact") then
  --    ni.spell.cast(spells.Vnutr__ogon)
  --  end
  --end,
  -----------------------
  ["Pricosnovenie__vampira"] = function()
    if not ni.unit.debuff("target",spells.Pricosnovenie__vampira,"player")
    or ni.unit.debuffmaining("target",spells.Pricosnovenie__vampira,"player") < 1 then
      ni.spell.delaycast(spells.Pricosnovenie__vampira,"target", 1.5)
    end
  end,
  -----------------------
  ["Slovo__smert"] = function()
    if ni.spell.available(spells.Slovo__smert) then
      ni.spell.cast(spells.Slovo__smert)
    end
  end,
  -----------------------
  ["Slovo__bol"] = function()
    if ni.spell.available(spells.Slovo__bol)
    and not ni.unit.debuff("target",spells.Slovo__bol,"player") then
      ni.spell.delaycast(spells.Slovo__bol,"target", 1.5)
    end
  end,
  -----------------------
  ["Chuma"] = function()
    if ni.spell.available(spells.Chuma)
    and not ni.unit.debuff("target",spells.Chuma,"player") then
      ni.spell.delaycast(spells.Chuma,"target", 1.5)
    end
  end,
  -----------------------
  ["Vzriv__razuma"] = function()
    if ni.spell.available(spells.Vzriv__razuma)
    and ni.unit.debuff("target",spells.Chuma,"player")
    and ni.unit.debuff("target",spells.Slovo__bol,"player")
    and ni.unit.debuff("target",spells.Temnoe__sokr,"player")
    and ni.unit.debuff("target",spells.Pricosnovenie__vampira,"player")
    and not cache.stopcast
    and not ni.unit.ischanneling("player") then
      ni.spell.cast(spells.Vzriv__razuma)
    end
  end,
  -----------------------
  ["Pitka__razuma"] = function()
    if ni.unit.debuff("target",spells.Chuma,"player")
    and ni.unit.debuff("target",spells.Slovo__bol,"player")
    and ni.unit.debuff("target",spells.Temnoe__sokr,"player")
    and ni.unit.debuff("target",spells.Pricosnovenie__vampira,"player")
    and not cache.stopcast
    and not ni.unit.iscasting("player")
    and not ni.unit.ischanneling("player") then
      ni.spell.delaycast(spells.Pitka__razuma,"target", 1.5)
    end
  end,
  -----------------------
  ["Rassovaj"] = function()
    if ni.spell.available(spells.Rassovaj__Draktir)
    and ni.unit.debuff("target",spells.Chuma,"player")
    and ni.unit.debuff("target",spells.Slovo__bol,"player")
    and ni.unit.debuff("target",spells.Temnoe__sokr,"player")
    and ni.unit.debuff("target",spells.Pricosnovenie__vampira,"player")
    or ni.spell.available(spells.Rassovaj__Orc)
    and ni.unit.debuff("target",spells.Chuma,"player")
    and ni.unit.debuff("target",spells.Slovo__bol,"player")
    and ni.unit.debuff("target",spells.Temnoe__sokr,"player")
    and ni.unit.debuff("target",spells.Pricosnovenie__vampira,"player")
    or ni.spell.available(spells.Rassovaj__Krovi)
    and ni.unit.debuff("target",spells.Chuma,"player")
    and ni.unit.debuff("target",spells.Slovo__bol,"player")
    and ni.unit.debuff("target",spells.Temnoe__sokr,"player")
    and ni.unit.debuff("target",spells.Pricosnovenie__vampira,"player")
    or ni.spell.available(spells.Rassovaj__Goblin)
    and ni.unit.debuff("target",spells.Chuma,"player")
    and ni.unit.debuff("target",spells.Slovo__bol,"player")
    and ni.unit.debuff("target",spells.Temnoe__sokr,"player")
    and ni.unit.debuff("target",spells.Pricosnovenie__vampira,"player")
    or ni.spell.available(spells.Rassovaj__Troll)
    and ni.unit.debuff("target",spells.Chuma,"player")
    and ni.unit.debuff("target",spells.Slovo__bol,"player")
    and ni.unit.debuff("target",spells.Temnoe__sokr,"player")
    and ni.unit.debuff("target",spells.Pricosnovenie__vampira,"player")  then
      ni.spell.cast(spells.Rassovaj__Draktir)
      ni.spell.cast(spells.Rassovaj__Orc)
      ni.spell.cast(spells.Rassovaj__Krovi)
      ni.spell.cast(spells.Rassovaj__Goblin)
      ni.spell.cast(spells.Rassovaj__Troll)
    end
  end,

  -----------------------
    
  ["stop"] = function()
    if cache.stopcast then
  	  if ni.unit.iscasting("player")
  	  or ni.unit.ischanneling("player") then
        	ni.spell.stopcasting()
      end
    end
  end,
  -----------------------


}
ni.bootstrap.profile("Shadow_4t4_gnidor",queue,abilities)
