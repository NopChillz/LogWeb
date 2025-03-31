task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    wait(15)
    local requests = (syn and syn.request) or (krnl and request) or (fluxus and fluxus.request) or (electron and http.request) or request or http.request
    local HttpService = game:GetService("HttpService")
    local url = "https://bloxtracker.xyz/api/saveAS.php"
    
    local function sendDataCosToServer(data)
        local jsonData = HttpService:JSONEncode(data)
        local success, response = pcall(function()
            return requests({
                Url = url,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = jsonData
            })
        end)
    
        if success and response and response.StatusCode == 200 then
            print("Response status code:", response.StatusCode)
            print("Response body:", response.Body)
            print(jsonData)
        else
            print("Error: No response received or status code:", response and response.StatusCode or "nil")
        end
    end

    local function countPetsByName(targetName)
        local player = game:GetService("Players").LocalPlayer
        local leaderstats = player:FindFirstChild("leaderstats")
    
        if leaderstats then
            local inventory = leaderstats:FindFirstChild("Inventory")
            local pets = inventory and inventory:FindFirstChild("Pets")
    
            if pets then
                local count = 0
    
                for _, pet in pairs(pets:GetChildren()) do
                    local petName = pet:GetAttribute("Name")
                    if petName == targetName then
                        count = count + 1
                    end
                end
    
                return count
            end
        end
    
        return 0 -- ถ้าไม่มี Pets หรือไม่มี Inventory, คืนค่า 0
    end
    
    -- ใช้งานฟังก์ชันเพื่อนับจำนวนสัตว์เลี้ยงที่ชื่อ "Beru"
    local beruCount = countPetsByName("Beru")
    print("Have 'Beru' Total : " .. beruCount)
    
    task.spawn(function()
        while true do
            local success, errorMsg = pcall(function()
                local dataCosToSend = {
                    player = game.Players.LocalPlayer.Name,
                    beru = beruCount,
                    gem = game:GetService("Players").LocalPlayer.PlayerGui.Hud.BottomContainer.Gems.Text,
                    coin = game:GetService("Players").LocalPlayer.PlayerGui.Hud.BottomContainer.Coins.Text,
                    pc_name = _G.PC,
                    key_script = _G.Key,
                }
        
                sendDataCosToServer(dataCosToSend)
            end)
        
            if not success then
                print("Error during loop execution:", errorMsg)
            end
        
            task.wait(60) -- รอ 30 วินาที ก่อนส่งใหม่
        end
    end)
end)

