do
local mt = getrawmetatable(game);
local oldnidx = mt.__newindex;
setreadonly(mt, false);
mt.__newindex = newcclosure(function(self, k, v)
    if (k == 'Text' and string.find(v, "Snowy Hub") ) then
            v = "Snowy Skid Hub"
        end;
        return oldnidx(self, k, v)
    end);
    setreadonly(mt, true)
end;

if not game:IsLoaded() then
game.Loaded:Wait()
end
for i, v in pairs(game.CoreGui:GetChildren()) do
	if v.Name == "Snowy Hub" then
		v:Destroy()
	end
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local Library = library.new("Snowy Hub")
game:service("Players").LocalPlayer.Idled:connect(function()
	warn("anti-afk")
	va:CaptureController()
	va:ClickButton2(Vector2.new())
end)

game:GetService("RunService").RenderStepped:connect(function()
	game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.SideMenu.Tutorial.TextLabel.Text = "Snowy Hub"
	game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.SideMenu.Stats.TextLabel.Text = "Stats"
	game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.SideMenu.Skills.TextLabel.Text = "Abilities"
	game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.SideMenu.Shop.TextLabel.Text = "Shop"
	game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.SideMenu.Character.TextLabel.Text = "Char"
	game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Shop.KiAttacks.TextLabel.Text = "Ki Moves"
	game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Shop.Melee.TextLabel.Text = "Melee Moves"
	game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Shop.Transform.TextLabel.Text = "Transformations"
	game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.Labvel.TextLabel.Text = "STATS"
end)
local MainPage = Library:addPage("Main", 5012544693)
local Main = MainPage:addSection("Main")
Main:addSlider("Tele Speed", 1, 100, 14500, function(telespeed)
	_G.TeleSpeed_Bind = "Q"
	down = false
	velocity = Instance.new("BodyVelocity")
	velocity.maxForce = Vector3.new(10000000, 0, 10000000)
	local speed = telespeed
	gyro = Instance.new("BodyGyro")
	gyro.maxTorque = Vector3.new(10000000, 0, 10000000)
	local hum = game.Players.LocalPlayer.Character.Humanoid
	function onButton1Down(mouse)
		down = true
		velocity.Parent = game.Players.LocalPlayer.Character.UpperTorso
		velocity.velocity = (hum.MoveDirection) * speed
		gyro.Parent = game.Players.LocalPlayer.Character.UpperTorso
		while down do
			if not down then
				break
			end
			velocity.velocity = (hum.MoveDirection) * speed
			local refpos = gyro.Parent.Position + (gyro.Parent.Position - workspace.CurrentCamera.CoordinateFrame.p).unit * 5
			gyro.cframe = CFrame.new(gyro.Parent.Position, Vector3.new(refpos.x, gyro.Parent.Position.y, refpos.z))
			wait(0.1)
		end
	end
	function onButton1Up(mouse)
		velocity.Parent = nil
		gyro.Parent = nil
		down = false
	end
	function onSelected(mouse)
		mouse.KeyDown:connect(function(k)
			if k:upper() == _G.TeleSpeed_Bind then
				onButton1Down(mouse)
			end
		end)
		mouse.KeyUp:connect(function(k)
			if k:upper() == _G.TeleSpeed_Bind then
				onButton1Up(mouse)
			end
		end)
	end
	onSelected(game.Players.LocalPlayer:GetMouse())
end)
Main:addToggle("No Slow", nil, function(noslow)
	if noslow == true then
		Slow = game:GetService("RunService").Stepped:Connect(function()
			if game.Players.LocalPlayer.Character:FindFirstChild("Action") then
				game.Players.LocalPlayer.Character:FindFirstChild("Action"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("Attacking") then
				game.Players.LocalPlayer.Character:FindFirstChild("Attacking"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("Activity") then
				game.Players.LocalPlayer.Character:FindFirstChild("Activity"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("Using") then
				game.Players.LocalPlayer.Character:FindFirstChild("Using"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("hyper") then
				game.Players.LocalPlayer.Character:FindFirstChild("hyper"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("Hyper") then
				game.Players.LocalPlayer.Character:FindFirstChild("Hyper"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("heavy") then
				game.Players.LocalPlayer.Character:FindFirstChild("heavy"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("KiBlasted") then
				game.Players.LocalPlayer.Character:FindFirstChild("KiBlasted"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("Tele") then
				game.Players.LocalPlayer.Character:FindFirstChild("Tele"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("tele") then
				game.Players.LocalPlayer.Character:FindFirstChild("tele"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("Killed") then
				game.Players.LocalPlayer.Character:FindFirstChild("Killed"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("Slow") then
				game.Players.LocalPlayer.Character:FindFirstChild("Slow"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("Blocked") then
				game.Players.LocalPlayer.Character:FindFirstChild("Blocked"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("MoveStart") then
				game.Players.LocalPlayer.Character:FindFirstChild("MoveStart"):Destroy()
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("NotHardBack") then
				game.Players.LocalPlayer.Character:FindFirstChild("NotHardBack"):Destroy()
			end
		end)
	else
		Slow:Disconnect()
	end
end)
Main:addDropdown("Slot Changer", {
	"Slot1",
	"Slot2",
	"Slot3"
}, function(a)
	game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(game:GetService("Workspace").FriendlyNPCs["Character Slot Changer"])
	wait(0.3)
	game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({
		[1] = "Yes"
	})
	wait(0.3)
	game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({
		[1] = "k"
	})
	wait(0.3)
	game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({
		[1] = a
	})
	wait(0.3);
	(nil):FireServer({
		[1] = "k"
	})
end)
Main:addToggle("Bean Spam", nil, function(a)
	if a == true then
		Spam = true
		while Spam do
			wait()
			game.Players.LocalPlayer.Backpack.ServerTraits.EatSenzu:FireServer(true)
		end
	else
		Spam = false
	end
end)
Main:addButton("No Flying Ki-Drain", function()
end)
Main:addToggle("Stay In Form", nil, function(a)
	if a == true then
		if not a then
			game.Players.LocalPlayer.Character.HumanoidRootPart.SaiyanAuraWeak:Destroy()
		end
		if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MajinParticle") then
			game.Players.LocalPlayer.Character.HumanoidRootPart.MajinParticle:Destroy()
		end
		if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Lightning2") then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Lightning2:Destroy()
		end
		if not a then
			game.Players.LocalPlayer.Character.SaiyanHair:Destroy()
		end
		if not a then
			game.Players.LocalPlayer.Character.Head.Tatoo:Destroy()
		end
		if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MajinAura") then
			game.Players.LocalPlayer.Character.HumanoidRootPart.MajinAura:Destroy()
		end
	else
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end
end)
local GodModes = MainPage:addSection("God Modes")
GodModes:addToggle("Rainbow Hair Godmode", nil, function(a)
	game.Workspace.Live[game.Players.LocalPlayer.name].Parent = game.Workspace.Effects
	wait()
	game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(game:GetService("Workspace").FriendlyNPCs["Hair Stylist"])
	wait(0.3)
	game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer(unpack({
		[1] = {
			[1] = "Yes"
		}
	}))
	game:GetService("RunService").RenderStepped:connect(function()
		game:GetService("Players").LocalPlayer.PlayerGui.Setup.Enabled = false
		game:GetService("Players").LocalPlayer.Backpack.HairScript.RemoteEvent:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.Setup.Frame.Side.HairColor, "up")
		game:GetService("Players").LocalPlayer.Backpack.HairScript.RemoteEvent:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.Setup.Frame.Side.Skin, "up")
		game:GetService("Players").LocalPlayer.Backpack.HairScript.RemoteEvent:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.Setup.Frame.Side.Hair, "up")
	end)
end)
GodModes:addToggle("Earth Godmode", nil, function(a)
	if a == true then
		va = game:GetService("RunService").RenderStepped:Connect(function()
			firetouchinterest(va, vb, 0)
			firetouchinterest(va, vb, 1)
			if not game.Players.LocalPlayer.PlayerGui then
				game.Players.LocalPlayer.PlayerGui.Popup:Destroy()
			end
		end)
	else
		va:Disconnect()
		if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Popup") then
			game.Players.LocalPlayer.PlayerGui.Popup:Destroy()
		end
	end
end)
GodModes:addButton("Ranked/HTC Godmode", function(a)
	game.Players.LocalPlayer.Character.Stats["Phys-Resist"]:Destroy()
	game.Players.LocalPlayer.Character.Stats["Ki-Resist"]:Destroy()
end)
local TopRespawn = MainPage:addSection("Top Respawn")
TopRespawn:addToggle("Top Respawn Loop", nil, function(a)
	if a == true then
		respawn = true
		repeat
			while not a do
				wait(0.05)
				game.Players.localPlayer.Character:FindFirstChild("SuperAction"):Destroy()
			end
		until not a
	else
		respawn = false
	end
end)
TopRespawn:addButton("TOP Respawn (L to revive K to tp out)", function()
	game:GetService("Players").LocalPlayer:GetMouse().KeyDown:connect(function(a)
		if a == "k" then
			game:GetService("TweenService"):Create(va.Character.HumanoidRootPart, TweenInfo.new(0, 3, Enum.EasingStyle.Linear), {
				CFrame = CFrame.new(100, 100, 100)
			}):Play()
		end
	end)
	game:GetService("Players").LocalPlayer:GetMouse().KeyDown:connect(function(a)
		if a == "l" then
			va.Character.SuperAction:Destroy()
		end
	end)
end)
local AnnoyingShit = MainPage:addSection("Annoying Shit")
AnnoyingShit:addToggle("Dragon Throw Stuck", nil, function(a)
	if a == true then
		if not game:GetService("Players") and game:GetService("Players"):FindFirstChildOfClass("Player").Character and not game:GetService("Players") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Throw") then
			game:GetService("Players"):FindFirstChildOfClass("Player").Character:FindFirstChildOfClass("Humanoid"):EquipTool((game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Throw")))
		end
		wait()
		if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Throw") then
			game.Players.LocalPlayer.Character["Dragon Throw"].Activator.Flip:Destroy()
		end
		if not game:GetService("Players") then
			game.Players.LocalPlayer.Character["Dragon Throw"].Activator.Blocked:Destroy()
		end
	else
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end
end)
AnnoyingShit:addToggle("Dragon Crush Stuck", nil, function(a)
	if a == true then
		if game:GetService("Players"):FindFirstChildOfClass("Player") and not game:GetService("Players") and not game:GetService("Players") and not game:GetService("Players") then
			game:GetService("Players"):FindFirstChildOfClass("Player").Character:FindFirstChildOfClass("Humanoid"):EquipTool((game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Crush")))
		end
		wait()
		if not game:GetService("Players") then
			game.Players.LocalPlayer.Character["Dragon Crush"].Activator.Flip:Destroy()
		end
		if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Crush") then
			game.Players.LocalPlayer.Character["Dragon Crush"].Activator.Blocked:Destroy()
		end
	else
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end
end)
AnnoyingShit:addButton("Server Destroyer", function()
	game:GetService("RunService").RenderStepped:connect(function()
		for fd, fe in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if fe.Name == "Energy Wave" or fe.Name == "Double Sunday" or fe.Name == "Destructo Disk" or fe.Name == "Explosive Wave" or fe.Name == "Kamehameha" or fe.Name == "Tribeam" or fe.Name == "Super Volley" or fe.Name == "Burning Attack" or fe.Name == "Big Bang Attack" or fe.Name == "Hellzone Grenade" or fe.Name == "Special Beam Cannon" or fe.Name == "Galic Gun" or fe.Name == "Spirit Ball" or fe.Name == "Burning Blast" or fe.Name == "Death Beam Barrage" or fe.Name == "Chain Destructo Disk" or fe.Name == "Heat Dome Attack" or fe.Name == "Light Grenade" or fe.Name == "Death Saucer" or fe.Name == "Final Flash" or fe.Name == "Giant Storm" or fe.Name == "Finish Breaker" or fe.Name == "Warp Kamehameha" or fe.Name == "Spirit Bomb" or fe.Name == "Crusher Ball" or fe.Name == "Big Bang Kamehameha" or fe.Name == "Sudden Storm" or fe.Name == "Demon Flash" or fe.Name == "Milky Cannon" or fe.Name == "Super Nova" or fe.Name == "Murder Grenade" or fe.Name == "Genocide Shell" or fe.Name == "Break Cannon" or fe.Name == "Super Spirit Bomb" or fe.Name == "Beam Scatter" or fe.Name == "Final Shine" or fe.Name == "Hell Pillars" or fe.Name == "Justice Flash" or fe.Name == "Final Kame" or fe.Name == "Pressure Gauge" or fe.Name == "Divine Lasso" or fe.Name == "Holy Wrath" or fe.Name == "Super Death Beam" or fe.Name == "Planet Crusher" or fe.Name == "Blaster Meteor" or fe.Name == "Broly Kamehameha" or fe.Name == "Gigantic Breath" or fe.Name == "Eraser Cannon" or fe.Name == "Buu Blaster" or fe.Name == "Death Beam" or fe.Name == "Double Buster" or fe.Name == "Unrelenting Volley" or fe.Name == "Dark Beam" or fe.Name == "KKx4 Kamehameha" or fe.Name == "Flame Kamehameha" or fe.Name == "One-Hand Kamehameha" or fe.Name == "Explosive Grip" then
				fe.Parent = game.Players.LocalPlayer.Character
				fe:Activate()
				fe:Deactivate()
				wait(0.3)
				fe.Parent = game.Players.LocalPlayer.Backpack
			end
		end
	end)
end)
local Other = MainPage:addSection("Other")
Other:addButton("Free Nimbus", function()
	va = game.Players.LocalPlayer
	char = va.Character
	part = Instance.new("Part", char)
	function NimbusFunction(a)
		part.Name = a
	end
	NimbusFunction("Nimbus")
end)
Other:addButton("Dark Theme Chat", function()
	va = game.Players.LocalPlayer
	char = va.Character
	part = Instance.new("Folder", char)
	function DarkChatFunction(a)
		part.Name = a
	end
	DarkChatFunction("DarkTheme")
end)
Other:addColorPicker("Wing/Halo Color", Color3.new(0, 0, 0), function(a)
	if not a then
		game.Players.LocalPlayer.Character.RebirthWings.Handle.Color = a
	elseif game.Players.LocalPlayer.Character:FindFirstChild("RealHalo") then
		game.Players.LocalPlayer.Character.RealHalo.Handle.Color = a
	end
end)
local TeleportationPage = Library:addPage("Teleportation", 5012544693)
local PadTeleportation = TeleportationPage:addSection("Pad Teleportations")
PadTeleportation:addButton("Broly Pad", function()
	game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(2, Enum.EasingStyle.Quad), {
		CFrame = CFrame.new(2751.67725, 3944.85986, -2272.62622)
	}):Play()
end)
PadTeleportation:addButton("TOP Pad", function()
	game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(2, Enum.EasingStyle.Quad), {
		CFrame = CFrame.new(2508.15, 3945.41, -2029.8)
	}):Play()
end)
PadTeleportation:addButton("Hard TOP Pad", function()
	game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(2, Enum.EasingStyle.Quad), {
		CFrame = CFrame.new(2510.97656, 3944.75, -2527.53125)
	}):Play()
end)
local Teleportations = TeleportationPage:addSection("Teleportations")
Teleportations:addButton("Earth", function()
	game:GetService("TeleportService"):Teleport(536102540, game.Players.LocalPlayer)
end)
Teleportations:addButton("Namek", function()
	game:GetService("TeleportService"):Teleport(882399924, game.Players.LocalPlayer)
end)
Teleportations:addButton("Space", function()
	game:GetService("TeleportService"):Teleport(478132461, game.Players.LocalPlayer)
end)
Teleportations:addButton("Future", function()
	game:GetService("TeleportService"):Teleport(569994010, game.Players.LocalPlayer)
end)
Teleportations:addButton("Secret World", function()
	game:GetService("TeleportService"):Teleport(2046990924, game.Players.LocalPlayer)
end)
Teleportations:addButton("Queue World", function()
	game:GetService("TeleportService"):Teleport(3565304751, game.Players.LocalPlayer)
end)
Teleportations:addButton("HTC", function()
	game:GetService("TeleportService"):Teleport(882375367, game.Players.LocalPlayer)
end)
Teleportations:addButton("Zaros", function()
	game:GetService("TeleportService"):Teleport(2651456105, game.Players.LocalPlayer)
end)
Teleportations:addButton("Heaven", function()
	game:GetService("TeleportService"):Teleport(3552157537, game.Players.LocalPlayer)
end)
local CityTeleportations = TeleportationPage:addSection("City Teleportations")
CityTeleportations:addButton("South City", function()
	game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(2, Enum.EasingStyle.Quad), {
		CFrame = CFrame.new(-456, 616272, 24, 4875565, -6411, 93945, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	}):Play()
end)
CityTeleportations:addButton("West City", function()
	game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(2, Enum.EasingStyle.Quad), {
		CFrame = CFrame.new(-570, 783386, 19, 4874763, -2884, 49414, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	}):Play()
end)
CityTeleportations:addButton("Korin Tower", function()
	game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(2, Enum.EasingStyle.Quad), {
		CFrame = CFrame.new(2036, 96008, 1493, 73865, -2287, 70313, -0, 560825825, 0, 219532698, -0, 798298001, -0, 391403764, -0, 919956446, 0, 0219828039, -0, 729573488, 0, 324785352, 0, 601861298)
	}):Play()
end)
CityTeleportations:addButton("Central City", function()
	game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(2, Enum.EasingStyle.Quad), {
		CFrame = CFrame.new(-3834, 28442, 19, 4875641, -1428, 18091, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	}):Play()
end)
CityTeleportations:addButton("Goku's House", function()
	game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(2, Enum.EasingStyle.Quad), {
		CFrame = CFrame.new(-5946, 98193, 18, 687664, -4229, 69336, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	}):Play()
end)
repeat wait()
until game:IsLoaded()
for i, v in pairs(game:GetService("Workspace").Live:GetChildren()) do
	if v.Name == "Big Snake" then
		v:Destroy()
	end
end
local AutoFarmPage = Library:addPage("AutoFarm", 5012544693)
local AutoFarm = AutoFarmPage:addSection("AutoFarm")
AutoFarm:addButton("Recommended Farm", function()
	game:GetService("CoreGui")["Snowy Hub"].Main.AutoFarm.AutoFarm.Container.NPC1.Button.Textbox.Text = "Saiba"
	game:GetService("CoreGui")["Snowy Hub"].Main.AutoFarm.AutoFarm.Container.NPC2.Button.Textbox.Text = "Saiyan"
	game:GetService("CoreGui")["Snowy Hub"].Main.AutoFarm.AutoFarm.Container.NPC3.Button.Textbox.Text = "Chi"
	game:GetService("CoreGui")["Snowy Hub"].Main.AutoFarm.AutoFarm.Container.NPC4.Button.Textbox.Text = "Boxer"
end)
AutoFarm:addTextbox("NPC1", "", function(a)
	NPCS1 = a;
end)
AutoFarm:addTextbox("NPC2", "", function(a)
	NPC2 = a;
end)
AutoFarm:addTextbox("NPC3", "", function(a)
	NPCS3 = a;
end)
AutoFarm:addTextbox("NPC4", "", function(a)
	NPCS4 = a;
end)
game.CoreGui["Snowy Hub"].Main.AutoFarm.AutoFarm.Container.Textbox.Name = "NPC1"
game.CoreGui["Snowy Hub"].Main.AutoFarm.AutoFarm.Container.Textbox.Name = "NPC2"
game.CoreGui["Snowy Hub"].Main.AutoFarm.AutoFarm.Container.Textbox.Name = "NPC3"
game.CoreGui["Snowy Hub"].Main.AutoFarm.AutoFarm.Container.Textbox.Name = "NPC4"
local AutoFarmSettings = AutoFarmPage:addSection("Settings")
AutoFarmSettings:addToggle("Auto Attack", nil, function(AutoAttack)
	if AutoAttack then
		Auto_Attack = true
		while Auto_Attack == true do
			wait(.3)
			if Auto_Attack == true and Target then
				if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Target.HumanoidRootPart.Position).magnitude < 13 and game.PlaceId == 536102540 then
					game.Players.LocalPlayer.Backpack.ServerTraits.Input:FireServer({
						[1] = "md"
					}, CFrame.new(0, 0, 0), nil, false)
				elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Target.HumanoidRootPart.Position).magnitude < 13 and game.PlaceId ~= 536102540 then
					game.Players.LocalPlayer.Backpack.ServerTraits.Input:FireServer({
						[1] = "md"
					}, CFrame.new(0, 0, 0), nil, false)
				end
			end
		end
	else
		Auto_Attack = false
	end
end)
AutoFarmSettings:addToggle("Reset Ki", nil, function(a)
	if a == true then
		_G.RESETSTAM = true
		repeat
			wait()
			if game:GetService("Players").LocalPlayer.Character.Ki.Value <= 100 and Target then
				game:GetService("ReplicatedStorage").ResetChar:FireServer()
			end
		until _G.RESETSTAM == false
	else
		_G.RESETSTAM = false
	end
end)
local fuckufuckingskidassskidnig
AutoFarmSettings:addToggle("Start Auto Farm", nil, function(a)
	fuckufuckingskidassskidnig = a
	if a then
		local NPCS = {
			game:GetService("CoreGui")["Snowy Hub"].Main.AutoFarm.AutoFarm.Container.NPC1.Button.Textbox.Text,
			game:GetService("CoreGui")["Snowy Hub"].Main.AutoFarm.AutoFarm.Container.NPC2.Button.Textbox.Text,
			game:GetService("CoreGui")["Snowy Hub"].Main.AutoFarm.AutoFarm.Container.NPC3.Button.Textbox.Text,
			game:GetService("CoreGui")["Snowy Hub"].Main.AutoFarm.AutoFarm.Container.NPC4.Button.Textbox.Text
		}
		local NPCNUMBER = 1
		while fuckufuckingskidassskidnig == true and wait() do
			for _, v in pairs(game.Workspace.Live:GetChildren()) do
				if v.Name:find(NPCS[NPCNUMBER]) and string.len(NPCS[NPCNUMBER]) > 2 and v.Humanoid.Health > 1 then
					Target = v
					repeat
						game:GetService("RunService").RenderStepped:Wait()
						if fuckufuckingskidassskidnig == true then
							if 1 >= game.Players.LocalPlayer.Character.Humanoid.Health then
								repeat
									wait()
								until 1 < game.Players.LocalPlayer.Character.Humanoid.Health
							end
							game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
							local Time
							game.Workspace.CurrentCamera.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(v.HumanoidRootPart.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z)) * CFrame.new(0, 2, 10)
							Time = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude / 10000
							game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
								CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
							}):Play()
						end
					until v.Humanoid.Health <= 0.01 or fuckufuckingskidassskidnig == false
				end
			end
			if NPCNUMBER ~= 4 then
				NPCNUMBER = NPCNUMBER + 1
			elseif NPCNUMBER == 4 then
				NPCNUMBER = 1
			end
		end
	else
		Target = nil
	end
end)
local Moves = AutoFarmPage:addSection("Moves")
Moves:addButton("Recommended Melee Moves", function()
	m_1.Button.Textbox.Text = "Wolf Fang Fist"
	m_2.Button.Textbox.Text = "Deadly Dance"
	m_3.Button.Textbox.Text = "Mach Kick"
	m_4.Button.Textbox.Text = "Anger Rush"
	m_5.Button.Textbox.Text = "Neo Wolf Fang Fist"
	m_6.Button.Textbox.Text = "Meteor Crash"
	m_7.Button.Textbox.Text = "Spirit Bomb Sword"
	m_7.Button.Textbox.Text = "Flash Skewer"
	m_8.Button.Textbox.Text = "TS Molotov"
	m_9.Button.Textbox.Text = "Sweep Kick"
end)
m_1 = Moves:addTextbox("Move1", "", function(a)
	va = a
end)
m_2 = Moves:addTextbox("Move2", "", function(a)
	va = a
end)
m_3 = Moves:addTextbox("Move3", "", function(a)
	va = a
end)
m_4 = Moves:addTextbox("Move4", "", function(a)
	va = a
end)
m_5 = Moves:addTextbox("Move5", "", function(a)
	va = a
end)
m_6 = Moves:addTextbox("Move6", "", function(a)
	va = a
end)
m_7 = Moves:addTextbox("Move7", "", function(a)
	va = a
end)
m_8 = Moves:addTextbox("Move8", "", function(a)
	va = a
end)
m_9 = Moves:addTextbox("Move9", "", function(a)
	va = a
end)
Moves:addToggle("Use Moves", nil, function(a)
	if a then
		va = true
		repeat
			while va do
				for fe, fg in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if fg.Name == nil then
					elseif fg.Name == vb or fg.Name == vc or fg.Name == vd or fg.Name == ve or fg.Name == vg or fg.Name == vh or fg.Name == vj or fg.Name == vk or fg.Name == vl then
						fg.Parent = game.Players.LocalPlayer.Character
						fg:Activate()
						fg:Deactivate()
						wait(0.2)
						fg.Parent = game.Players.LocalPlayer.Backpack
					end
				end
			end
		until va == true and not a and game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Target.HumanoidRootPart.Position.magnitude <= 40
	else
		va = false
	end
end)
local AutoRedQuest = AutoFarmPage:addSection("Auto Red Quests")
AutoRedQuest:addButton("Do All", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/DoAll.lua"))()
end)
AutoRedQuest:addButton("Do Bulma Quest", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/BulmaQuest.lua"))()
end)
AutoRedQuest:addButton("Do Trunks Quest", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/TrunksFuture.lua"))()
end)
AutoRedQuest:addButton("Do Namek Ship Quest", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/NamekSpaceShip.lua"))()
end)
AutoRedQuest:addButton("Do Korin Tower Quest", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/KorinDrink.lua"))()
end)
AutoRedQuest:addButton("Get Elder Kai Once", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/StepSisSnow/StepSisSnowsScripts/main/ElderKaiOnce.lua"))()
end)
local AutoStatsPage = Library:addPage("Auto Stats", 5012544693)
local AutoStat = AutoStatsPage:addSection("Auto Stats")
AutoStat:addToggle("Health Max", nil, function(a)
	if a == true then
		_G.stat1 = true
		repeat
			wait()
			game:GetService("Players").LocalPlayer.Backpack.ServerTraits.AttemptUpgrade:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats["Health-Max"])
		until _G.stat1 == false
	else
		_G.stat1 = false
	end
end)
AutoStat:addToggle("Ki Max", nil, function(a)
	if a == true then
		_G.stat2 = true
		repeat
			wait()
			game:GetService("Players").LocalPlayer.Backpack.ServerTraits.AttemptUpgrade:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats["Ki-Max"])
		until _G.stat2 == false
	else
		_G.stat2 = false
	end
end)
AutoStat:addToggle("Melee Damage", nil, function(a)
	if a == true then
		_G.stat3 = true
		wait()
		game:GetService("Players").LocalPlayer.Backpack.ServerTraits.AttemptUpgrade:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats["Phys-Damage"])
	elseif _G.stat3 ~= false then
		_G.stat3 = false
	end
end)
AutoStat:addToggle("Ki Damage", nil, function(a)
	if a == true then
		_G.stat4 = true
		wait()
		game:GetService("Players").LocalPlayer.Backpack.ServerTraits.AttemptUpgrade:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats["Ki-Damage"])
	elseif _G.stat4 ~= false then
		_G.stat4 = false
	end
end)
AutoStat:addToggle("Melee Resistance", nil, function(a)
	if a == true then
		_G.stat5 = true
		wait()
		game:GetService("Players").LocalPlayer.Backpack.ServerTraits.AttemptUpgrade:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats["Phys-Resist"])
	elseif _G.stat5 ~= false then
		_G.stat5 = false
	end
end)
AutoStat:addToggle("Ki Resistance", nil, function(a)
	if a == true then
		_G.stat6 = true
		repeat
			wait()
			game:GetService("Players").LocalPlayer.Backpack.ServerTraits.AttemptUpgrade:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats["Ki-Resist"])
		until _G.stat6 == false
	else
		_G.stat6 = false
	end
