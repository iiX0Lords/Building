local Dependencies = loadstring(game:HttpGet(("https://raw.githubusercontent.com/iiX0Lords/Building/main/Dependency1"),true))()

local tc = tick()

if Dependencies == false then
    broken = true
end

local debugMode = false
local sentDepMessage = false

local SendNotif = function(text)
    local NotificationBindable = Instance.new("BindableFunction")
    game.StarterGui:SetCore("SendNotification",  {
    Title = "Project Redwood";
    Text = text;
    Icon = "";
    Duration = 5;
    Callback = NotificationBindable;
    })
end

_G.Debug = function(state)
    if state == true then
        debugMode = true
        elseif state == false then
        debugMode = false
    end
end

_G.Kill = function(playerchar)
    if debugMode == true then return end
    local args = {
        [1] = "FireOtherClients",
        [2] = "drawLaser",
        [3] = Vector3.new(0, 0, 0),
        [4] = Vector3.new(0, 0, 0), --[[Vector3]]
        [5] = {
            ["Name"] = "Head",
            ["CFrame"] = playerchar.Head.CFrame,
            ["Material"] = Enum.Material.ForceField,
            ["Parent"] = playerchar,
            ["Size"] = Vector3.new(0.001, 0.001, 0.001),
            ["Transparency"] = 1
        }
    }
  
    workspace.resources.RemoteEvent:FireServer(unpack(args))
end

_G.FE = function(part,BreakOnDeath,waittime,collsionOverwrite)
    if debugMode == true then return end
    local waittime = waittime
    local part = part
    local BreakOnDeath = BreakOnDeath

    local Players = game:GetService("Players")
    local broken = false

	local parent = part.Parent --- Gets the parent of the Instance you called

      parent.ChildRemoved:connect(function(Obj) --- When the parent of the part has a Instance removed this fires
             if Obj == part then --- If the part that was destoyed is the Part
               broken = true
           end
         end)      

    local loop = coroutine.create(function() --- Creates the loop

        while true do task.wait(waittime) --- Shorter the wait the cleaner the part will look but will cause more lag so pick your poison
                



                if broken == false then --- So if the part is destroyed stop running

                local OverwiteCollision = part.CanCollide

                if collsionOverwrite ~= nil then
                    OverwiteCollision = collsionOverwrite
                end

                --- Arguments for the part (dont edit because its already set up good enough)
                local args = {
                    [1] = "FireOtherClients",
                    [2] = "drawLaser",
                    [3] = Vector3.new(0,0,0),
                    [4] = Vector3.new(0,0,0),
                    [5] = {
                        ["CFrame"] = part.CFrame,
                        ["Material"] = part.Material,
                        ["BrickColor"] = part.BrickColor,
                        ["Reflectance"] = 0,
                        ["CanCollide"] = OverwiteCollision,
                        ["Orientation"] = part.Orientation,
			            ["Name"] = part.Name,
                        ["Shape"] = part.Shape,
                        ["Velocity"] = part.Velocity,
                        ["Size"] = part.Size,
                        ["Transparency"] = part.Transparency,
                        ["Parent"] = workspace.Terrain
                    }
                }

                workspace.resources.RemoteEvent:FireServer(unpack(args))
                    else
                        coroutine.yield()
                    break
                end
                --- If you chose to then when your player dies break the loop and destroy the parts
                if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and BreakOnDeath == true then
                    part:Destroy()
                    break
                end
            end
        end)
    coroutine.resume(loop) --- Plays the loop
end

local stations = {}

local last = 0

