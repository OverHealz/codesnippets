-- Check if the player is on a flying mount

-- This snippet will check if the player is currently on a flying mount. It works better (for me) then IsFlying() because that will return false if you are on a flying mount but not in the air.

-- Snippet

-- you need this frame
local f = CreateFrame('GameTooltip', 'MyTooltip', UIParent, 'GameTooltipTemplate')

function isPlayerFlying ()
	local i = 1
	local text
	local buff

	f:SetOwner(UIParent, 'ANCHOR_NONE')

	buff = UnitBuff('player', i)
	while buff do
		f:SetUnitBuff('player', i)
		text = idFlightMode_TooltipTextLeft2:GetText()

		if text:match('^Increases flight speed by.*$') then
			return true
		end

		i = i + 1
		buff = UnitBuff('player', i)
	end

	f:Hide()

	return false
end