end)
AutoStat:addToggle("Speed", nil, function(a)
	if a == true then
		_G.stat7 = true
		wait()
		game:GetService("Players").LocalPlayer.Backpack.ServerTraits.AttemptUpgrade:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.Speed)
	elseif _G.stat7 ~= false then
		_G.stat7 = false
	end
end)
local BuyPage = Library:addPage("Buy", 5012544693)
local beanstojar = BuyPage:addSection("Beans&Jars")
beanstojar:addDropdown("Beans", {
	"Stop Buying",
	"Red Beans",
	"Green Beans",
	"Blue Beans",
	"Yellow Beans"
}, function(Beans)
	if Beans == "Red Beans" then
		_G.BeanBuy1 = true
		_G.BeanBuy2 = false
		_G.BeanBuy3 = false
		_G.BeanBuy4 = false
		while _G.BeanBuy1 and wait() do
			local A_1 = game:GetService("Workspace").FriendlyNPCs["Korin BEANS"]
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Beans"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "80"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Red"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Yes"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
		end
	elseif Beans == "Green Beans" then
		_G.BeanBuy1 = false
		_G.BeanBuy2 = true
		_G.BeanBuy3 = false
		_G.BeanBuy4 = false
		while _G.BeanBuy2 and wait() do
			local A_1 = game:GetService("Workspace").FriendlyNPCs["Korin BEANS"]
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Beans"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "80"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Green"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Yes"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
		end
	elseif Beans == "Blue Beans" then
		_G.BeanBuy1 = false
		_G.BeanBuy2 = false
		_G.BeanBuy3 = true
		_G.BeanBuy4 = false
		while _G.BeanBuy3 and wait() do
			local A_1 = game:GetService("Workspace").FriendlyNPCs["Korin BEANS"]
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Beans"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "80"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Blue"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Yes"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
		end
	elseif Beans == "Yellow Beans" then
		_G.BeanBuy1 = false
		_G.BeanBuy2 = false
		_G.BeanBuy3 = false
		_G.BeanBuy4 = true
		while _G.BeanBuy4 and wait() do
			local A_1 = game:GetService("Workspace").FriendlyNPCs["Korin BEANS"]
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Beans"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "80"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Yellow"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Yes"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
		end
	else
		_G.BeanBuy1 = false
		_G.BeanBuy2 = false
		_G.BeanBuy3 = false
		_G.BeanBuy4 = false
	end
end)
beanstojar:addDropdown("Jars", {
	"Stop Buying",
	"Red Jars",
	"Green Jars",
	"Blue Jars",
	"Yellow Jars"
}, function(Jars)
	if Jars == "Red Jars" then
		_G.JarBuy1 = true
		_G.JarBuy2 = false
		_G.JarBuy2 = false
		_G.JarBuy4 = false
		while _G.JarBuy1 and wait() do
			local A_1 = game:GetService("Workspace").FriendlyNPCs["Korin BEANS"]
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Jars"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "80"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Red"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Yes"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
		end
	elseif Jars == "Green Jars" then
		_G.JarBuy1 = false
		_G.JarBuy2 = true
		_G.JarBuy3 = false
		_G.JarBuy4 = false
		while _G.JarBuy2 and wait() do
			local A_1 = game:GetService("Workspace").FriendlyNPCs["Korin BEANS"]
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Jars"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "80"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Green"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Yes"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
		end
	elseif Jars == "Blue Jars" then
		_G.JarBuy1 = false
		_G.JarBuy2 = false
		_G.JarBuy3 = true
		_G.JarBuy4 = false
		while _G.JarBuy3 and wait() do
			local A_1 = game:GetService("Workspace").FriendlyNPCs["Korin BEANS"]
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Jars"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "80"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Blue"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Yes"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
		end
	elseif Jars == "Yellow Jars" then
		_G.JarBuy1 = false
		_G.JarBuy2 = false
		_G.JarBuy3 = false
		_G.JarBuy4 = true
		while _G.JarBuy4 and wait() do
			local A_1 = game:GetService("Workspace").FriendlyNPCs["Korin BEANS"]
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Jars"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "80"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Yellow"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "Yes"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
			local A_1 = {
				[1] = "k"
			}
			local Event = game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance
			Event:FireServer(A_1)
			wait(0.3)
		end
	else
		_G.JarBuy1 = false
		_G.JarBuy2 = false
		_G.JarBuy3 = false
		_G.JarBuy4 = false
	end
end)
local elderkai = BuyPage:addSection("Elder Kai")
elderkai:addToggle("Buy Elder Kai", nil, function(a)
	if a == true then
		_G.elderkaibuy = true
		while not a and wait(1) do
			game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(game:GetService("Workspace").FriendlyNPCs["Elder Kai"])
			wait(0.3)
			game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({
				[1] = "k"
			})
			wait(0.3)
			game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({
				[1] = "Yes"
			})
			wait(0.3)
			game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({
				[1] = "k"
			})
			wait(0.3)
			game:GetService("Players").LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({
				[1] = "k"
			})
			wait(0.3)
		end
	else
		_G.elderkaibuy = false
	end
end)
local alphaclothes = BuyPage:addSection("Skidded Alpha Clothes")
alphaclothes:addButton("TC Armor", function()
	game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(game.Workspace.FriendlyNPCs["TC Armor"])
	wait(0.35)
	game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({
		[1] = "k"
	})
	wait(0.35)
	game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({
		[1] = "Purchase"
	})
	wait(0.35)
	game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({
		[1] = "k"
	})
end)
alphaclothes:addButton("Aqua Gi", function()
	game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(game.Workspace.FriendlyNPCs["Aqua Gi"])
	wait(0.35)
	game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({
		[1] = "k"
	})
	wait(0.35)
	game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({
		[1] = "Purchase"
	})
	wait(0.35)
	game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({
		[1] = "k"
	})
end)
local saiyans = BuyPage:addSection("Saiyans")
local arcosians = BuyPage:addSection("Arcosian")
local humans = BuyPage:addSection("Human")
local jirens = BuyPage:addSection("Jirens")
local namekian = BuyPage:addSection("Namekians")
local majins = BuyPage:addSection("Majins")
local otherbs = BuyPage:addSection("Other")
local heavenbullshit = BuyPage:addSection("Heaven Moves")
saiyans:addButton("MSSJB, CSSJB, SSJBE", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Complete Super Saiyan Blue")
end)
saiyans:addButton("SSJ4", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("SSJ4")
end)
arcosians:addButton("Cooler Form", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Cooler Form")
end)
arcosians:addButton("Golden Cooler Form", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Golden Cooler")
end)
humans:addButton("KKX100, Kaioken x 100", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("KaioKenx100")
end)
humans:addButton("Dark Human", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Dark Human")
end)
jirens:addButton("Despair", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Despair")
end)
namekian:addButton("Demon Namekian", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Demon Namekian")
end)
namekian:addButton("White Namekian", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("White Namek")
end)
majins:addButton("Dark Majin", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Dark Majin")
end)
majins:addButton("Unstable Majin", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Unstable")
end)
otherbs:addButton("MUI", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("Mastered Ultra Instinct")
end)
heavenbullshit:addButton("God Evade", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("God Evade")
end)
heavenbullshit:addButton("God Punch", function()
	game:GetService("ReplicatedStorage").AttemptBuy:InvokeServer("God Punch")
end)
local StatCheckPage = Library:addPage("Stat Checker", 5012544693)
local StatChecker = StatCheckPage:addSection("Stat Checker")
StatChecker:addTextbox("Target Name", "", function(a, b)
	game.CoreGui["Snowy Hub"].Main["Stat Checker"]["Stat Checker"].Container["2"].Button.Textbox.Text = game.Workspace.Live[a].Race.Value
	game.CoreGui["Snowy Hub"].Main["Stat Checker"]["Stat Checker"].Container["3"].Button.Textbox.Text = game.Workspace.Live[a].Stats["Health-Max"].Value
	game.CoreGui["Snowy Hub"].Main["Stat Checker"]["Stat Checker"].Container["4"].Button.Textbox.Text = game.Workspace.Live[a].Stats["Ki-Max"].Value
	game.CoreGui["Snowy Hub"].Main["Stat Checker"]["Stat Checker"].Container["5"].Button.Textbox.Text = game.Workspace.Live[a].Stats["Phys-Damage"].Value
	game.CoreGui["Snowy Hub"].Main["Stat Checker"]["Stat Checker"].Container["6"].Button.Textbox.Text = game.Workspace.Live[a].Stats["Ki-Damage"].Value
	game.CoreGui["Snowy Hub"].Main["Stat Checker"]["Stat Checker"].Container["7"].Button.Textbox.Text = game.Workspace.Live[a].Stats["Phys-Resist"].Value
	game.CoreGui["Snowy Hub"].Main["Stat Checker"]["Stat Checker"].Container["8"].Button.Textbox.Text = game.Workspace.Live[a].Stats["Ki-Resist"].Value
	game.CoreGui["Snowy Hub"].Main["Stat Checker"]["Stat Checker"].Container["9"].Button.Textbox.Text = game.Workspace.Live[a].Stats.Speed.Value
	if game:GetService("Workspace").Live[a]:FindFirstChild("RebirthWings") then
		game.CoreGui["Snowy Hub"].Main["Stat Checker"]["Stat Checker"].Container["10"].Button.Textbox.Text = "Rebirth"
	elseif not b then
		game.CoreGui["Snowy Hub"].Main["Stat Checker"]["Stat Checker"].Container["10"].Button.Textbox.Text = "Heaven"
	else
		game.CoreGui["Snowy Hub"].Main["Stat Checker"]["Stat Checker"].Container["10"].Button.Textbox.Text = "Pure"
	end
	game.CoreGui["Snowy Hub"].Main["Stat Checker"]["Stat Checker"].Container["2"].Button.Textbox.Text = ExtraThing
end)
StatChecker:addTextbox("1. Race:", "", function(a, b)
end)
StatChecker:addTextbox("2. Health Max:", "", function(a, b)
end)
StatChecker:addTextbox("3. Ki Max:", "", function(a, b)
end)
StatChecker:addTextbox("4. Melee Damage:", "", function(a, b)
end)
StatChecker:addTextbox("5. Ki Damage:", "", function(a, b)
end)
StatChecker:addTextbox("6. Melee Resistance:", "", function(a, b)
end)
StatChecker:addTextbox("7. Ki Resistance:", "", function(a, b)
end)
StatChecker:addTextbox("8. Speed:", "", function(a, b)
end)
StatChecker:addTextbox("9. Extra:", "", function(a, b)
end)
statcheckthing = 1
for faK, faL in pairs(game.CoreGui["Snowy Hub"].Main["Stat Checker"]["Stat Checker"].Container:GetDescendants()) do
	if not nil then
		faL.Name = statcheckthing
		statcheckthing = 88 + 1
	end