function stat(part)
    local args = {
        [1] = "FireOtherClients",
        [2] = "drawLaser",
        [3] = Vector3.new(0,0,0),
        [4] = Vector3.new(0,0,0),
        [5] = {
            ["TopSurface"] = "hello bro",
            ["CFrame"] = part.CFrame+Vector3.new(last,last,last),
            ["Material"] = part.Material,
            ["BrickColor"] = part.BrickColor,
            ["Reflectance"] = 0,
            ["CanCollide"] = part.CanCollide,
            ["Orientation"] = part.Orientation,
            ["Name"] = part.Name,
            ["Shape"] = part.Shape,
            ["Velocity"] = part.Velocity,
            ["Size"] = part.Size,
            ["Transparency"] = part.Transparency,
            ["Parent"] = workspace.Terrain
        }
    }

    workspace.resources.RemoteEvent:FireServer(unpack(args))
end

_G.station = function(part)
    if part:IsA("Part") then
        stat(part)
        table.insert(stations,part)
    end
end


game.Players.PlayerAdded:Connect(function(player)
    spawn(function()
        task.wait(6)
        last = last + 0.001
        for i,v in pairs(stations) do
            stat(v)
        end
    end)
end)

_G.MakePart = function(part,BreakOnDeath,waittime)
    if debugMode == true then return end
    if sentDepMessage == false then
        sentDepMessage = true
        SendNotif("This function is now deprecated use '_G.FE()'")
    end

    local waittime = waittime
    local part = part
    local BreakOnDeath = BreakOnDeath

    local Players = game:GetService("Players")
    local broken = false

	local parent = part.Parent --- Gets the parent of the Instance you called

      parent.ChildRemoved:connect(function(Obj) --- When the parent of the part has a Instance removed this fires
             if Obj == part then --- If the part that was destoyed is the Part
               broken = true
           end
         end)      

    local loop = coroutine.create(function() --- Creates the loop

        while true do task.wait(waittime) --- Shorter the wait the cleaner the part will look but will cause more lag so pick your poison
                local fakePart = part --- Just sets that variable because im to lazy to edit the fire laser arguments          
                



                if broken == false then --- So if the part is destroyed stop running
                
                --- Positioning
                local arg3 = fakePart.Position + Vector3.new(0,.1,0) --- Remote requires Point A and Point B to be different so i just made it .1 difference
                local arg4 = fakePart.Position

                --- Arguments for the part (dont edit because its already set up good enough)
                local args = {
                    [1] = "FireOtherClients",
                    [2] = "drawLaser",
                    [3] = arg3,
                    [4] = arg4, --[[Vector3]]
                    [5] = {
                        ["Material"] = fakePart.Material,
                        ["BrickColor"] = fakePart.BrickColor,
                        ["Reflectance"] = 0,
                        ["CanCollide"] = fakePart.CanCollide,
                        ["Orientation"] = fakePart.Orientation,
                        ["Shape"] = fakePart.Shape,
                        ["Velocity"] = fakePart.Velocity,
                        ["Size"] = fakePart.Size,
                        ["Transparency"] = fakePart.Transparency
                    }
                }

                workspace.resources.RemoteEvent:FireServer(unpack(args))
                    else
                    break
                end
                --- If you chose to then when your player dies break the loop and destroy the parts
                if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and BreakOnDeath == true then
                    fakePart:Destroy()
                    break
                end
            end
        end)
    coroutine.resume(loop) --- Plays the loop
end

function _G.Message(mssg)

    game.Players.LocalPlayer.PlayerGui.GUI.choiceFrame.msg.Text = mssg
    game.Players.LocalPlayer.PlayerGui.GUI.choiceFrame.Visible = true

    local args = {
        [1] = "FireOtherClients",
        [2] = "displayChoice",
        [3] = "returnToMenu",
        [4] = mssg
    }

    workspace.resources.RemoteEvent:FireServer(unpack(args))
    -- task.wait(1)
    game.Players.LocalPlayer.PlayerGui.GUI.choiceFrame.no.MouseButton1Click:Connect(function()
        game.Players.LocalPlayer.PlayerGui.GUI.choiceFrame.Visible = false
    end)
    -- game.Players.LocalPlayer.PlayerGui.GUI.choiceFrame.Visible = false
        
end

local time = tc-tick()

SendNotif("Loaded")
