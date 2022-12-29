-- Simple Localization with Metatables

-- This snippet shows a very easy way to create localization tables for your addons.

-- Thanks to Tekkub for this trick.

-- Snippet

-- Declare this near the top of your addon
local L = setmetatable({}, {__index=function(t,i) return i end})

-- Then for english use the english statement in the usage, like this:
tooltip:SetText( L["Click here to see something"] )

-- Later when you want to add a locale, change the declaration of L to include the new language in the base table
local L = setmetatable(GetLocale() == "koKR" and {
   ["Click here to see something"] = "something in korean",
} or {}, {__index=function(t,i) return i end})
