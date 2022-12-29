-- Cache GetSpellInfo calls

-- This code caches all non-nil return values from GetSpellInfo in a table to improve performance. Add this at the start of your file (before any GSI calls)

-- Snippet

local spellcache = setmetatable({}, {__index=function(t,v) local a = {GetSpellInfo(v)} if GetSpellInfo(v) then t[v] = a end return a end})
local function GetSpellInfo(a)
	return unpack(spellcache[a])
end
