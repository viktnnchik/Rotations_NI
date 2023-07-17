
local cache = {
  combo = 0,
  info = true,
}
local spells = {

    char_rass = GetSpellInfo(316432),
    skval = GetSpellInfo(13877),
    inviz = GetSpellInfo(1784),
    ukol = GetSpellInfo(5938),
    zazda = GetSpellInfo(51662),
    rasprava = GetSpellInfo(48666),
    otrav = GetSpellInfo(57993),
    myaso = GetSpellInfo(6774),
    adrenaline = GetSpellInfo(13750),
    veer = GetSpellInfo(51723),
    kosh = GetSpellInfo(31224),
    trix = GetSpellInfo(57934),
    kick = GetSpellInfo(1766),
    hlad = GetSpellInfo(14177),
    vanish = GetSpellInfo(26889),
    rana = GetSpellInfo(48672),
    garota = GetSpellInfo(48676),

}
local queue ={
    "info",
    "cache",
    "pause",
    --"auto-target",
    --"kosh",
    --"kick",
    "yad",
    --"napul",
    --"cd",
    --"inviz",
    --"rasprava_o",
    "myaso",
    "zazda",
    "garota",
    "rana",
    "char_rass",
    --"veer",
    "rasprava",
    "otrav_",
    "otrav",
    "vanish",

}
local abilities = {
    -----------------------------------
    ["info"] = function()
        if cache.info == true
        and not ni.vars.coin then
            cache.info = false
            print("|cFFFF0000  =========================|r\
|cFFFFFFFFМути Рога|r\
|cFFFF5A00Приватный профиль by gn1dor43|r\
|cFFFF0000=========================|r")
        end
    end,
    ------------------------
    ["cache"] = function()
        cache.combo = GetComboPoints("player", "target");
        if ni.unit.debuffremaining("target", "Глубокая рана") > 1 then
            cache.krov = true
        elseif ni.unit.debuffremaining("target", "Кровотечение") > 1 then
            cache.krov = true
        elseif ni.unit.debuffremaining("target", spells.garota) > 1 then
            cache.krov = true
        elseif ni.unit.debuffremaining("target", spells.rana) > 1 then
            cache.krov = true
        else cache.krov = false
        end
    end,
    ------------------------
    ["yad"] = function()
        local hasMainHandEnchant, mainHandExpiration,mainHandCharges, mainHandEnchantID, hasOffHandEnchant,offHandExpiration, offHandCharges, offHandEnchantID =GetWeaponEnchantInfo()
        if hasMainHandEnchant ~= 1
        and ni.player.hasitem(43233)
        and ni.spell.lastcast(43233, 2)
        and ni.spell.lastcast(43231, 2) then
            ni.player.useitem(43233)
            ni.player.runtext("/use 16")
        end
        if mainHandEnchantID ~= 1
        and ni.spell.lastcast(43231, 2)
        and ni.spell.lastcast(43233, 2)
        and ni.player.hasitem(43231) then
            ni.player.useitem(43231)
            ni.player.runtext("/use 17")
        end   
    end,
    ------------------------
    ["pause"] = function()
        if IsMounted()
		or UnitInVehicle("player")
		or UnitIsDeadOrGhost("player")
		or UnitChannelInfo("player")
		or UnitCastingInfo("player")
		or ni.player.islooting() then
			return true;
		end
    end,
    
    ------------------------
    ["myaso"] = function()
        if cache.combo >= 1
        and ni.unit.buffremaining("player", spells.myaso) < 2
        and ni.spell.available(spells.myaso) then
            ni.spell.cast(spells.myaso)
        end
    end,
    ------------------------
    ["zazda"] = function()
        if not ni.player.buff(spells.zazda)
        and ni.spell.available(spells.zazda) then
            ni.spell.cast(spells.zazda)
        end
    end,
    ------------------------
    ["garota"] = function()
        if cache.krov == false
        and ni.unit.buffremaining("player", spells.zazda) < 3
        and ni.spell.available(spells.garota)
        and ni.spell.valid("target", spells.garota, false, true, true) then
            ni.spell.cast(spells.garota)
        end
    end,
    ------------------------
    ["rana"] = function()
        if cache.krov == false
        and ni.unit.buffremaining("player", spells.zazda) < 3
        and ni.spell.available(spells.rana)
        and ni.spell.valid("target", spells.rana, false, true, true) then
            ni.spell.cast(spells.rana)
        end
    end,
    ------------------------
    ["char_rass"] = function()
        if not cache.control
        and ni.spell.available(spells.char_rass) then
            ni.spell.cast(spells.char_rass)
          end
    end,
    ------------------------
    ["rasprava"] = function()
        if ni.spell.available(spells.rasprava)
        and ni.spell.valid("target", spells.rasprava, false, true, true) then
            ni.spell.cast(spells.rasprava)
        end
    end,
    ------------------------
    ["otrav_"] = function()
        if cache.combo > 4
        and ni.spell.available(spells.otrav)
        and ni.spell.valid("target", spells.otrav, false, true, true) then
            if ni.spell.available(spells.hlad) then
                ni.spell.cast(spells.hlad)
            else
                ni.spell.cast(spells.otrav)
            end
        end
    end,
    ------------------------
    ["otrav"] = function()
        if not ni.spell.available(spells.hlad)
        and cache.combo > 3
        and ni.spell.available(spells.otrav)
        and ni.spell.valid("target", spells.otrav, false, true, true) then
            ni.spell.cast(spells.otrav)
        end
    end,
    ------------------------
    ["vanish"] = function()
        if ni.spell.available(spells.vanish)
        and not ni.player.buff(58427)
        and not ni.spell.gcd() then
            ni.spell.cast(spells.vanish)
        end
    end,
    ------------------------
    

}
ni.bootstrap.profile("Muty_rog_gn1dor43",queue,abilities);