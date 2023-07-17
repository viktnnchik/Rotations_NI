local cache = {
    Info = true,
    Player__Combat = false,
}
local spells = {
    Smertelnii__ydar = GetSpellInfo(47486),
    Prevoshodstvo = GetSpellInfo(7384),
    Krovopuskanie = GetSpellInfo(47465),
    Yarost__krovavaj = GetSpellInfo(2687),
    Yarost__berserka = GetSpellInfo(18499),
    Vihr__klinkov = GetSpellInfo(46924),
    Ydar__geroia = GetSpellInfo(47450),
    Charge = GetSpellInfo(11578),
    Rassekaushii = GetSpellInfo(47520),
    Ydar__groma = GetSpellInfo(47502),
    Moshnii__ydar = GetSpellInfo(47475),
    --------------------
    Rassovaj__Draktir = GetSpellInfo(320554),
    Rassovaj__Orc = GetSpellInfo(316373),
    Rassovaj__Krovi = GetSpellInfo(316422),
    Rassovaj__Goblin = GetSpellInfo(316396),
    --------------------
    Krik = GetSpellInfo(6673),

}
local queue = {
    "Info",
    --"Pause",
    "Stoika",
    "Charge",
    --"Auto__target",
    "Raga",
    --"Krik",
    "Krovopuskanie",
    "Rassovaj",
    --"Ydar__groma",
    "Vihr__klinkov",
    "Smertelnii__ydar",
    "Prevoshodstvo",
    "Ydar__geroia__Rassek",
    "Moshnii__ydar",
    
};

local abilities = {
    -----------------------
    ["Info"] = function()
        if cache.Info == true then
            cache.Info = false
            print("                                         |cFFFF0000  =========================|r\
                                        |cFFFFFFFFАрмс Вар|r\
                                        |cFFFF5A00Профиль для прокачки by gn1dor43|r\
                                        |cFFFF0000=========================|r")
        end  
    end,
    -----------------------
    ["Stoika"] = function()
      if not ni.unit.aura("player",2457) then
        ni.spell.cast(2457)
      end
    end,
    -----------------------
    ---["Pause"] = function()
    ---    if IsMounted()
	---	or UnitInVehicle("player")
	---	or UnitIsDeadOrGhost("player")
	---	or UnitChannelInfo("player")
	---	or UnitCastingInfo("player")
	---	or ni.player.islooting() then
	---		return true;
	---	end
    ---end,
    --------------------------
    ---["Auto__target"] = function()
    ---    local target_ = ni.objects["target"];
    ---    local target__ = target_.guid
    ---    if enables["target"]
    ---    and cache.Player__Combat then
    ---        if target__ == 0 then
    ---            ni.player.runtext("/startattack")
    ---        end
    ---    end
    ---end,
    -----------------------
    ["Raga"] = function()
        if ni.spell.available(spells.Yarost__berserka)
        or ni.spell.available(spells.Yarost__krovavaj)
        and ni.power.current("player") < 100 then
            ni.spell.cast(spells.Yarost__berserka)
            ni.spell.cast(spells.Yarost__krovavaj)
        end
    end,
    -----------------------
    ["Charge"] = function()
        if ni.spell.available(spells.Charge) then
            ni.spell.cast(spells.Charge)
        end
    end,
    -----------------------
    ["Krovopuskanie"] = function()
        if not ni.unit.debuff("target", spells.Krovopuskanie, "player")
        and ni.power.current("player") > 9 then
            ni.spell.cast(spells.Krovopuskanie)
        end
    end,
    -----------------------
    ["Vihr__klinkov"] = function()
        if ni.spell.available(spells.Vihr__klinkov)
        and ni.unit.debuff("target", spells.Krovopuskanie, "player")
        and ni.power.current("player") > 24 then
            ni.spell.cast(spells.Vihr__klinkov)
        end
    end,
    -----------------------
    ["Smertelnii__ydar"] = function()
        if ni.spell.valid("target", spells.Smertelnii__ydar, false, true, true)
        and ni.spell.available(spells.Smertelnii__ydar) then
            ni.spell.cast(spells.Smertelnii__ydar)
        end
    end,
    -----------------------
    ["Prevoshodstvo"] = function()
        if ni.unit.buff("player",60503,"exact")
        or ni.unit.buff("player",304676,"exact")
        and ni.spell.available(spells.Prevoshodstvo) then
            ni.spell.cast(spells.Prevoshodstvo)
        end
    end,
    -----------------------
    ["Ydar__geroia__Rassek"] = function()
        if ni.power.current("player") > 70 
        and ni.spell.available(spells.Ydar__geroia)  then
            ni.spell.cast(spells.Ydar__geroia)
        end
    end,
    -----------------------
    --["Ydar__groma"] = function()
    --    if ni.power.current("player") > 19
    --    and ni.spell.available(spells.Ydar__groma)
    --    and #enemies > 1 then
    --        ni.spell.cast(spells.Ydar__groma)
    --    end
    --end,
    -----------------------
    ["Moshnii__ydar"] = function()
        if ni.power.current("player") > 14
        and not ni.spell.available(spells.Smertelnii__ydar)
        and not ni.unit.buff("player",60503,"exact") then
            ni.spell.cast(spells.Moshnii__ydar)
        end
    end,
    -----------------------
    ["Rassovaj"] = function()
        if ni.spell.available(spells.Rassovaj__Draktir)
        and ni.unit.debuff("target", spells.Krovopuskanie, "player")
        or ni.spell.available(spells.Rassovaj__Orc)
        and ni.unit.debuff("target", spells.Krovopuskanie, "player") 
        or ni.spell.available(spells.Rassovaj__Krovi)
        and ni.unit.debuff("target", spells.Krovopuskanie, "player")  then
            ni.spell.cast(spells.Rassovaj__Draktir)
            ni.spell.cast(spells.Rassovaj__Orc)
            ni.spell.cast(spells.Rassovaj__Krovi)
        end
    end,
    -----------------------
    --["Krik"] = function()
    --    if not ni.player.buff(47440)
    --    and ni.spell.available(47440) then
    --        ni.cast.spell(47440)
    --    end
    --end,
    -----------------------



};

ni.bootstrap.profile("arms_gnidor_leveling", queue, abilities)
