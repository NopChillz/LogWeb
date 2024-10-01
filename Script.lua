wait(30)
local requests = (syn and syn.request) or (krnl and request) or (fluxus and fluxus.request) or (electron and http.request) or request or http.request
local HttpService = game:GetService("HttpService")
local url = "https://bloxtracker.xyz/api/saveData.php"

function GetLogAllMeleeNew()
    combat = 0
    BuyDragonTalon = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true))
    if BuyDragonTalon then
        if BuyDragonTalon == 1 then
            combat += 1
        end
    end
    BuySuperhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman",true))
    if BuySuperhuman then
        if BuySuperhuman == 1 then
            combat += 1
        end
    end
    BuySharkmanKarate = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true))
    if BuySharkmanKarate then
        if BuySharkmanKarate == 1 then
            combat += 1
        end
    end
    BuyDeathStep = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true))
    if BuyDeathStep then
        if BuyDeathStep == 1 then
            combat += 1
        end
    end
    BuyElectricClaw = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true))
    if BuyElectricClaw then
        if BuyElectricClaw == 1 then
            combat += 1
        end
    end
    Log_Godhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true))
    if Log_Godhuman then
        if Log_Godhuman == 1 then
            combat += 1
        end
    end
    Log_SanguineArt = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt",true))
    if Log_SanguineArt then
        if Log_SanguineArt == 1 then
            combat += 1
        end
    end
    return combat
end

local function sendDataToServer(data)
    local jsonData = HttpService:JSONEncode(data)
    local response = requests({
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = jsonData
    })

    if response then
        print("Response status code:", response.StatusCode)
        print("Response body:", response.Body)
        print(jsonData)
    else
        print("Error: No response received")
    end
end

function getMeele()
    local MeleeName, RequestMeleeName = {}, nil;
    for i, v in pairs(MeleeRequestList) do 
        RequestMeleeName =  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(v, true)
        if tonumber(RequestMeleeName) == 1 then 
            table.insert(MeleeName, i)
        end
    end
    return MeleeName
end

function getWorld() 
    local placeId = game.PlaceId
    if placeId == 2753915549 then
        return 1
    elseif placeId == 4442272183 then
        return 2
    elseif placeId == 7449423635 then
        return 3
    end
end

function getItem(itemName) 
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if type(v) == "table" then
            if v.Type == "Material" then
                if v.Name == itemName then
                    return "✔️"
                end
            end
        end
    end
    return "❌"
end

function getVK()
	for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
            for i1,v1 in pairs(v) do
                if v1 == 'Valkyrie Helm' then
                    return "✔️"
                end
            end
        end
     if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Valkyrie Helm') or game:GetService("Players").LocalPlayer.Character:FindFirstChild('Valkyrie Helm') then
           return "✔️"
        end
    return "❌"
end

function getFruitName()
    return string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2] or "None"
end

local function GetLogNewAwake()
    AwakeText = ''
    pcall(function()
        for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                if v.ToolTip == "Blox Fruit" then
                    if v:FindFirstChild("AwakenedMoves") then
                        if v.AwakenedMoves:FindFirstChild("Z") then
                            AwakeZ = true
                        end
                        if v.AwakenedMoves:FindFirstChild("X") then
                            AwakeX = true
                        end
                        if v.AwakenedMoves:FindFirstChild("C") then
                            AwakeC = true
                        end
                        if v.AwakenedMoves:FindFirstChild("V") then
                            AwakeV = true
                        end
                        if v.AwakenedMoves:FindFirstChild("F") then
                            AwakeF = true
                        end
                        if v.AwakenedMoves:FindFirstChild("TAP") then
                            AwakeTAP = true
                        end
                        if v.Name == "Dough-Dough" then
                            if AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true and AwakeF == true and AwakeTAP == true then
                                AwakeText = "[Full Awaked] "..string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2].." ["..game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value.."]"
                            else
                                AwakeText = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2].." ["..game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value.."]"
                            end
                        else
                            if (AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true and AwakeF == true) or (AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true) then
                                AwakeText = "[Full Awaked] "..string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2].." ["..game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value.."]"
                            else
                                AwakeText = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2].." ["..game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value.."]"
                            end
                        end
                    else
                        AwakeText = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2].." ["..game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value.."]"
                    end
                elseif game:GetService("Players").LocalPlayer.Data.DevilFruit.Value == '' then
                    AwakeText = "None"
                end
            end
        end
        for i ,v in pairs(game:GetService("Workspace").Characters[game.Players.LocalPlayer.Name]:GetChildren()) do
            if v:IsA("Tool") then
                if v.ToolTip == "Blox Fruit" then
                    if v:FindFirstChild("AwakenedMoves") then
                        if v.AwakenedMoves:FindFirstChild("Z") then
                            AwakeZ = true
                        end
                        if v.AwakenedMoves:FindFirstChild("X") then
                            AwakeX = true
                        end
                        if v.AwakenedMoves:FindFirstChild("C") then
                            AwakeC = true
                        end
                        if v.AwakenedMoves:FindFirstChild("V") then
                            AwakeV = true
                        end
                        if v.AwakenedMoves:FindFirstChild("F") then
                            AwakeF = true
                        end
                        if v.AwakenedMoves:FindFirstChild("TAP") then
                            AwakeTAP = true
                        end
                        if v.Name == "Dough-Dough" then
                            if AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true and AwakeF == true and AwakeTAP == true then
                                AwakeText = "F "..string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2].." ["..game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value.."]"
                            else
                                AwakeText = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2].." ["..game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value.."]"
                            end
                        else
                            if (AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true and AwakeF == true) or (AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true) then
                                AwakeText = "F "..string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2].." ["..game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value.."]"
                            else
                                AwakeText = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2].." ["..game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value.."]"
                            end
                        end
                    else
                        AwakeText = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2].." ["..game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value.."]"
                    end
                end
            end
        end
    end)
    return AwakeText