end
local ScreenPage = Library:addPage("Screen", 5012544693)
local Screen = ScreenPage:addSection("Saiyans")
Screen:addSlider("FOV", 70, 1, 120, function(a)
	game.Workspace.Camera.FieldOfView = a
end)
Screen:addSlider("Saturation", 25, -25, 0, function(a)
	game.Lighting.ColorCorrection.Saturation = a
end)
Screen:addToggle("Drugs", nil, function(a)
	_G.high = true
	if a == true then
		while _G.high do
			game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, TweenInfo.new(1, 1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				FieldOfView = 120
			}):Play()
			game:GetService("TweenService"):Create(game:GetService("Lighting").ColorCorrection, TweenInfo.new(1, 8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				Saturation = 35
			}):Play()
			wait(1, 1)
			game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, TweenInfo.new(1, 1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				FieldOfView = 1
			}):Play()
			game:GetService("TweenService"):Create(game:GetService("Lighting").ColorCorrection, TweenInfo.new(1, 8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				Saturation = -35
			}):Play()
			wait(1, 1)
		end
	else
		_G.high = false
		wait(3)
		game.Workspace.Camera.FieldOfView = 70
		game.Lighting.ColorCorrection.Saturation = 0, 2
	end
end)
Screen:addToggle("FullBright", nil, function(a)
	if a == true then
		va = game:GetService("RunService").RenderStepped:Connect(function()
			game.Lighting.FogEnd = 99999999
		end)
	else
		va:Disconnect()
		game.Lighting.FogEnd = 2000
	end
end)
local CharPage = Library:addPage("Char", 5012544693)
local Auras = CharPage:addSection("Aura's")
Auras:addToggle("MuiRunOut", nil, function(a)
	while a do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.MuiRunOut.Enabled = true
	end
end)
Auras:addToggle("SaiyanRedAura", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.SaiyanRedAura.Enabled = true
	end
end)
Auras:addToggle("Lightning3", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.Lightning3.Enabled = true
	end
end)
Auras:addToggle("SenzuEat", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.SenzuEat.Enabled = true
	end
end)
Auras:addToggle("MajinParticle", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.MajinParticle.Enabled = true
	end
end)
Auras:addToggle("Lightning2", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.Lightning2.Enabled = true
	end
end)
Auras:addToggle("SaiyanBlueAura", nil, function(a)
	while a do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.SaiyanBlueAura.Enabled = true
	end
end)
Auras:addToggle("LevelParticle", nil, function(a)
	while a do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.LevelParticle.Enabled = true
	end
end)
Auras:addToggle("Lightning", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.Lightning.Enabled = true
	end
end)
Auras:addToggle("SaiyanAuraWeak", nil, function(a)
	while a do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.SaiyanAuraWeak.Enabled = true
	end
end)
Auras:addToggle("Broke2", nil, function(a)
	while a do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.Broke2.Enabled = true
	end
end)
Auras:addToggle("Broke1", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.Broke1.Enabled = true
	end
end)
Auras:addToggle("AuraOriginal", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.AuraOriginal.Enabled = true
	end
end)
Auras:addToggle("BB2", nil, function(a)
	while a do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.BB2.Enabled = true
	end
end)
Auras:addToggle("BB1", nil, function(a)
	while a do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.BB1.Enabled = true
	end
end)
Auras:addToggle("VanishParticle", nil, function(a)
	while a do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.VanishParticle.Enabled = true
	end
end)
Auras:addToggle("TrailOld", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.TrailOld.Enabled = true
	end
end)
Auras:addToggle("AuraParticle", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.AuraParticle.Enabled = true
	end
end)
Auras:addToggle("SaiyanAura", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.SaiyanAura.Enabled = true
	end
end)
Auras:addToggle("Hit", nil, function(a)
	while a do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.Hit.Enabled = true
	end
end)
Auras:addToggle("BlockParticle", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.BlockParticle.Enabled = true
	end
end)
Auras:addToggle("Block", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.Block.Enabled = true
	end
end)
Auras:addToggle("SaiyanRoseAura", nil, function(a)
	while a do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.SaiyanRoseAura.Enabled = true
	end
end)
Auras:addToggle("SaiyanLegendaryAura", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.SaiyanLegendaryAura.Enabled = true
	end
end)
Auras:addToggle("SaiyanBlueAura2", nil, function(a)
	while not nil do
		wait()
		game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].HumanoidRootPart.SaiyanBlueAura2.Enabled = true
	end
