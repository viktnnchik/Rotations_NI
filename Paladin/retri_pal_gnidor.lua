local cache = {
    Info = true,
    Player__Combat = false,
}

local spells = {
  Pechat__povinovenia = GetSpellInfo(20375),
  Pravosudie__mudrosti = GetSpellInfo(53408),
  Bozhestv__buria = GetSpellInfo(53385),
  Ydar__voina = GetSpellInfo(35395),
  Osviashenie = GetSpellInfo(48819),
  Ekzorzicm = GetSpellInfo(48801),
  Aura__vozdainia = GetSpellInfo(54043),
  --------------------
  Rassovaj__Draktir = GetSpellInfo(320554),
  Rassovaj__Orc = GetSpellInfo(316373),
  Rassovaj__Krovi = GetSpellInfo(316422),
  Rassovaj__Goblin = GetSpellInfo(316396),
  --------------------
  Gnev__caratelia = GetSpellInfo(31884),

}

local queue = {
  "Info",
  "Aura__vozdainia",
  "Pechat__povinovenia",
  "Pravosudie__mudrosti",
  "Rassovaj",
  "Gnev__caratelia",
  "Ekzorzicm",
  "Bozhestv__buria1",
  "Osviashenie",
  "Ydar__voina",
  "",
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
          print("                                         |cFFFF0000 =========================|r\
                                      |cFFFFFFFFРетри пал|r\
                                      |cFFFF5A00Профиль by gn1dor43|r\
                                      |cFFFF0000=========================|r")
      end  
  end,
  -----------------------
  ["Aura__vozdainia"] = function()
    if not ni.unit.aura("player",54043) then
      ni.spell.cast(spells.Aura__vozdainia)
    end
  end,
  -----------------------
  ["Pechat__povinovenia"] = function()
    if not ni.unit.buff("player",20375,"exact") then
      ni.spell.cast(spells.Pechat__povinovenia)
    end
  end,
  -----------------------
  ["Pravosudie__mudrosti"] = function()
    if ni.spell.available(spells.Pravosudie__mudrosti)
    and not ni.unit.debuff("target", spells.Pravosudie__mudrosti, "player")
    or ni.spell.available(spells.Pravosudie__mudrosti)
    and ni.power.current("player") < 2000
    or ni.spell.available(spells.Pravosudie__mudrosti)
    and not ni.spell.available(spells.Bozhestv__buria)
    and not ni.spell.available(spells.Ekzorzicm)
    and not ni.spell.available(spells.Osviashenie)
    and not ni.spell.available(spells.Ydar__voina) then
      ni.spell.cast(spells.Pravosudie__mudrosti)
    end
  end,
  -----------------------
  ["Ekzorzicm"] = function()
    if ni.unit.buff("player",59578,"exact")
    and ni.spell.available(spells.Ekzorzicm) then
      ni.spell.cast(spells.Ekzorzicm)
    end
  end,
  -----------------------
  ["Osviashenie"] = function()
    if ni.spell.available(spells.Osviashenie) then
      ni.spell.cast(spells.Osviashenie)
    end
  end,
  -----------------------
  ["Ydar__voina"] = function()
    if ni.spell.available(spells.Ydar__voina) then
      ni.spell.cast(spells.Ydar__voina)
    end
  end,
  -----------------------
  ["Rassovaj"] = function()
    if ni.spell.available(spells.Rassovaj__Draktir)
    and ni.unit.debuff("target", spells.Pravosudie__mudrosti, "player")
    or ni.spell.available(spells.Rassovaj__Orc)
    and ni.unit.debuff("target", spells.Pravosudie__mudrosti, "player") 
    or ni.spell.available(spells.Rassovaj__Krovi)
    and ni.unit.debuff("target", spells.Pravosudie__mudrosti, "player")  then
        ni.spell.cast(spells.Rassovaj__Draktir)
        ni.spell.cast(spells.Rassovaj__Orc)
        ni.spell.cast(spells.Rassovaj__Krovi)
    end
    end,
  -----------------------
  ["Bozhestv__buria1"] = function()
    if ni.spell.available(spells.Bozhestv__buria) then
      ni.spell.cast(spells.Bozhestv__buria)
    end
  end,
  -----------------------
  ["Gnev__caratelia"] = function()
    if ni.spell.available(spells.Gnev__caratelia)
    and ni.unit.debuff("target", spells.Pravosudie__mudrosti, "player") then
      ni.spell.cast(spells.Gnev__caratelia)
    end
  end,
  -----------------------

};

ni.bootstrap.profile("retri_pal_gnidor",queue,abilities)

