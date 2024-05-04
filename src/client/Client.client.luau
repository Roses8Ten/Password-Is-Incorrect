local PLAYERS = game:GetService("Players")

local Ply = PLAYERS.LocalPlayer
local Gui = Ply.PlayerGui:WaitForChild("ScreenGui")

function SetUp()
    Gui.UserImage.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" .. Ply.Name
    Gui.Username.Text = Ply.Name
end

SetUp()