--[[---------------------------------------------------------------------------------------------------------------------------
    ______                        _   __           _                 
   /_  __/__  ____ _____ ___     / | / /___  _  __(_)___  __  _______
    / / / _ \/ __ `/ __ `__ \   /  |/ / __ \| |/_/ / __ \/ / / / ___/
   / / /  __/ /_/ / / / / / /  / /|  / /_/ />  </ / /_/ / /_/ (__  ) 
  /_/  \___/\__,_/_/ /_/ /_/  /_/ |_/\____/_/|_/_/\____/\__,_/____/  

  Made by unable | Tisha

---------------------------------------------------------------------------------------------------------------------------]]--

local Tisha = {}
Tisha.__index = Tisha

-------------------------------------------------------------------------------------------------------------------------------

function Tisha.new()
  return setmetatable({
    tasks = {},
    alive = true
  }, Tisha)
end

function Tisha.cleanup(item)
  local this = typeof(item)

  if this == "RBXScriptConnection" then
    item:Disconnect()

  elseif this == "thread" then
    task.cancel(item)

  elseif this == "table" then
    for _, method in ipairs({"Destroy", "destroy", "Disconnect"}) do
      if typeof(item[method]) == "function" then
        item[method](item)
        return
      end
    end
  end
end

function Tisha:give(task, key)
  if not self.alive then return end

  if key then
    if self.tasks[key] then
      Tisha.cleanup(self.tasks[key])
    end

    self.tasks[key] = task
    return task
  end

  table.insert(self.tasks, task)
  return task
end

function Tisha:spawn(fn, ...)
  local thread = task.spawn(fn, ...)

  return self:give(thread)
end

function Tisha:remove(key)
  local task = self.tasks[key]

  if task then
    Tisha.cleanup(task)
    self.tasks[key] = nil
  end
end

function Tisha:destroy()
  if not self.alive then return end
  self.alive = false

  for key, task in pairs(self.tasks) do
    Tisha.cleanup(task)
    self.tasks[key] = nil
  end
end

-------------------------------------------------------------------------------------------------------------------------------

return Tisha

-------------------------------------------------------------------------------------------------------------------------------
