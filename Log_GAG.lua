task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    wait(10)
    local requests = (syn and syn.request) or (krnl and request) or (fluxus and fluxus.request) or (electron and http.request) or request or http.request
    local HttpService = game:GetService("HttpService")
    local url = "https://bloxtracker.xyz/api/saveGAG.php"
    
    local function sendDataGAGToServer(data)
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

    function CheckLogCash()
        local CashValue = game:GetService("Players").LocalPlayer.leaderstats.Sheckles.Value
        CashValue = AbbreviateNumber(CashValue)
        return CashValue
    end

    function getBackpackItemList()
        local player = game:GetService("Players").LocalPlayer
        if not player then return "" end

        local backpack = player:FindFirstChild("Backpack")
        if not backpack then return "" end
        
        local itemNames = {}
        for _, item in ipairs(backpack:GetChildren()) do
            table.insert(itemNames, item.Name)
        end
        
        if #itemNames == 0 then
            return ""
        end

        return table.concat(itemNames, " , ")
    end
    
    task.spawn(function()
        while true do
            local success, errorMsg = pcall(function()
                local dataGAGToSend = {
                    player = game.Players.LocalPlayer.Name,
                    cash = CheckLogCash(),
                    inv = getBackpackItemList(),
                    pc_name = _G.PC,
                    key_script = _G.Key,
                }
        
                sendDataGAGToServer(dataGAGToSend)
            end)
        
            if not success then
                print("Error during loop execution:", errorMsg)
            end
        
            task.wait(60) 
        end
    end)
end)
