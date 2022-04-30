--[[

	Raycasting Edition

]]


--- Customization ---
useRayCasting = false
--- Speed Values ---
speed = .2
ascendSpeed = .1
turnSpeed = 5



local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()

local runservice = game:GetService("RunService")
local uis = game:GetService("UserInputService")

local tool = Instance.new("Tool",plr.Backpack)
tool.Name = "Adaptive"
tool.RequiresHandle = false
w,a,s,d,up,down = false,false,false,false,false,false
dead = false

enabled = false

plr.Character.Humanoid.Died:Connect(function()
	dead = true
end)

tool.Activated:Connect(function()
	local root = plr.Character.HumanoidRootPart
	if enabled then
		wld:Destroy()
		part:Destroy()
		plat:Destroy()
		filterList = {}
		enabled = false
	else
		if mouse.Target.Anchored == true then return end
	

	part = Instance.new("Part",workspace)
	-- pv = Instance.new("BodyVelocity")
	-- pv.Velocity = Vector3.new(0,0,0)
	-- pv.MaxForce = Vector3.new(0,math.huge,0)
	-- pv.P = 9000
	-- pv.Parent = plr.Character.HumanoidRootPart
	wld = Instance.new("WeldConstraint",part)
	part.Anchored = false
	part.CFrame = root.CFrame
	part.CanCollide = false
	part.Transparency = 1
	plat = part:Clone()
	plat.Parent = workspace
	plat.CanCollide = false
	plat.Transparency = 1
	plat.Anchored = true
	plat.Size = Vector3.new(4,1,4)

	wld.Part0 = mouse.Target
	wld.Part1 = part
	task.wait(.1)
	enabled = true
end
end)


uis.InputBegan:Connect(function(input,chatting)
	if dead then return end
	if input.KeyCode == Enum.KeyCode.W and not chatting then
		w = true
	elseif input.KeyCode == Enum.KeyCode.S and not chatting then
		s = true
	elseif input.KeyCode == Enum.KeyCode.A and not chatting then
		a = true
	elseif input.KeyCode == Enum.KeyCode.D and not chatting then
		d = true
	elseif input.KeyCode == Enum.KeyCode.E and not chatting then
	up = true
	elseif input.KeyCode == Enum.KeyCode.Q and not chatting then
		down = true
	end
end)

uis.InputEnded:Connect(function(input,chatting)
	if dead then return end
	if input.KeyCode == Enum.KeyCode.W and not chatting then
		w = false
	elseif input.KeyCode == Enum.KeyCode.S and not chatting then
		s = false
	elseif input.KeyCode == Enum.KeyCode.A and not chatting then
		a = false
	elseif input.KeyCode == Enum.KeyCode.D and not chatting then
		d = false
	elseif input.KeyCode == Enum.KeyCode.E and not chatting then
		up = false
		elseif input.KeyCode == Enum.KeyCode.Q and not chatting then
			down = false
	end
end)



runservice.RenderStepped:Connect(function()
	if dead then return end
	if enabled then
		local root = plr.Character.HumanoidRootPart
		
		plr.Character:SetPrimaryPartCFrame(part.CFrame)
		plat.CFrame = root.CFrame - Vector3.new(0,2.1,0)

		if w then
			wld.Enabled = false
			part.CFrame = part.CFrame * CFrame.new(0,0,speed*-1)
			wld.Enabled = true
		end
		if s then
			wld.Enabled = false
			part.CFrame = part.CFrame * CFrame.new(0,0,speed)
			wld.Enabled = true
		end
		if a then
			wld.Enabled = false
			part.CFrame = part.CFrame * CFrame.Angles(0,math.rad(turnSpeed),0)
			wld.Enabled = true
		end
		if d then
			wld.Enabled = false
			part.CFrame = part.CFrame * CFrame.Angles(0,math.rad(turnSpeed*-1),0)
			wld.Enabled = true
		end
		if down then
			part.Position = part.Position + Vector3.new(0,ascendSpeed*-1,0)
		end
		if up then
			part.Position = part.Position + Vector3.new(0,ascendSpeed,0)
		end

		if useRayCasting then
		filterList = {}

		local raycastParams = RaycastParams.new()
		raycastParams.FilterDescendantsInstances = {plr.Character,plat,part,filterList}
		raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
		local raycastResult = workspace:Raycast(plr.Character.HumanoidRootPart.Position, Vector3.new(0,-100,0), raycastParams)
	 
		if raycastResult and not down and not up then
			local hit = raycastResult.Instance

			if raycastResult.Instance.Transparency >= 0.5 then
				table.insert(filterList,raycastResult.Instance)
				elseif hit.CanCollide == false then
				table.insert(filterList,raycastResult.Instance)
			end
			hitpos = raycastResult.Position
			part.Position = Vector3.new(part.Position.X,hitpos.Y + 2.3,part.Position.Z)

		end
	end
	end
end)
