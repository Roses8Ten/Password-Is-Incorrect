local PLAYERS = game:GetService("Players")
local REPLICATEDFIRST = game:GetService("ReplicatedFirst")
local TWEENSERVICE = game:GetService("TweenService")
local SOUNDSERVICE = game:GetService("SoundService")

local Ply = PLAYERS.LocalPlayer
local PlyGuis = Ply.PlayerGui
local Gui = script:WaitForChild("LoadingScreen"):Clone()

REPLICATEDFIRST:RemoveDefaultLoadingScreen()

function LoadGame()
    Gui.Enabled = true
    Gui.Parent = PlyGuis
    repeat task.wait() until game:IsLoaded()
    local LoadingBar_Tween = TWEENSERVICE:Create(Gui.LoadingBar, TweenInfo.new(10, Enum.EasingStyle.Linear), {Size = UDim2.fromScale(1, Gui.LoadingBar.Size.Y.Scale)})
    LoadingBar_Tween:Play()
    LoadingBar_Tween.Completed:Connect(function()
        TWEENSERVICE:Create(Gui.LoadingBar, TweenInfo.new(1, Enum.EasingStyle.Linear), {Transparency = 1}):Play()
        PlyGuis.ScreenGui.Enabled = true
    end)
end

if Ply.Character then
    LoadGame()
end

Ply.CharacterAdded:Connect(LoadGame)