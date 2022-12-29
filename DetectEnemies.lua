-- Detect enemy units in combat log entries

-- This function will return the enemy (if any) from a combat log event.

-- Snippet

local hostile = {
  ["_DAMAGE"] = true, 
  ["_LEECH"] = true,
  ["_DRAIN"] = true,
  ["_STOLEN"] = true,
  ["_INSTAKILL"] = true,
  ["_INTERRUPT"] = true,
  ["_MISSED"] = true
}
local function GetEnemy(time, event, sguid, sname, sflags, dguid, dname, dflags)
  local suffix = event:match(".+(_.-)$")
  if hostile[suffix] then
    if bit.band(sflags, COMBATLOG_OBJECT_AFFILIATION_MASK) < 8 then
      return dguid, dname, dflags
    elseif bit.band(dflags, COMBATLOG_OBJECT_AFFILIATION_MASK) < 8 then
      return sguid, sname, sflags
    end
  end
end
