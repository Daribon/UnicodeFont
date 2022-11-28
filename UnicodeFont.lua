-- version: 1.4.2
-- code inspired by CLEARFONT BY KIRKBURN

UnicodeFontFrame = CreateFrame("Frame", "UnicodeFontFrame")

UNICODEFONT = "Interface\\AddOns\\UnicodeFont\\WarSansTT-Bliz-500.ttf"

-- Font scale - e.g. if you want all fonts at 80% scale, change '1' to '0.8'
local SCALE = 1

local function CanSetFont(object) 
	return (type(object)=="table" and object.SetFont and object.IsObjectType and not object:IsObjectType("SimpleHTML"))
end

function UnicodeFontFrame:ApplySystemFonts()
	-- Chat bubbles
	NAMEPLATE_FONT = UNICODEFONT;
	-- chat font
	if (CanSetFont(ChatFontNormal)) then ChatFontNormal:SetFont(UNICODEFONT, 14 * SCALE); end
end

UnicodeFontFrame:SetScript("OnEvent",
	function() 
		if (event == "ADDON_LOADED") then
			UnicodeFontFrame:ApplySystemFonts()
		end
	end);
	
UnicodeFontFrame:RegisterEvent("ADDON_LOADED");

UnicodeFontFrame:ApplySystemFonts()