end)
local Clothes = CharPage:addSection("Clothes")
Clothes:addButton("El Hermano's Clothes", function()
	game.Workspace.Live[game.Players.LocalPlayer.name].Shirt.ShirtTemplate = "rbxassetid://1707786796"
	game.Workspace.Live[game.Players.LocalPlayer.name].Pants.PantsTemplate = "rbxassetid://1583420094"
end)
Clothes:addButton("Janemba's Clothes", function()
	game.Workspace.Live[game.Players.LocalPlayer.name].Shirt.ShirtTemplate = "rbxassetid://1267185864"
	game.Workspace.Live[game.Players.LocalPlayer.name].Pants.PantsTemplate = "rbxassetid://1287549597"
end)
Clothes:addButton("Friaza's Clothes", function()
	game.Workspace.Live[game.Players.LocalPlayer.name].Shirt.ShirtTemplate = "rbxassetid://139728673"
	game.Workspace.Live[game.Players.LocalPlayer.name].Pants.PantsTemplate = "rbxassetid://444226937"
end)
Clothes:addButton("Cell's Clothes", function()
	game.Workspace.Live[game.Players.LocalPlayer.name].Shirt.ShirtTemplate = "rbxassetid://82940047"
	game.Workspace.Live[game.Players.LocalPlayer.name].Pants.PantsTemplate = "rbxassetid://82940262"
end)
Clothes:addButton("Zeno's Clothes", function()
	game.Workspace.Live[game.Players.LocalPlayer.name].Shirt.ShirtTemplate = "rbxassetid://969885239"
	game.Workspace.Live[game.Players.LocalPlayer.name].Pants.PantsTemplate = "rbxassetid://935242315"
end)
Clothes:addButton("King Zaran's Clothes", function()
	game.Workspace.Live[game.Players.LocalPlayer.name].Shirt.ShirtTemplate = "rbxassetid://3680713779"
	game.Workspace.Live[game.Players.LocalPlayer.name].Pants.PantsTemplate = "rbxassetid://3680713016"
end)
Clothes:addButton("Whis' Clothes", function()
	game.Workspace.Live[game.Players.LocalPlayer.name].Shirt.ShirtTemplate = "rbxassetid://762559124"
	game.Workspace.Live[game.Players.LocalPlayer.name].Pants.PantsTemplate = "rbxassetid://949277447"
end)
Clothes:addButton("Broly's (BR) Clothes", function()
	game.Workspace.Live[game.Players.LocalPlayer.name].Shirt.ShirtTemplate = "rbxassetid://2121238332"
	game.Workspace.Live[game.Players.LocalPlayer.name].Pants.PantsTemplate = "rbxassetid://2121241572"
end)
Clothes:addButton("Kibito's Clothes", function()
	game.Workspace.Live[game.Players.LocalPlayer.name].Shirt.ShirtTemplate = "rbxassetid://2683587512"
	game.Workspace.Live[game.Players.LocalPlayer.name].Pants.PantsTemplate = "rbxassetid://2683596960"
end)
Clothes:addButton("Zaran's Clothes", function()
	game.Workspace.Live[game.Players.LocalPlayer.name].Shirt.ShirtTemplate = "rbxassetid://2488134541"
	game.Workspace.Live[game.Players.LocalPlayer.name].Pants.PantsTemplate = "rbxassetid://2488134740"
end)
Clothes:addButton("Hit's Clothes", function()
	game.Workspace.Live[game.Players.LocalPlayer.name].Shirt.ShirtTemplate = "rbxassetid://1046792338"
	game.Workspace.Live[game.Players.LocalPlayer.name].Pants.PantsTemplate = "rbxassetid://1046792500"
end)
Clothes:addButton("Champa's Clothes", function()
	game.Workspace.Live[game.Players.LocalPlayer.name].Shirt.ShirtTemplate = "rbxassetid://1070129183"
	game.Workspace.Live[game.Players.LocalPlayer.name].Pants.PantsTemplate = "rbxassetid://1070142250"
end)
local xmasshit = CharPage:addSection("X mas shit")
xmasshit:addButton("White Scarf", function()
	repeat
	until nil
end)
local Chargeshit = CharPage:addSection("Charge")
Chargeshit:addButton("Android Charge", function()
	game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(a)
		if a == "x" then
			Instance.new("Animation", va.Character).AnimationId = "rbxassetid://1587748889"
			vb = vc:LoadAnimation((Instance.new("Animation", va.Character)))
			vb:Play()
		end
	end)
	game.Players.LocalPlayer:GetMouse().KeyUp:Connect(function(a)
		if a == "x" then
			va:Stop()
		end
	end)
