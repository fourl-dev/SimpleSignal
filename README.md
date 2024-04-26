# SimpleSignal

Very simple signal module I made, similar to a bindable event.

## Methods

```
Signal.new()
```
Creates a new signal object.
With that signal object you can do various things, connect it to a function, fire it, and wait until it is fired.

```
local Signal = Signal.new()

local connection = Signal:Connect(function()
	print("fired")
end)
```

You can fire a signal object too with arguments.

```
local Signal = Signal.new()

local connection = Signal:Connect(function(h)
	print(h)
end)

Signal:Fire("h")
```

You can also disconnect all functions connected to the Signal object.

```lua
local Signal = Signal.new()

local connection = Signal:Connect(function(h)
	print(h)
end)

Signal:DisconnectAll()
```

There is also a wait method, yielding the current thread until the Signal object is fired.

```
local Signal = Signal.new()

local connection = Signal:Connect(function(h)
	print(h)
end)

Signal:Wait()
```


Using the :Connect method, you can connect it to a function returning a connection object.
With this connection object you can Disconnect it.

```
local Signal = Signal.new()

local connection = Signal:Connect(function()
	print("fired")
end)

connection:Disconnect()
```
