local Signals = require(script.Parent.Signals)

local Signal = Signals.new()

local connection = Signal:Connect(function()
	print("fired")
end)

Signal:Fire()

Signal:DisconnectAll()

task.wait(3)

print("firing")

Signal:Fire()

Signal:Wait()
