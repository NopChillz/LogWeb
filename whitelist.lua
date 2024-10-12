_G.Key = "BloxTracker_zR5V9twKyfr8MriI1P2G" 
_G.HWID = game:GetService("RbxAnalyticsService"):GetClientId()

local requests = (syn and syn.request) or (krnl and request) or (fluxus and fluxus.request) or (electron and http.request) or request or http.request
local Server = requests({
    Url = "https://bloxtracker.xyz/api/whitelist.php?Key=" .. _G.Key .. "&HWID=" .. _G.HWID,
    Method = "GET"
}).Body

if Server == "WHITELIST!" then
    print("SCRIPT")
elseif Server == "Invalid HWID!" then
    game.Players.LocalPlayer:kick("Invalid HWID")
elseif Server == "Invalid Key" then
    game.Players.LocalPlayer:kick("Invalid Key")
else
    game.Players.LocalPlayer:kick("Invalid Key")
end
