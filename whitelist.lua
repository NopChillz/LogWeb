_G.Key = "BloxTracker_S5NriEu39HQBezE8DrjU" 
_G.HWID = game:GetService("RbxAnalyticsService"):GetClientId()  -- แก้ไขให้ไม่ใช้ setclipboard

local requests = (syn and syn.request) or (krnl and request) or (fluxus and fluxus.request) or (electron and http.request) or request or http.request
local Server = requests({
    Url = "https://bloxtracker.xyz/api/whitelist.php?Key=" .. _G.Key .. "&HWID=" .. _G.HWID,  -- แก้ไขเป็น _G.HWID
    Method = "GET"
}).Body

if Server == "WHITELIST!" then
    print("SCRIPT")
elseif Server == "Invalid HWID!" then  -- แก้ไขการสะกด
    game.Players.LocalPlayer:kick("Invalid HWID")
elseif Server == "Invalid Key" then  -- แก้ไขการสะกด
    game.Players.LocalPlayer:kick("Invalid Key")
else
    game.Players.LocalPlayer:kick("Invalid Key")
end
