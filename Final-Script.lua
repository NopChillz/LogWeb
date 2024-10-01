repeat task.wait() until game:IsLoaded()
-- Setting Script
getgenv().SettingsLog = {
    Show_Item_SettingsLog = {
    Log_Godhuman = true,  -- true or false
    Log_SanguineArt = true,
    Log_Soul_Guitar = true,  -- true or false
    Log_Valkyrie_Helm = true,
    Log_Cursed_Dual_Katana = true,
    Log_Shark_Anchor = true,

    },
    Show_Material_SettingsLog = {
        Log_Mirror_Fractal = true,
    },
}

_G.PC = "TESTAA" -- PC NAME
_G.Key = "BloxTracker_zR5V9twKyfr8MriI1P2G" -- Key Script
loadstring(game:HttpGet("https://raw.githubusercontent.com/NopChillz/LogWeb/refs/heads/main/Script.lua"))()
