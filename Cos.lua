wait(15)
local requests = (syn and syn.request) or (krnl and request) or (fluxus and fluxus.request) or (electron and http.request) or request or http.request
local HttpService = game:GetService("HttpService")
local url = "https://bloxtracker.xyz/api/saveCos.php"

local function sendDataCosToServer(data)
    local jsonData = HttpService:JSONEncode(data)
    local response = requests({
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = jsonData
    })

    if response and response.StatusCode == 200 then
        print("Response status code:", response.StatusCode)
        print("Response body:", response.Body)
        print(jsonData)
    else
        print("Error: No response received or status code:", response and response.StatusCode or "nil")
    end
end

while true do
    local dataCosToSend = {
        player = game.Players.LocalPlayer.Name,
        mushroom = game:GetService("Players").LocalPlayer.PlayerGui.Data.Coins.Value,
        pc_name = _G.PC,
    }

    sendDataCosToServer(dataCosToSend)
    
    wait(60) -- รอ 1 นาที
end
