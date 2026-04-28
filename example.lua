-------------------------------------------------------------------------------------------------------------------------------

-- hEr
local Tisha = loadstring(game:HttpGet("https://raw.githubusercontent.com/did-i-leave-the-oven-on/Tisha/refs/heads/main/Tisha.lua"))()
local delilahJustCreatedASentientAnthropomorphicTissueBox = Tisha.new()

-------------------------------------------------------------------------------------------------------------------------------

-- storing an event connection
local part = Instance.new("Part")
partn.Name = "part"
part.Parent = workspace

local connection = part.Touched:Connect(function(hit)
	print(hit.Name .. " touched the part")
end)

delilahJustCreatedASentientAnthropomorphicTissueBox:give(connection, "touchConnection")

-------------------------------------------------------------------------------------------------------------------------------

-- spawning a repeating task
delilahJustCreatedASentientAnthropomorphicTissueBox:spawn(function()
	while true do
		print("helo")
		task.wait(1)
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

-- storing an instance with destroy
local tempPart = Instance.new("Part")
tempPart.Name = "temp"
tempPart.Parent = workspace

delilahJustCreatedASentientAnthropomorphicTissueBox:give(tempPart, "tempPart")

-------------------------------------------------------------------------------------------------------------------------------

-- removing a specific task
task.wait(5)
delilahJustCreatedASentientAnthropomorphicTissueBox:remove("touchConnection")

-------------------------------------------------------------------------------------------------------------------------------

-- clean up all remaining tasks
task.wait(1)
delilahJustCreatedASentientAnthropomorphicTissueBox:destroy()

-------------------------------------------------------------------------------------------------------------------------------
