local cache = {
  Info = true,
}
local spells = {
  Metka = GetSpellInfo(53338),
  Ykyc__zmei = GetSpellInfo(49001),
  Bistria__strelba = GetSpellInfo(3045),
  Vistrel__pricelnii = GetSpellInfo(49050),
  Vistrel__himeri = GetSpellInfo(53209),
  Vistrel__glushashii = GetSpellInfo(34490),
  Vistrel__ubiistvenii = GetSpellInfo(61006),
  Vistrel__vernii = GetSpellInfo(49052),
  Duh__drakondora = GetSpellInfo(61847),
  Duh__gaduki = GetSpellInfo(34074),
  Aura__metkogo = GetSpellInfo(19506),
  Gotovnost = GetSpellInfo(23989),
    --------------------
  Rassovaj__Draktir = GetSpellInfo(320554),
  Rassovaj__Orc = GetSpellInfo(316373),
  Rassovaj__Krovi = GetSpellInfo(316422),
  Rassovaj__Goblin = GetSpellInfo(316396),
  --------------------

}
local queue = {
  "Info",
  "Duh__drakondora",
  "Aura__metkogo",
  "Metka",
  "Ykyc__zmei",
  "Vistrel__glushashii",
  "Vistrel__vernii",
  "Vistrel__ubiistvenii",
  "Rassovaj",
  "Bistria__strelba",
  "Gotovnost",
  "Vistrel__pricelnii",
  "Vistrel__himeri",
  "",
  "",
  "",
  "",
  "",
  "",
};
local abilities = {
  -----------------------
  ["Info"] = function()
        if cache.Info == true then
            cache.Info = false
            print("                                         |cFFFF0000  =======================|r\
                                        |cFFFFFFFFММ-хант 4т4|r\
                                        |cFFFF5A00Профиль by gn1dor43|r\
                                        |cFFFF0000=======================|r")
        end  
  end,
  -----------------------
  ["Duh__drakondora"] = function()
    if not ni.unit.buff("player",61847,"exact")
    and ni.power.current("player") > 1000 then
      ni.spell.cast(spells.Duh__drakondora) 
    end
  end,
  -----------------------
  ["Metka"] = function()
    if ni.spell.available(spells.Metka)
    and not ni.unit.debuff("target",spells.Metka,"player") then
      ni.spell.cast(spells.Metka)
    end
  end,
  -----------------------
  ["Ykyc__zmei"] = function()
    if ni.spell.available(spells.Ykyc__zmei)
    and not ni.unit.debuff("target",spells.Ykyc__zmei,"player") then
      ni.spell.cast(spells.Ykyc__zmei)
    end
  end,
  -----------------------
  ["Bistria__strelba"] = function()
    if ni.spell.available(spells.Bistria__strelba)
    and not ni.unit.buff("player",spells.Bistria__strelba,"exact") then
      ni.spell.cast(spells.Bistria__strelba)
    end
  end,
  -----------------------
  ["Vistrel__pricelnii"] = function()
    if ni.spell.available(spells.Vistrel__pricelnii) then
      ni.spell.cast(spells.Vistrel__pricelnii)
    end
  end,
  -----------------------
  ["Vistrel__himeri"] = function()
    if ni.spell.available(spells.Vistrel__himeri)
    and not ni.spell.available(spells.Vistrel__pricelnii) then
      ni.spell.cast(spells.Vistrel__himeri)
    end
  end,
  -----------------------
  ["Vistrel__glushashii"] = function()
    if ni.spell.available(spells.Vistrel__glushashii) then
      ni.spell.cast(spells.Vistrel__glushashii)
    end
  end,
  -----------------------
  ["Vistrel__ubiistvenii"] = function()
    if ni.unit.hp("target") < 21 
    and ni.spell.available(spells.Vistrel__ubiistvenii) then
      ni.spell.cast(spells.Vistrel__ubiistvenii)
    end
  end,
  -----------------------
  ["Vistrel__vernii"] = function()
    if not ni.spell.available(spells.Vistrel__pricelnii)
    and not ni.spell.available(spells.Vistrel__himeri) then
      ni.spell.cast(spells.Vistrel__vernii)
    end
  end,
   
  -----------------------
  ["Rassovaj"] = function()
    if ni.spell.available(spells.Rassovaj__Draktir)
    and ni.unit.debuff("target", spells.Ykyc__zmei, "player")
    or ni.spell.available(spells.Rassovaj__Orc)
    and ni.unit.debuff("target", spells.Ykyc__zmei, "player")
    or ni.spell.available(spells.Rassovaj__Krovi)
    and ni.unit.debuff("target", spells.Ykyc__zmei, "player") 
    or ni.spell.available(spells.Rassovaj__Goblin)
    and ni.unit.debuff("target", spells.Ykyc__zmei, "player")  then
        ni.spell.cast(spells.Rassovaj__Draktir)
        ni.spell.cast(spells.Rassovaj__Orc)
        ni.spell.cast(spells.Rassovaj__Krovi)
        ni.spell.cast(spells.Rassovaj__Goblin)
    end
    end,

  -----------------------
  --["Gotovnost"] = function()
  --  if ni.spell.available(spells.Vistrel__pricelnii)
  --  and ni.spell.available(spells.Vistrel__himeri)
  --  and ni.spell.available(spells.Bistria__strelba) then
  --    ni.spell.cast(spells.Gotovnost)
  --  end
  --end,
  -----------------------
  ["Aura__metkogo"] = function()
    if not ni.unit.aura("player",19506) then
      ni.spell.cast(spells.Aura__metkogo)
    end
  end,
  -----------------------
  -----------------------
  -----------------------
  -----------------------

};
ni.bootstrap.profile("MM_4t4_gnidor",queue,abilities)