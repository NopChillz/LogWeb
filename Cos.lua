wait(10)
local requests = (syn and syn.request) or (krnl and request) or (fluxus and fluxus.request) or (electron and http.request) or request or http.request
local HttpService = game:GetService("HttpService")
local url = "https://bloxtracker.xyz/api/saveCos.php"

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

task.spawn(function()
    while true do
        local success, errorMsg = pcall(function()
            local dataCosToSend = {
                player = game.Players.LocalPlayer.Name,
                mushroom = game:GetService("Players").LocalPlayer.PlayerGui.Data.Coins.Value,
                pc_name = _G.PC,
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