end

function GetLogFruitInventory()
    local ReturnText = {}
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
        if type(v) == "table" then
            if v ~= nil then
                if v.Price >= 0 then
                    table.insert(ReturnText,string.split(v.Name,"-")[2])
                end
            end
        end
    end

    if #ReturnText ~= 0 then
        return table.concat(ReturnText,", ")
    else
        return "-"
    end
end

function CheckRaceV()
    ReturnText = ' [V1]'
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Awakening") or game.Players.LocalPlayer.Character:FindFirstChild("Awakening") then
        ReturnText = ' [V4]'
    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1") == -2 then
        ReturnText = ' [V3]'
    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3") == -2 then
        ReturnText = ' [2]'
    end
    return ReturnText
end

function CheckTier()
    local Tier = game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("C")
    if Tier then
        CheckTier_Text = "T" ..Tier.Value
    else
        CheckTier_Text = "-"
    end
    return CheckTier_Text
end

function AbbreviateNumber(number)
    local suffixes = {"", "K", "M", "B", "T"}
    local suffixIndex = 1

    while number >= 1000 and suffixIndex < #suffixes do
        number = number / 1000
        suffixIndex = suffixIndex + 1
    end

    -- เช็คว่าถ้าหลักทศนิยมของตัวเลขมากกว่า 0 ให้ใช้การจัดรูปแบบเพื่อแสดง 2 ตำแหน่งทศนิยม
    if number % 1 ~= 0 then
        return string.format("%.2f%s", number, suffixes[suffixIndex])
    else
        return number .. suffixes[suffixIndex]
    end
end



function CheckLogFragment()
    local FragmentValue = game:GetService("Players").LocalPlayer.Data.Fragments.Value
    FragmentValue = AbbreviateNumber(FragmentValue)
    return FragmentValue
end

function CheckLogBeli()
    local BeliValue = game:GetService("Players").LocalPlayer.Data.Beli.Value
    BeliValue = AbbreviateNumber(BeliValue)
    return BeliValue
end

function CheckLogBounty()
    local BountyValue = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value
    BountyValue = AbbreviateNumber(BountyValue)
    return BountyValue
end

function CheckPull_Lever_NopChillz()
    local args = {
        [1] = "CheckTempleDoor"
    }
    local Pull_Lever_NopChillz = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))	


    if Pull_Lever_NopChillz then
        print("✔")
        Pull_Lever_NopChillz_Text = '✔️'
    else
        print("❌")
        Pull_Lever_NopChillz_Text = '❌'
    end

    return Pull_Lever_NopChillz_Text
end

-- function GetLogGOD()
--     if getgenv().SettingsLog.Show_Item_SettingsLog["Log_Godhuman"] == true then
--         Log_Godhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true))
--         if Log_Godhuman then
--             if Log_Godhuman == 1 then
--                 CombatText = 'GOD'
--             end
--         end
--     else
--         CombatText = ''
--     end
--     return CombatText
-- end
-- New Melee
function GetMeleeType()
    local CombatText = '' -- กำหนดค่าเริ่มต้นให้กับ CombatText

    if getgenv().SettingsLog.Show_Item_SettingsLog["Log_Godhuman"] == true then
        local Log_Godhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true))
        if Log_Godhuman and Log_Godhuman == 1 then
            CombatText = 'GOD'
        end
    elseif getgenv().SettingsLog.Show_Item_SettingsLog["Log_SanguineArt"] == true then
        local Log_SanguineArt = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt",true))
        if Log_SanguineArt and Log_SanguineArt == 1 then
            CombatText = 'SGA'
        end
    end

    return CombatText -- ส่งค่า CombatText กลับ
end


function CheckLogMirrorFractalNew()
    if getgenv().SettingsLog.Show_Material_SettingsLog["Log_Mirror_Fractal"] == true then
        MirrorFac_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
            if type(v) == "table" then
                if v.Type == "Material" then
                    if v.Name == "Mirror Fractal" then
                        MirrorFac_Text = "+MIRROR"
                    end
                end
            end
        end
    else
        MirrorFac_Text = ''
    end
    return MirrorFac_Text
