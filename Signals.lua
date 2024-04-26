local Signals = {}

local Signal = {}
Signal.__index = Signal

local Connection = {}
Connection.__index = Connection


function Signals.new()
	local self = {
		funcs = {},
		fired = false
	}

	setmetatable(self, Signal)

	return self
end

function Signal:Connect(func)
	local index = #self.funcs + 1
	self.funcs[index] = func

	local NewConnection = {
		Signal = self,
		index = index
	}

	setmetatable(NewConnection, Connection)

	return NewConnection
end

function Signal:Fire(...)
	self.fired = true

	for k, v in pairs(self.funcs) do
		local h = ...
		coroutine.wrap(function()
			local s, e = pcall(v, h)

			if not s then
				warn(e)
			end
		end)()
	end
end

function Signal:DisconnectAll()
	table.clear(self.funcs)
end

function Signal:Wait()
	repeat task.wait() until self.fired

	self.fired = false
end

function Connection:Disconnect()
	table.remove(self.Signal.funcs, self.index)
end

return Signals
