-- t: a runtime typechecker for roblox

local t = {}

function t.type(type_name)
	return function(value)
		local value_type = type(value)
		if value_type == type_name then
			return true
		else
			return false, string.format("%s expected, got %s", type_name, value_type)
		end
	end
end

function t.typeof(type_name)
	return function(value)
		local value_type = typeof(value)
		if value_type == type_name then
			return true
		else
			return false, string.format("%s expected, got %s", type_name, value_type)
		end
	end
end

--[=[
	matches any type except nil

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
function t.any(value)
	if value ~= nil then
		return true
	else
		return false, "any expected, got nil"
	end
end

--// lua primitives

--[=[
	ensures lua primitive boolean type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.boolean = t.typeof("boolean")

--[=[
	ensures lua primitive buffer type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.buffer = t.typeof("buffer")

--[=[
	ensures lua primitive thread type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.thread = t.typeof("thread")

--[=[
	ensures lua primitive callback type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.callback = t.typeof("function")
t["function"] = t.callback

--[=[
	ensures lua primitive none type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.none = t.typeof("nil")
t["nil"] = t.none

--[=[
	ensures lua primitive string type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.string = t.typeof("string")

--[=[
	ensures lua primitive table type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.table = t.typeof("table")

--[=[
	ensures lua primitive userdata type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.userdata = t.type("userdata")

--[=[
	ensures lua primitive vector type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.vector = t.type("vector")

--[=[
	ensures value is a number and non-NaN

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
function t.number(value)
	local value_type = typeof(value)
	if value_type == "number" then
		if value == value then
			return true
		else
			return false, "unexpected NaN value"
		end
	else
		return false, string.format("number expected, got %s", value_type)
	end
end

--[=[
	ensures value is NaN (not a number)

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
function t.nan(value)
	local value_type = typeof(value)
	if value_type == "number" then
		if value ~= value then
			return true
		else
			return false, "unexpected non-NaN value"
		end
	else
		return false, string.format("number expected, got %s", value_type)
	end
end

--// roblox types

--[=[
	ensures roblox Axes type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Axes = t.typeof("Axes")

--[=[
	ensures roblox BrickColor type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.BrickColor = t.typeof("BrickColor")

--[=[
	ensures roblox CatalogSearchParams type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.CatalogSearchParams = t.typeof("CatalogSearchParams")

--[=[
	ensures roblox CFrame type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.CFrame = t.typeof("CFrame")

--[=[
	ensures roblox Color3 type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Color3 = t.typeof("Color3")

--[=[
	ensures roblox ColorSequence type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.ColorSequence = t.typeof("ColorSequence")

--[=[
	ensures roblox ColorSequenceKeypoint type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.ColorSequenceKeypoint = t.typeof("ColorSequenceKeypoint")

--[=[
	ensures roblox DateTime type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.DateTime = t.typeof("DateTime")

--[=[
	ensures roblox DockWidgetPluginGuiInfo type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.DockWidgetPluginGuiInfo = t.typeof("DockWidgetPluginGuiInfo")

--[=[
	ensures roblox Enum type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Enum = t.typeof("Enum")

--[=[
	ensures roblox EnumItem type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.EnumItem = t.typeof("EnumItem")

--[=[
	ensures roblox Enums type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Enums = t.typeof("Enums")

--[=[
	ensures roblox Faces type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Faces = t.typeof("Faces")

--[=[
	ensures roblox FloatCurveKey type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.FloatCurveKey = t.typeof("FloatCurveKey")

--[=[
	ensures roblox Font type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Font = t.typeof("Font")

--[=[
	ensures roblox Instance type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Instance = t.typeof("Instance")

--[=[
	ensures roblox NumberRange type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.NumberRange = t.typeof("NumberRange")

--[=[
	ensures roblox NumberSequence type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.NumberSequence = t.typeof("NumberSequence")

--[=[
	ensures roblox NumberSequenceKeypoint type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.NumberSequenceKeypoint = t.typeof("NumberSequenceKeypoint")

--[=[
	ensures roblox OverlapParams type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.OverlapParams = t.typeof("OverlapParams")

--[=[
	ensures roblox PathWaypoint type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.PathWaypoint = t.typeof("PathWaypoint")

--[=[
	ensures roblox PhysicalProperties type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.PhysicalProperties = t.typeof("PhysicalProperties")

--[=[
	ensures roblox Random type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Random = t.typeof("Random")

--[=[
	ensures roblox Ray type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Ray = t.typeof("Ray")

--[=[
	ensures roblox RaycastParams type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.RaycastParams = t.typeof("RaycastParams")

--[=[
	ensures roblox RaycastResult type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.RaycastResult = t.typeof("RaycastResult")

--[=[
	ensures roblox RBXScriptConnection type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.RBXScriptConnection = t.typeof("RBXScriptConnection")

--[=[
	ensures roblox RBXScriptSignal type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.RBXScriptSignal = t.typeof("RBXScriptSignal")

--[=[
	ensures roblox Rect type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Rect = t.typeof("Rect")

--[=[
	ensures roblox Region3 type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Region3 = t.typeof("Region3")

--[=[
	ensures roblox Region3int16 type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Region3int16 = t.typeof("Region3int16")

--[=[
	ensures roblox TweenInfo type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.TweenInfo = t.typeof("TweenInfo")

--[=[
	ensures roblox UDim type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.UDim = t.typeof("UDim")

--[=[
	ensures roblox UDim2 type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.UDim2 = t.typeof("UDim2")

--[=[
	ensures roblox Vector2 type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Vector2 = t.typeof("Vector2")

--[=[
	ensures roblox Vector2int16 type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Vector2int16 = t.typeof("Vector2int16")

--[=[
	ensures roblox Vector3 type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Vector3 = t.typeof("Vector3")

--[=[
	ensures roblox Vector3int16 type

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
t.Vector3int16 = t.typeof("Vector3int16")

--[=[
	ensures value is any of the given literal values

	@param literals The literals to check against

	@return A function that will return true if the condition is passed
]=]
function t.literal_list(literals)
	-- optimization for primitive types
	local set = {}
	for _, literal in ipairs(literals) do
		set[literal] = true
	end
	return function(value)
		if set[value] then
			return true
		end
		for _, literal in ipairs(literals) do
			if literal == value then
				return true
			end
		end

		return false, "bad type for literal list"
	end
end

--[=[
	ensures value is a given literal value

	@param literal The literal to use

	@return A function that will return true iff the condition is passed
]=]
function t.literal(...)
	local size = select("#", ...)
	if size == 1 then
		local literal = ...
		return function(value)
			if value ~= literal then
				return false, string.format("expected %s, got %s", tostring(literal), tostring(value))
			end

			return true
		end
	else
		local literals = {}
		for i = 1, size do
			local value = select(i, ...)
			literals[i] = t.literal(value)
		end

		return t.union_list(literals)
	end
end

--[=[
	Returns a t.union of each key in the table as a t.literal

	@param keyTable The table to get keys from

	@return true iff the condition is satisfied, false otherwise
]=]
function t.keyof(key_table)
	local keys = {}
	local length = 0
	for key in pairs(key_table) do
		length = length + 1
		keys[length] = key
	end

	return t.literal(table.unpack(keys, 1, length))
end

--[=[
	Returns a t.union of each value in the table as a t.literal

	@param value_table The table to get values from

	@return true iff the condition is satisfied, false otherwise
]=]
function t.valueof(value_table)
	local values = {}
	local length = 0
	for _, value in pairs(value_table) do
		length = length + 1
		values[length] = value
	end

	return t.literal(table.unpack(values, 1, length))
end

--[=[
	ensures value is an integer

	@param value The value to check against

	@return true iff the condition is satisfied, false otherwise
]=]
function t.integer(value)
	local success, err_msg = t.number(value)
	if not success then
		return false, err_msg or ""
	end

	if value % 1 == 0 then
		return true
	else
		return false, string.format("integer expected, got %s", value)
	end
end

--[=[
	ensures value is a number where min <= value

	@param min The minimum to use

	@return A function that will return true iff the condition is passed
]=]
function t.number_min(min)
	return function(value)
		local success, err_msg = t.number(value)
		if not success then
			return false, err_msg or ""
		end

		if value >= min then
			return true
		else
			return false, string.format("number >= %s expected, got %s", min, value)
		end
	end
end

--[=[
	ensures value is a number where value <= max

	@param max The maximum to use

	@return A function that will return true iff the condition is passed
]=]
function t.number_max(max)
	return function(value)
		local success, err_msg = t.number(value)
		if not success then
			return false, err_msg
		end

		if value <= max then
			return true
		else
			return false, string.format("number <= %s expected, got %s", max, value)
		end
	end
end

--[=[
	ensures value is a number where min < value

	@param min The minimum to use

	@return A function that will return true iff the condition is passed
]=]
function t.number_min_exclusive(min)
	return function(value)
		local success, err_msg = t.number(value)
		if not success then
			return false, err_msg or ""
		end

		if min < value then
			return true
		else
			return false, string.format("number > %s expected, got %s", min, value)
		end
	end
end

--[=[
	ensures value is a number where value < max

	@param max The maximum to use

	@return A function that will return true iff the condition is passed
]=]
function t.number_max_exclusive(max)
	return function(value)
		local success, err_msg = t.number(value)
		if not success then
			return false, err_msg or ""
		end

		if value < max then
			return true
		else
			return false, string.format("number < %s expected, got %s", max, value)
		end
	end
end

--[=[
	ensures value is a number where value > 0

	@return A function that will return true iff the condition is passed
]=]
t.positive_number = t.number_min_exclusive(0)

--[=[
	ensures value is a number where value < 0

	@return A function that will return true iff the condition is passed
]=]
t.negative_number = t.number_max_exclusive(0)

--[=[
	ensures value is a number where min <= value <= max

	@param min The minimum to use
	@param max The maximum to use

	@return A function that will return true iff the condition is passed
]=]
function t.number_constrained(min, max)
	assert(t.number(min))
	assert(t.number(max))
	local min_check = t.number_min(min)
	local max_check = t.number_max(max)

	return function(value)
		local min_success, min_err_msg = min_check(value)
		if not min_success then
			return false, min_err_msg or ""
		end

		local max_success, max_err_msg = max_check(value)
		if not max_success then
			return false, max_err_msg or ""
		end

		return true
	end
end

--[=[
	ensures value is a number where min < value < max

	@param min The minimum to use
	@param max The maximum to use

	@return A function that will return true iff the condition is passed
]=]
function t.number_constrained_exclusive(min, max)
	assert(t.number(min))
	assert(t.number(max))
	local min_check = t.number_min_exclusive(min)
	local max_check = t.number_max_exclusive(max)

	return function(value)
		local min_success, min_err_msg = min_check(value)
		if not min_success then
			return false, min_err_msg or ""
		end

		local max_success, max_err_msg = max_check(value)
		if not max_success then
			return false, max_err_msg or ""
		end

		return true
	end
end

--[=[
	ensures value matches string pattern

	@param string pattern to check against

	@return A function that will return true iff the condition is passed
]=]
function t.match(pattern)
	assert(t.string(pattern))
	return function(value)
		local stringSuccess, stringErrMsg = t.string(value)
		if not stringSuccess then
			return false, stringErrMsg
		end

		if string.match(value, pattern) == nil then
			return false, string.format("%q failed to match pattern %q", value, pattern)
		end

		return true
	end
end

--[=[
	ensures value is either nil or passes check

	@param check The check to use

	@return A function that will return true iff the condition is passed
]=]
function t.optional(check)
	assert(t.callback(check))
	return function(value)
		if value == nil then
			return true
		end

		local success, err_msg = check(value)
		if success then
			return true
		else
			return false, string.format("(optional) %s", err_msg or "")
		end
	end
end

--[=[
	matches given tuple against tuple type definition

	@param ... The type definition for the tuples

	@return A function that will return true iff the condition is passed
]=]
function t.tuple(...)
	local checks = { ... }
	return function(...)
		local args = { ... }
		for i, check in ipairs(checks) do
			local success, err_msg = check(args[i])
			if success == false then
				return false, string.format("Bad tuple index #%s:\n\t%s", i, err_msg or "")
			end
		end

		return true
	end
end

--[=[
	ensures all keys in given table pass check

	@param check The function to use to check the keys

	@return A function that will return true iff the condition is passed
]=]
function t.keys(check)
	assert(t.callback(check))
	return function(value)
		local table_success, table_err_msg = t.table(value)
		if table_success == false then
			return false, table_err_msg or ""
		end

		for key in pairs(value) do
			local success, err_msg = check(key)
			if success == false then
				return false, string.format("bad key %s:\n\t%s", tostring(key), err_msg or "")
			end
		end

		return true
	end
end

--[=[
	ensures all values in given table pass check

	@param check The function to use to check the values

	@return A function that will return true iff the condition is passed
]=]
function t.values(check)
	assert(t.callback(check))
	return function(value)
		local table_success, table_err_msg = t.table(value)
		if table_success == false then
			return false, table_err_msg or ""
		end

		for key, val in pairs(value) do
			local success, err_msg = check(val)
			if success == false then
				return false, string.format("bad value for key %s:\n\t%s", tostring(key), err_msg or "")
			end
		end

		return true
	end
end

--[=[
	ensures value is a table and all keys pass keyCheck and all values pass value_check

	@param key_check The function to use to check the keys
	@param value_check The function to use to check the values

	@return A function that will return true iff the condition is passed
]=]
function t.map(key_check, value_check)
	assert(t.callback(key_check))
	assert(t.callback(value_check))
	local key_checker = t.keys(key_check)
	local value_checker = t.values(value_check)

	return function(value)
		local key_success, key_err = key_checker(value)
		if not key_success then
			return false, key_err or ""
		end

		local value_success, value_err = value_checker(value)
		if not value_success then
			return false, value_err or ""
		end

		return true
	end
end

--[=[
	ensures value is a table and all keys pass value_check and all values are true

	@param value_check The function to use to check the values

	@return A function that will return true iff the condition is passed
]=]
function t.set(value_check)
	return t.map(value_check, t.literal(true))
end

do
	local array_keys_check = t.keys(t.integer)
	--[=[
		ensures value is an array and all values of the array match check

		check The check to compare all values with

		@return A function that will return true iff the condition is passed
	]=]
	function t.array(check)
		assert(t.callback(check))
		local values_check = t.values(check)

		return function(value)
			local key_success, key_err_msg = array_keys_check(value)
			if key_success == false then
				return false, string.format("[array] %s", key_err_msg or "")
			end

			-- # is unreliable for sparse arrays
			-- Count upwards using ipairs to avoid false positives from the behavior of #
			local array_size = 0

			for _ in ipairs(value) do
				array_size = array_size + 1
			end

			for key in pairs(value) do
				if key < 1 or key > array_size then
					return false, string.format("[array] key %s must be sequential", tostring(key))
				end
			end

			local value_success, value_err_msg = values_check(value)
			if not value_success then
				return false, string.format("[array] %s", value_err_msg or "")
			end

			return true
		end
	end

	--[=[
		ensures value is an array of a strict makeup and size

		check The check to compare all values with

		@return A function that will return true iff the condition is passed
	]=]
	function t.strict_array(...)
		local value_types = { ... }
		assert(t.array(t.callback)(value_types))

		return function(value)
			local key_success, key_err_msg = array_keys_check(value)
			if key_success == false then
				return false, string.format("[strict_array] %s", key_err_msg or "")
			end

			-- If there's more than the set array size, disallow
			if #value_types < #value then
				return false, string.format("[strict_array] Array size exceeds limit of %d", #value_types)
			end

			for idx, type_fn in pairs(value_types) do
				local type_success, type_err_msg = type_fn(value[idx])
				if not type_success then
					return false, string.format("[strict_array] Array index #%d - %s", idx, type_err_msg)
				end
			end

			return true
		end
	end
end

do
	local callback_array = t.array(t.callback)
	--[=[
		creates a union type

		checks The checks to union

		@return A function that will return true iff the condition is passed
	]=]
	function t.union_list(checks)
		assert(callback_array(checks))

		return function(value)
			for _, check in ipairs(checks) do
				if check(value) then
					return true
				end
			end

			return false, "bad type for union"
		end
	end

	--[=[
		creates a union type

		... The checks to union

		@return A function that will return true iff the condition is passed
	]=]
	function t.union(...)
		return t.union_list({ ... })
	end

	--[=[
		Alias for t.union
	]=]
	t.some = t.union

	--[=[
		creates an intersection type

		checks The checks to intersect

		@return A function that will return true iff the condition is passed
	]=]
	function t.intersection_list(checks)
		assert(callback_array(checks))

		return function(value)
			for _, check in ipairs(checks) do
				local success, err_msg = check(value)
				if not success then
					return false, err_msg or ""
				end
			end

			return true
		end
	end

	--[=[
		creates an intersection type

		... The checks to intersect

		@return A function that will return true iff the condition is passed
	]=]
	function t.intersection(...)
		return t.intersection_list({ ... })
	end

--[=[
		Alias for t.intersection
	]=]
	t.every = t.intersection
end

do
	local check_interface = t.map(t.any, t.callback)
	
	--[=[
		ensures value matches given interface definition

		check_table The interface definition

		@return A function that will return true iff the condition is passed
	]=]
	function t.interface(check_table)
		assert(check_interface(check_table))
		return function(value)
			local table_success, table_err_msg = t.table(value)
			if table_success == false then
				return false, table_err_msg or ""
			end

			for key, check in pairs(check_table) do
				local success, err_msg = check(value[key])
				if success == false then
					return false, string.format("[interface] bad value for %s:\n\t%s", tostring(key), err_msg or "")
				end
			end

			return true
		end
	end

	--[=[
		ensures value matches given interface definition strictly

		check_table The interface definition

		@return A function that will return true iff the condition is passed
	]=]
	function t.strict_interface(check_table)
		assert(check_interface(check_table))
		return function(value)
			local table_success, table_err_msg = t.table(value)
			if table_success == false then
				return false, table_err_msg or ""
			end

			for key, check in pairs(check_table) do
				local success, err_msg = check(value[key])
				if success == false then
					return false, string.format("[interface] bad value for %s:\n\t%s", tostring(key), err_msg or "")
				end
			end

			for key in pairs(value) do
				if not check_table[key] then
					return false, string.format("[interface] unexpected field %q", tostring(key))
				end
			end

			return true
		end
	end
end

--[=[
	ensure value is an Instance and its `ClassName` matches the given ClassName

	class_name The class name to check for

	@return A function that will return true iff the condition is passed
]=]
function t.instanceof(class_name, child_table)
	assert(t.string(class_name))

	local children_check
	if child_table ~= nil then
		children_check = t.children(child_table)
	end

	return function(value)
		local instance_success, instance_err_msg = t.Instance(value)
		if not instance_success then
			return false, instance_err_msg or ""
		end

		if value.ClassName ~= class_name then
			return false, string.format("%s expected, got %s", class_name, value.ClassName)
		end

		if children_check then
			local children_success, children_err_msg = children_check(value)
			if not children_success then
				return false, children_err_msg
			end
		end

		return true
	end
end

t.instance = t.instanceof

--[=[
	ensure value is an Instance and it's ClassName matches the given ClassName by an IsA comparison

	@param class_name The class name to check for

	@return A function that will return true iff the condition is passed
]=]
function t.instance_is_a(class_name, child_table)
	assert(t.string(class_name))

	local children_check
	if child_table ~= nil then
		children_check = t.children(child_table)
	end

	return function(value)
		local instance_success, instance_err_msg = t.Instance(value)
		if not instance_success then
			return false, instance_err_msg or ""
		end

		if not value:IsA(class_name) then
			return false, string.format("%s expected, got %s", class_name, value.ClassName)
		end

		if children_check then
			local children_success, children_err_msg = children_check(value)
			if not children_success then
				return false, children_err_msg
			end
		end

		return true
	end
end

--[=[
	ensures value is an enum of the correct type

	@param enum The enum to check

	@return A function that will return true iff the condition is passed
]=]
function t.enum(enum)
	assert(t.Enum(enum))
	return function(value)
		local enum_item_success, enum_item_err_msg = t.EnumItem(value)
		if not enum_item_success then
			return false, enum_item_err_msg
		end

		if value.EnumType == enum then
			return true
		else
			return false, string.format("enum of %s expected, got enum of %s", tostring(enum), tostring(value.EnumType))
		end
	end
end

do
	local check_wrap = t.tuple(t.callback, t.callback)

	--[=[
		wraps a callback in an assert with checkArgs

		@param callback The function to wrap
		@param check_args The function to use to check arguments in the assert

		@return A function that first asserts using checkArgs and then calls callback
	]=]
	function t.wrap(callback, check_args)
		assert(check_wrap(callback, check_args))
		return function(...)
			assert(check_args(...))
			return callback(...)
		end
	end
end

--[=[
	asserts a given check

	@param check The function to wrap with an assert

	@return A function that simply wraps the given check in an assert
]=]
function t.strict(check)
	return function(...)
		assert(check(...))
	end
end

do
	local check_children = t.map(t.string, t.callback)

	--[=[
		Takes a table where keys are child names and values are functions to check the children against.
		Pass an instance tree into the function.
		If at least one child passes each check, the overall check passes.

		Warning! If you pass in a tree with more than one child of the same name, this function will always return false

		@param check_table The table to check against

		@return A function that checks an instance tree
	]=]
	function t.children(check_table)
		assert(check_children(check_table))

		return function(value)
			local instance_success, instance_err_msg = t.Instance(value)
			if not instance_success then
				return false, instance_err_msg or ""
			end

			local children_by_name = {}
			for _, child in ipairs(value:GetChildren()) do
				local name = child.Name
				if check_table[name] then
					if children_by_name[name] then
						return false, string.format("Cannot process multiple children with the same name %q", name)
					end

					children_by_name[name] = child
				end
			end

			for name, check in pairs(check_table) do
				local success, err_msg = check(children_by_name[name])
				if not success then
					return false, string.format("[%s.%s] %s", value:GetFullName(), name, err_msg or "")
				end
			end

			return true
		end
	end
end

return t