end)
local shitcharnigga = CharPage:addSection("Char")
shitcharnigga:addToggle("Anti-KB", nil, function(a)
	val = a
	while val do
		wait()
		if not a then
			game.Players.LocalPlayers.Character.Head:WaitForChild("KnockBacked"):Destroy()
		end
	end
end)
shitcharnigga:addToggle("Better Walking Anim", nil, function(a)
	if a == true then
		if game.Players.LocalPlayer.Character.Animate.walk:FindFirstChild("RunAnim") then
			game.Players.LocalPlayer.Character.Animate.walk:FindFirstChild("RunAnim").AnimationId = "rbxassetid://2625673611"
		end
	elseif not a then
		game.Players.LocalPlayer.Character.Animate.walk:FindFirstChild("RunAnim").AnimationId = "rbxassetid://669161051"
	end
end)
shitcharnigga:addToggle("Dust", nil, function(a)
	if a == true then
		va = game:GetService("RunService").RenderStepped:connect(function()
			game.Players.LocalPlayer.Backpack.ServerTraits.Vanish:FireServer("average", (CFrame.new(-696, 695679, 291, 290009, -5554, 28467, 0, 359417617, 0, 41572988, -0, 83545661, 0, 0, 895282269, 0, 445499539, 0, 933176875, -0, 160120383, 0, 321780175)))
		end)
	else
		va:Disconnect()
	end
end)
shitcharnigga:addToggle("Invisibility", nil, function(a)
	if a == true then
		if true then
			Instance.new("Part", workspace).Size = Vector3.new(5, 0, 5)
			Instance.new("Part", workspace).Anchored = true
			Instance.new("Part", workspace).CFrame = CFrame.new(Vector3.new(9999, 9999, 9999))
			game.Players.LocalPlayer.Character.PrimaryPart.CFrame = Instance.new("Part", workspace).CFrame * CFrame.new(0, 3, 0)
			spawn(function()
				wait(3)
				va:Destroy()
			end)
		end
		if (function()
			if va.Character then
				if va.Character:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R15 then
					return "R15"
				else
					return "R6"
				end
			end
		end)() == "R6" then
			game.Players.LocalPlayer.Character.HumanoidRootPart:Destroy()
			game.Players.LocalPlayer.Character.HumanoidRootPart:Clone().Parent = game.Players.LocalPlayer.Character
		else
			game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy()
			game.Players.LocalPlayer.Character.LowerTorso.Root:Clone().Parent = game.Players.LocalPlayer.Character.LowerTorso
		end
		if true then
			wait(1)
			game.Players.LocalPlayer.Character.PrimaryPart.CFrame = game.Players.LocalPlayer.Character.PrimaryPart.CFrame
		end
	else
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end
end)
shitcharnigga:addButton("Wing/Halo Remover", function()
	if not game.Players.LocalPlayer.Character then
		game.Players.LocalPlayer.Character.RebirthWings:Destroy()
	elseif game.Players.LocalPlayer.Character:FindFirstChild("RealHalo") then
		game.Players.LocalPlayer.Character.RealHalo:Destroy()
	end
end)
shitcharnigga:addButton("Level Remove", function()
	if game:GetService("Players").LocalPlayer then
	end
	for fg, fh in pairs(game:GetService("Players").LocalPlayer.CharacterAdded:Wait():GetChildren()) do
		if not game:GetService("Players").LocalPlayer.CharacterAdded:Wait() then
			fh:Destroy()
			break
		end
	end
end)
shitcharnigga:addButton("Accessory", function()
	for fg, fh in pairs(game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait():GetChildren()) do
		if fh:IsA("Accessory") then
			fh:Destroy()
			break
		end
	end
end)
shitcharnigga:addButton("Naked", function()
	game.Players.LocalPlayer.Character.Shirt:Destroy()
	game.Players.LocalPlayer.Character.Pants:Destroy()
end)
shitcharnigga:addButton("Remove Aura", function()
	if not game.Players.LocalPlayer.Character.HumanoidRootPart or game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Lightning") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.TempAura:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.Lightning:Destroy()
	end
end)
shitcharnigga:addButton("Super Dragon Fist Aura", function()
	if game:GetService("Players"):FindFirstChildOfClass("Player") and game:GetService("Players"):FindFirstChildOfClass("Player").Character and game:GetService("Players"):FindFirstChildOfClass("Player").Character:FindFirstChildOfClass("Humanoid") and not game:GetService("Players"):FindFirstChildOfClass("Player") then
		game:GetService("Players"):FindFirstChildOfClass("Player").Character:FindFirstChildOfClass("Humanoid"):EquipTool((game.Players.LocalPlayer.Backpack:FindFirstChild("Super Dragon Fist")))
	end
	wait(0.5)
	if not game:GetService("Players"):FindFirstChildOfClass("Player") then
		game.Players.LocalPlayer.Character["Super Dragon Fist"].Activator.Forward:Destroy()
	end
end)
shitcharnigga:addButton("Kaioken Assault Aura", function()
	if game:GetService("Players"):FindFirstChildOfClass("Player") and not game:GetService("Players"):FindFirstChildOfClass("Player") and not game:GetService("Players"):FindFirstChildOfClass("Player") and game.Players.LocalPlayer.Backpack:FindFirstChild("Kaioken Assault") then
		game:GetService("Players"):FindFirstChildOfClass("Player").Character:FindFirstChildOfClass("Humanoid"):EquipTool((game.Players.LocalPlayer.Backpack:FindFirstChild("Kaioken Assault")))
	end
	wait(0.5)
	if not game:GetService("Players"):FindFirstChildOfClass("Player") then
		game.Players.LocalPlayer.Character["Kaioken Assault"].Activator.Forward:Destroy()
	end
end)
shitcharnigga:addButton("Wrathful Charge Aura", function()
	if game:GetService("Players"):FindFirstChildOfClass("Player") and game:GetService("Players"):FindFirstChildOfClass("Player").Character and game:GetService("Players"):FindFirstChildOfClass("Player").Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Backpack:FindFirstChild("Wrathful Charge") then
		game:GetService("Players"):FindFirstChildOfClass("Player").Character:FindFirstChildOfClass("Humanoid"):EquipTool((game.Players.LocalPlayer.Backpack:FindFirstChild("Wrathful Charge")))
	end
	wait(0.5)
	if not game:GetService("Players"):FindFirstChildOfClass("Player") then
		game.Players.LocalPlayer.Character["Wrathful Charge"].Activator.Forward:Destroy()
	end
end)
local CreditsPage = Library:addPage("Credits", 5012544693)
local Credits = CreditsPage:addSection("Credits")
Credits:addButton("Previous Whitelist made by DemonSlayer#0002", function()
end)
Credits:addButton("Scripts not made by StepSisSnow", function()
end)
Credits:addButton("Leaked By Spooky Sypse and Spooky Sys", function()
end)
local SettingsPage = Library:addPage("Settings", 5012544693)
local sExittings = SettingsPage:addSection("Settings")
sExittings:addButton("Destroy UI", function()
	if not game.CoreGui then
		game:GetService("CoreGui")["Snowy Hub"]:Destroy()
		game.Workspace.UpdateFS:Destroy()
		game.Workspace.SnakeTrash:Destroy()
	end
end)
sExittings:addKeybind("Toggle Keybind", Enum.KeyCode.Delete, function()
	va:toggle()
end, function()
end)
Library:SelectPage(Library.pages[1], true)