end

function CheckLogVK()
    if getgenv().SettingsLog.Show_Item_SettingsLog["Log_Valkyrie_Helm"] == true then
        VK_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
            for i1,v1 in pairs(v) do
                if v1 == 'Valkyrie Helm' then
                    VK_Text = '+ADMIN'
                end
            end
        end
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Valkyrie Helm') or game:GetService("Players").LocalPlayer.Character:FindFirstChild('Valkyrie Helm') then
            VK_Text = '+ADMIN'
        end
    else
        VK_Text = ''
    end
    return VK_Text
end

function CheckLogCDKNew()
    if getgenv().SettingsLog.Show_Item_SettingsLog["Log_Cursed_Dual_Katana"] == true then
        CDK_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
            for i1,v1 in pairs(v) do
                if v1 == 'Cursed Dual Katana' then
                    CDK_Text = '+CDK'
                end
            end
        end
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Cursed Dual Katana') or game:GetService("Players").LocalPlayer.Character:FindFirstChild('Cursed Dual Katana') then
            CDK_Text = '+CDK'
        end
    else
        CDK_Text = ''
    end
    return CDK_Text
end

function CheckLogSA()
    if getgenv().SettingsLog.Show_Item_SettingsLog["Log_Shark_Anchor"] == true then
        Log_SA_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
            for i1,v1 in pairs(v) do
                if v1 == 'Shark Anchor' then
                    Log_SA_Text = '+SA'
                end
            end
        end
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Shark Anchor') or game:GetService("Players").LocalPlayer.Character:FindFirstChild('Shark Anchor') then
            Log_SA_Text = '+SA'
        end
    else
        Log_SA_Text = ''
    end
    return Log_SA_Text
end

function CheckLogSGTNew()
    if getgenv().SettingsLog.Show_Item_SettingsLog["Log_Soul_Guitar"] == true then
        SGT_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
            for i1,v1 in pairs(v) do
                if v1 == 'Soul Guitar' then
                    SGT_Text = '+SG'
                end
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Soul Guitar') or game:GetService("Players").LocalPlayer.Character:FindFirstChild('Soul Guitar') then
                    SGT_Text = '+SG'
                end
            end
        end
    else
        SGT_Text = ''
    end
    return SGT_Text
end

function CheckLevelLog()
    RaceText = '-'
    if game:GetService("Players").LocalPlayer.Data.Level.Value < 2550 then
    else
        RaceText = 'Lv.MAX | '
    end
    return RaceText
end

function getSword()
    local swordNames = {}
    local RequestGetInventory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
    for i, v in pairs(RequestGetInventory) do 
        if v['Type'] == "Sword" and v['Rarity'] >= 3 then 
            table.insert(swordNames, v['Name'])
        end
    end
    return table.concat(swordNames, ", ") -- รวมข้อมูลในตารางด้วยเครื่องหมาย ', '
end 

local SwordName = getSword()

function getGun()
    local GunNames = {}
    local GunInventory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
    for i, v in pairs(GunInventory) do 
        if v['Type'] == "Gun" and v['Rarity'] >= 1 then 
            table.insert(GunNames, v['Name'])
        end
    end
    return table.concat(GunNames, ", ") -- รวมข้อมูลในตารางด้วยเครื่องหมาย ', '
end 

local GunName = getGun()

function DarkFragment()
    local darkFragmentCount = 0
    local inventory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
    
    for i, v in pairs(inventory) do
        if type(v) == "table" and v.Type == "Material" and v.Name == "Dark Fragment" then
            darkFragmentCount = darkFragmentCount + 1
        end
    end
    
    return darkFragmentCount
end

local DarkFragmentCount = DarkFragment()

while true do
	local dataToSend = {
	    player = game.Players.LocalPlayer.Name,
	    level = game.Players.LocalPlayer.Data.Level.Value,
	    money =  CheckLogBeli(),
	    world = getWorld(),
	    mirror = getItem("Mirror Fractal"),
	    valk = getVK(),
	    fruit_awaken = GetLogNewAwake(),
	    fruit_inventory = GetLogFruitInventory(),
	    race = game:GetService("Players").LocalPlayer.Data.Race.Value .. CheckRaceV(),
	    tier = CheckTier(),
	    melee = GetLogAllMeleeNew(),
	    fragment = CheckLogFragment(),
	    bounty = CheckLogBounty(),
	    lever = CheckPull_Lever_NopChillz(),
	    type = CheckLevelLog() .. GetMeleeType() .. CheckLogMirrorFractalNew() .. CheckLogVK() .. CheckLogCDKNew() .. CheckLogSA() .. CheckLogSGTNew(),
	    name = _G.PC,
	    sword = SwordName,
	    gun = GunName,
	    darkfragment = DarkFragmentCount,
	    key_script = _G.Key,
	}
	
	sendDataToServer(dataToSend)
wait(60) -- รอ 1 นาที
end
