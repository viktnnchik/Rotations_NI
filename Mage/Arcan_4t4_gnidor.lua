local cache = {
  Info = true,
  stopcast = false,
  cc = true,
}

local spells = {
    --------------------
    Rassovaj__Draktir = GetSpellInfo(320554),
    Rassovaj__Orc = GetSpellInfo(316373),
    Rassovaj__Krovi = GetSpellInfo(316422),
    Rassovaj__Goblin = GetSpellInfo(316396),
    Rassovaj__Troll = GetSpellInfo(316407),
    --------------------
    Charodeinaj__vspishka = GetSpellInfo(42897),
    Charodeinei__streli = GetSpellInfo(42846),
    Velichie__razuma = GetSpellInfo(12043),
    Mosh__tainoi = GetSpellInfo(12042),
    Stilai__krov = GetSpellInfo(12472),
    Dospeh = GetSpellInfo(43036),
    Buff = GetSpellInfo(43002),
    Priliv__sil = GetSpellInfo(12051),
    Sotvorenie__samocveta = GetSpellInfo(42985),
}
local queue = {
  "Info",
  "Info",
  "Buff",
  "Dospeh",
  "Sotvorenie__samocveta",
  "Use__samocvet",
  "Priliv__sil",
  "Velichie__razuma",
  "Rassovaj",
  "Stilai__krov",
  "Mosh__tainoi",
  "Charodeinaj__vspishka",
  "Charodeinei__streli",
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
            print("                                         |cFFFF0000  =========================|r\
                                        |cFFFFFFFFАркан маг 4т4|r\
                                        |cFFFF5A00Профильby gn1dor43|r\
                                        |cFFFF0000=========================|r")
        end  
  end,
  -----------------------
  ---["Buff"] = function()
  ---  if ni.spell.available(spells.Buff)
  ---  and not ni.unit.buff("player",spells.Buff,"exact")
  ---  or ni.spell.available(42995)
  ---  and not ni.unit.buff("player",42995,"exact") then
  ---    ni.spell.cast(spells.Buff) else
  ---      ni.spell.cast(42995)
  ---    end
  ---  end
  ---end,
  -----------------------
  ["Dospeh"] = function()
    if ni.spell.available(spells.Dospeh)
    and not ni.unit.buff("player",spells.Dospeh,"exact") then
      ni.spell.cast(spells.Dospeh)
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
  ["Velichie__razuma"] = function()
    if ni.spell.available(spells.Velichie__razuma) then
      ni.spell.cast(spells.Velichie__razuma)
    end
  end,
  -----------------------
  ["Mosh__tainoi"] = function()
    if ni.spell.available(spells.Mosh__tainoi) then
      ni.spell.cast(spells.Mosh__tainoi)
    end
  end,
  -----------------------
  ["Stilai__krov"] = function()
    if ni.spell.available(spells.Stilai__krov)
    and not ni.unit.buff("player",spells.Velichie__razuma,"exact") then
      ni.spell.cast(spells.Stilai__krov)
    end
  end,
  -----------------------
  --["Priliv__sil"] = function()
  --  if ni.power.current("player") < 40
  --  and not cache.stopcast then
  --          ni.spell.cast(spells.Priliv__sil)
  --      end
  --  end,
  -----------------------
  ["Sotvorenie__samocveta"] = function()
    if not ni.player.hasitem(33312) then
      ni.spell.cast(spells.Sotvorenie__samocveta)
    end
  end,
  -----------------------
  ["Use__samocvet"] = function()
    if ni.player.hasitem(33312)
    and ni.player.itemcd(33312) < 1
    and ni.power.current("player") < 80 then
      ni.player.useitem(33312)
    end
  end,
  -----------------------
  ["Charodeinaj__vspishka"] = function()
    if not cache.stopcast
    and not ni.unit.iscasting("player")
    and ni.spell.available(spells.Charodeinaj__vspishka)
    and ni.spell.valid("target", spells.Charodeinaj__vspishka, false, true, true) then
          if ni.unit.debuffstacks("player", 36032) < 4 then
              ni.spell.cast(spells.Charodeinaj__vspishka)
          end
          if ni.player.buff(12536)
          and ni.unit.debuffstacks("player", 36032) == 4
          and cache.cc == true then
              ni.spell.cast(spells.Charodeinaj__vspishka)
              cache.cc = false
          end
          if not ni.player.buff(44401)
          and ni.unit.debuffstacks("player", 36032) == 4
          and cache.cc == true then
              ni.spell.cast(spells.Charodeinaj__vspishka)
              cache.cc = false
          end
      end
  end,
  -----------------------
  ["Charodeinei__streli"] = function()
    if ni.spell.available(spells.Charodeinei__streli)
    and ni.spell.valid("target", spells.Charodeinei__streli, false, true, true)
    and not cache.stopcast then
      ni.spell.cast(spells.Charodeinei__streli)
    end
  end,
  -----------------------
  ["Rassovaj"] = function()
    if ni.spell.available(spells.Rassovaj__Draktir)
    and not ni.unit.buff("player",spells.Velichie__razuma,"exact")
    or ni.spell.available(spells.Rassovaj__Orc)
    and not ni.unit.buff("player",spells.Velichie__razuma,"exact")
    or ni.spell.available(spells.Rassovaj__Krovi)
    and not ni.unit.buff("player",spells.Velichie__razuma,"exact")
    or ni.spell.available(spells.Rassovaj__Goblin)
    and not ni.unit.buff("player",spells.Velichie__razuma,"exact")
    or ni.spell.available(spells.Rassovaj__Troll)
    and not ni.unit.buff("player",spells.Velichie__razuma,"exact") then
      ni.spell.cast(spells.Rassovaj__Draktir)
      ni.spell.cast(spells.Rassovaj__Orc)
      ni.spell.cast(spells.Rassovaj__Krovi)
      ni.spell.cast(spells.Rassovaj__Goblin)
      ni.spell.cast(spells.Rassovaj__Troll)
    end
  end,

};
ni.bootstrap.profile("Arcan_4t4_gnidor",queue,abilities)
