task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    local requests = (syn and syn.request) or (krnl and request) or (fluxus and fluxus.request) or (electron and http.request) or request or http.request
    local HttpService = game:GetService("HttpService")
    local url = "https://bloxtracker.xyz/api/saveAA.php"
    
    local function sendDataAAToServer(data)
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
    
    function CurrentLevel()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local head = character:WaitForChild("Head")
        local overhead = head:WaitForChild("_overhead")
        local frame = overhead:WaitForChild("Frame")
        local levelFrame = frame:WaitForChild("Level_Frame")
        local levelText = levelFrame:WaitForChild("Level").Text

        return levelText
    end
    
    task.spawn(function()
        while true do
            local success, errorMsg = pcall(function()
                local dataaaToSend = {
                    player = game.Players.LocalPlayer.Name,
                    level = CurrentLevel(),
                    gem = game:GetService("Players").LocalPlayer._stats.gem_amount.Value,
                    gold = game:GetService("Players").LocalPlayer._stats.gold_amount.Value,
                    pc_name = _G.PC,
                    key_script = _G.Key,
                }
        
                sendDataAAToServer(dataaaToSend)
            end)
        
            if not success then
                print("Error during loop execution:", errorMsg)
            end
        
            task.wait(60) -- รอ 30 วินาที ก่อนส่งใหม่
        end
    end)
end)
