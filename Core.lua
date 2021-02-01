-- Define variables
ABsummoner = {}
ABsummoner.Raid = {}
ABsummoner.TriggerWord = "TRIGGER WORD DISABLED"

absummon_hakkar_time = ""
absummon_dire_maul_time = ""
absummon_songflower_time = ""
absummon_dragonslayer_time = ""
absummon_auto_promote = true
absummon_auto_invite = true
absummon_mark_summoner = true

function ABsummoner.MakeFrame()
	ABsummoner.LootFrame = {}
	ABsummoner.LootFrame = CreateFrame("frame", "ABsummonerLootFrame", UIParent)
	ABsummoner.LootFrame:SetWidth(1)
	ABsummoner.LootFrame:SetHeight(1)
	ABsummoner.LootFrame:SetMovable(true)
	ABsummoner.LootFrame:EnableMouse(true)
	ABsummoner.LootFrame:SetFrameStrata("LOW")
	--ABsummoner.LootFrame:Hide()
	ABsummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, 0)
	ABsummoner.LootFrame:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" then
			ABsummoner.LootFrame:StartMoving();
			ABsummoner.LootFrame.isMoving = true;
		end
	end)
	ABsummoner.LootFrame:SetScript("OnMouseUp", function(self, button)
		if button == "LeftButton" and ABsummoner.LootFrame.isMoving then
			ABsummoner.LootFrame:StopMovingOrSizing();
			ABsummoner.LootFrame.isMoving = false;
			ABsummon1.Settings.Left = ABsummoner.LootFrame:GetLeft()
			ABsummon1.Settings.Top = ABsummoner.LootFrame:GetTop() - GetScreenHeight()
			ABsummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ABsummon1.Settings.Left, ABsummon1.Settings.Top)
		end
	end)
	ABsummoner.LootFrame:SetScript("OnHide", function(self)
		if ( ABsummoner.LootFrame.isMoving ) then
			ABsummoner.LootFrame:StopMovingOrSizing();
			ABsummoner.LootFrame.isMoving = false;
			ABsummon1.Settings.Left = ABsummoner.LootFrame:GetLeft()
			ABsummon1.Settings.Top = ABsummoner.LootFrame:GetTop() - GetScreenHeight()
			ABsummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ABsummon1.Settings.Left, ABsummon1.Settings.Top)
		end
	end)
	ABsummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ABsummon1.Settings.Left, ABsummon1.Settings.Top)
	
	ABsummoner.LootFrame["TopGuildFrame"] = CreateFrame("frame", "LootPasserTopFrame", ABsummoner.LootFrame)
	ABsummoner.LootFrame["TopGuildFrame"]:SetWidth(100)
	ABsummoner.LootFrame["TopGuildFrame"]:SetHeight(70)
	ABsummoner.LootFrame["TopGuildFrame"]:SetPoint("TOPLEFT", ABsummoner.LootFrame, "TOPLEFT",0,0)
	ABsummoner.LootFrame["TopGuildFrame"]:SetScale(1)
	ABsummoner.LootFrame["TopGuildFrame"]:SetBackdrop( { 
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true, tileSize = 5, edgeSize = 15, insets = { left = 1, right = 1, top = 1, bottom = 1 }
		});
	ABsummoner.LootFrame["TopGuildFrame"]:SetMovable(true)
	ABsummoner.LootFrame["TopGuildFrame"]:EnableMouse(true)
		ABsummoner.LootFrame["TopGuildFrame"]:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" then
			ABsummoner.LootFrame:StartMoving();
			ABsummoner.LootFrame.isMoving = true;
		end
	end)
	ABsummoner.LootFrame["TopGuildFrame"]:SetScript("OnMouseUp", function(self, button)
		if button == "LeftButton" and ABsummoner.LootFrame.isMoving then
			ABsummoner.LootFrame:StopMovingOrSizing();
			ABsummoner.LootFrame.isMoving = false;
			ABsummon1.Settings.Left = ABsummoner.LootFrame:GetLeft()
			ABsummon1.Settings.Top = ABsummoner.LootFrame:GetTop() - GetScreenHeight()
			ABsummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ABsummon1.Settings.Left, ABsummon1.Settings.Top)
		end
	end)
	ABsummoner.LootFrame["TopGuildFrame"]:SetScript("OnHide", function(self)
		if ( ABsummoner.LootFrame.isMoving ) then
			ABsummoner.LootFrame:StopMovingOrSizing();
			ABsummoner.LootFrame.isMoving = false;
			ABsummon1.Settings.Left = ABsummoner.LootFrame:GetLeft()
			ABsummon1.Settings.Top = ABsummoner.LootFrame:GetTop() - GetScreenHeight()
			ABsummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ABsummon1.Settings.Left, ABsummon1.Settings.Top)
		end
	end)
	
	ABsummoner.LootFrame.TopGuildFrame.Button2 = CreateFrame("Button", "CRI_InvButtsaon2", ABsummoner.LootFrame.TopGuildFrame)
	ABsummoner.LootFrame.TopGuildFrame.Button2:SetPoint("TOPRIGHT",ABsummoner.LootFrame.TopGuildFrame,"TOPRIGHT",0,10)
	ABsummoner.LootFrame.TopGuildFrame.Button2:SetWidth(35)
	ABsummoner.LootFrame.TopGuildFrame.Button2:SetHeight(20)
	ABsummoner.LootFrame.TopGuildFrame.Button2:SetText("Clear")
	ABsummoner.LootFrame.TopGuildFrame.Button2:SetParent(ABsummoner.LootFrame.TopGuildFrame)
	ABsummoner.LootFrame.TopGuildFrame.Button2:SetNormalFontObject("GameFontNormal")
	ABsummoner.LootFrame.TopGuildFrame.Button2ntex = ABsummoner.LootFrame.TopGuildFrame.Button2:CreateTexture()
	ABsummoner.LootFrame.TopGuildFrame.Button2ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
	ABsummoner.LootFrame.TopGuildFrame.Button2ntex:SetTexCoord(0, 0.625, 0, 0.6875)
	ABsummoner.LootFrame.TopGuildFrame.Button2ntex:SetAllPoints()	
	ABsummoner.LootFrame.TopGuildFrame.Button2:SetNormalTexture(ABsummoner.LootFrame.TopGuildFrame.Button2ntex)
	ABsummoner.LootFrame.TopGuildFrame.Button2pdis = ABsummoner.LootFrame.TopGuildFrame.Button2:CreateTexture()
	ABsummoner.LootFrame.TopGuildFrame.Button2pdis:SetTexture("Interface/Buttons/UI-Panel-Button-Disabled")
	ABsummoner.LootFrame.TopGuildFrame.Button2pdis:SetTexCoord(0, 0.625, 0, 0.6875)
	ABsummoner.LootFrame.TopGuildFrame.Button2pdis:SetAllPoints()
	ABsummoner.LootFrame.TopGuildFrame.Button2:SetDisabledTexture(ABsummoner.LootFrame.TopGuildFrame.Button2pdis)
	ABsummoner.LootFrame.TopGuildFrame.Button2htex = ABsummoner.LootFrame.TopGuildFrame.Button2:CreateTexture()
	ABsummoner.LootFrame.TopGuildFrame.Button2htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
	ABsummoner.LootFrame.TopGuildFrame.Button2htex:SetTexCoord(0, 0.625, 0, 0.6875)
	ABsummoner.LootFrame.TopGuildFrame.Button2htex:SetAllPoints()
	ABsummoner.LootFrame.TopGuildFrame.Button2:SetHighlightTexture(ABsummoner.LootFrame.TopGuildFrame.Button2htex)
	ABsummoner.LootFrame.TopGuildFrame.Button2ptex = ABsummoner.LootFrame.TopGuildFrame.Button2:CreateTexture()
	ABsummoner.LootFrame.TopGuildFrame.Button2ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
	ABsummoner.LootFrame.TopGuildFrame.Button2ptex:SetTexCoord(0, 0.625, 0, 0.6875)
	ABsummoner.LootFrame.TopGuildFrame.Button2ptex:SetAllPoints()
	ABsummoner.LootFrame.TopGuildFrame.Button2:SetPushedTexture(ABsummoner.LootFrame.TopGuildFrame.Button2ptex)
	ABsummoner.LootFrame.TopGuildFrame.Button2:SetScript("OnClick", function(self, arg1)
		ABsummoner.whotosummon = nil
		ABsummoner.CheckRaid()
	end)
	
	
	
	for h=1, 20 do
		ABsummoner.LootFrame.TopGuildFrame[h] = {}
		ABsummoner.LootFrame.TopGuildFrame[h].Button = CreateFrame("Button", "ABmyButtonzz"..h, ABsummoner.LootFrame.TopGuildFrame, "SecureActionButtonTemplate");
		ABsummoner.LootFrame.TopGuildFrame[h].Button:SetPoint("TOPRIGHT",ABsummoner.LootFrame.TopGuildFrame,"TOPRIGHT",-10,-((h*25)-15))
		ABsummoner.LootFrame.TopGuildFrame[h].Button:SetWidth(80)
		ABsummoner.LootFrame.TopGuildFrame[h].Button:SetHeight(25)
		ABsummoner.LootFrame.TopGuildFrame[h].Button:SetText("Zyrreal")
		ABsummoner.LootFrame.TopGuildFrame[h].Button:SetNormalFontObject("GameFontNormal")
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonntex = ABsummoner.LootFrame.TopGuildFrame[h].Button:CreateTexture()
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonntex:SetTexCoord(0, 0.625, 0, 0.6875)
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonntex:SetAllPoints()	
		ABsummoner.LootFrame.TopGuildFrame[h].Button:SetNormalTexture(ABsummoner.LootFrame.TopGuildFrame[h].Buttonntex)
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonhtex = ABsummoner.LootFrame.TopGuildFrame[h].Button:CreateTexture()
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonhtex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonhtex:SetTexCoord(0, 0.625, 0, 0.6875)
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonhtex:SetAllPoints()
		ABsummoner.LootFrame.TopGuildFrame[h].Button:SetHighlightTexture(ABsummoner.LootFrame.TopGuildFrame[h].Buttonhtex)
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonptex = ABsummoner.LootFrame.TopGuildFrame[h].Button:CreateTexture()
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonptex:SetTexCoord(0, 0.625, 0, 0.6875)
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonptex:SetAllPoints()
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonpdis = ABsummoner.LootFrame.TopGuildFrame[h].Button:CreateTexture()
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonpdis:SetTexture("Interface/Buttons/UI-Panel-Button-Disabled")
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonpdis:SetTexCoord(0, 0.625, 0, 0.6875)
		ABsummoner.LootFrame.TopGuildFrame[h].Buttonpdis:SetAllPoints()
		ABsummoner.LootFrame.TopGuildFrame[h].Button:SetDisabledTexture(ABsummoner.LootFrame.TopGuildFrame[h].Buttonpdis)
		ABsummoner.LootFrame.TopGuildFrame[h].Button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		ABsummoner.LootFrame.TopGuildFrame[h].Button:SetPushedTexture(ABsummoner.LootFrame.TopGuildFrame[h].Buttonptex)
		ABsummoner.LootFrame.TopGuildFrame[h].Button:SetAttribute("type1", "macro");
		ABsummoner.LootFrame.TopGuildFrame[h].Button:SetAttribute("macrotext", "/target party1 \n/cast Ritual of Summoning")
		ABsummoner.LootFrame["TopGuildFrame"]:SetHeight(20+h*25)
		
		
		
		ABsummoner.LootFrame.TopGuildFrame[h].Time = CreateFrame("frame", "LootPasserTopFramett"..h, ABsummoner.LootFrame.TopGuildFrame)
		ABsummoner.LootFrame.TopGuildFrame[h].Time:SetWidth(50)
		ABsummoner.LootFrame.TopGuildFrame[h].Time:SetHeight(25)
		ABsummoner.LootFrame.TopGuildFrame[h].Time:SetPoint("TOPLEFT", ABsummoner.LootFrame.TopGuildFrame, "TOPRIGHT",0,-((h*25)-15))
		ABsummoner.LootFrame.TopGuildFrame[h].Time:SetBackdrop( { 
				bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
				tile = true, tileSize = 5, edgeSize = 15, insets = { left = 1, right = 1, top = 1, bottom = 1 }
			});
		ABsummoner.LootFrame.TopGuildFrame[h].Time:SetMovable(true)
		ABsummoner.LootFrame.TopGuildFrame[h].Time:EnableMouse(true)
			ABsummoner.LootFrame.TopGuildFrame[h].Time:SetScript("OnMouseDown", function(self, button)
			if button == "LeftButton" then
				ABsummoner.LootFrame:StartMoving();
				ABsummoner.LootFrame.isMoving = true;
			end
		end)
		ABsummoner.LootFrame.TopGuildFrame[h].Time:SetScript("OnMouseUp", function(self, button)
			if button == "LeftButton" and ABsummoner.LootFrame.isMoving then
				ABsummoner.LootFrame:StopMovingOrSizing();
				ABsummoner.LootFrame.isMoving = false;
				ABsummon1.Settings.Left = ABsummoner.LootFrame:GetLeft()
				ABsummon1.Settings.Top = ABsummoner.LootFrame:GetTop() - GetScreenHeight()
				ABsummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ABsummon1.Settings.Left, ABsummon1.Settings.Top)
			end
		end)
		ABsummoner.LootFrame.TopGuildFrame[h].Time:SetScript("OnHide", function(self)
			if ( ABsummoner.LootFrame.isMoving ) then
				ABsummoner.LootFrame:StopMovingOrSizing();
				ABsummoner.LootFrame.isMoving = false;
				ABsummon1.Settings.Left = ABsummoner.LootFrame:GetLeft()
				ABsummon1.Settings.Top = ABsummoner.LootFrame:GetTop() - GetScreenHeight()
				ABsummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ABsummon1.Settings.Left, ABsummon1.Settings.Top)
			end
		end)
		ABsummoner.LootFrame.TopGuildFrame[h].Time["FS"] = ABsummoner.LootFrame.TopGuildFrame[h].Time:CreateFontString("ABLootS1TGFss"..h,"ARTWORK", "ChatFontNormal")
		ABsummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetParent(ABsummoner.LootFrame.TopGuildFrame[h].Time)
		ABsummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetPoint("TOP",ABsummoner.LootFrame.TopGuildFrame[h].Time,"TOP",0,0)
		ABsummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetWidth(150)
		ABsummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetHeight(25)
		ABsummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetJustifyH("CENTER")
		ABsummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetFontObject("GameFontNormalSmall")
		ABsummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetText("time")
		
	end

end
function ABsummoner.CheckRange()
	for AAPC_index2,AAPC_value2 in pairs(ABsummoner.whotosummon) do
		if (IsSpellInRange("Unending Breath", AAPC_index2) == 1) then
			ABsummoner.whotosummon[AAPC_index2] = nil
		end
	end
	local sddssd = 0
	for AAPC_index2,AAPC_value2 in pairs(ABsummoner.whotosummon) do
		sddssd = 1
		break
	end
	if (sddssd == 0) then
		ABsummoner.whotosummon = nil
	end
end
function ABsummoner.CheckRaid()
	for h=1, 20 do
		ABsummoner.LootFrame.TopGuildFrame[h].Button:Hide()
		ABsummoner.LootFrame.TopGuildFrame[h].Time:Hide()
		ABsummoner.LootFrame.TopGuildFrame[h].Button:Enable()
	end
	ABsummoner.LootFrame.TopGuildFrame.Button2:Enable()
	if (ABsummoner.whotosummon) then
		local derpz = 0
		for AAPC_Name,AAPC_Lootz in ABsummoner.pairsByKeys(ABsummoner.whotosummon) do
			derpz = derpz + 1
			ABsummoner.LootFrame.TopGuildFrame[derpz].Button:SetText(AAPC_Name)
			ABsummoner.LootFrame.TopGuildFrame[derpz].Button:Show()
			ABsummoner.LootFrame.TopGuildFrame[derpz].Time["FS"]:SetText(string.format(SecondsToTime(AAPC_Lootz)))
			local strwd = ABsummoner.LootFrame.TopGuildFrame[derpz].Time["FS"]:GetStringWidth()
			ABsummoner.LootFrame.TopGuildFrame[derpz].Time:SetWidth(strwd+10)
			ABsummoner.LootFrame.TopGuildFrame[derpz].Time:Show()
			ABsummoner.LootFrame.TopGuildFrame[derpz].Button:SetAttribute("type1", "macro");

			ABsummoner.LootFrame.TopGuildFrame[derpz].Button:SetAttribute("macrotext", "/target "..AAPC_Name..' \n/cast Ritual of Summoning')
			
		end
		ABsummoner.LootFrame["TopGuildFrame"]:SetHeight(20+derpz*25)
		ABsummoner.LootFrame:Show()
	else
		ABsummoner.LootFrame:Hide()
	end
end
function ABsummoner.pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
     end
     return iter
end
ABsummoner.EventFrame = CreateFrame("Frame")
ABsummoner.EventFrame:RegisterEvent ("ADDON_LOADED")
ABsummoner.EventFrame:RegisterEvent ("CHAT_MSG_PARTY")
ABsummoner.EventFrame:RegisterEvent ("CHAT_MSG_PARTY_LEADER")
ABsummoner.EventFrame:RegisterEvent ("CHAT_MSG_RAID")
ABsummoner.EventFrame:RegisterEvent ("CHAT_MSG_RAID_LEADER")
ABsummoner.EventFrame:RegisterEvent ("CHAT_MSG_GUILD")
ABsummoner.EventFrame:RegisterEvent ("CHAT_MSG_WHISPER")
ABsummoner.EventFrame:RegisterEvent ("UNIT_SPELLCAST_START")
 
ABsummoner.EventFrame:SetScript("OnEvent", function(self, event, ...)
	if (event=="ADDON_LOADED") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		if (arg1 == "Applebandit_Buff_Summons") then
			local playerClass, englishClass = UnitClass("player")
			if (playerClass ~= "Warlock") then
				return
			end
			if (not ABsummon1) then
				ABsummon1 = {}
			end
			if (not ABsummon1.Settings) then
				ABsummon1.Settings = {}
				ABsummon1.Settings.Left = 300
				ABsummon1.Settings.Top = -200
			end
			ABsummoner.Timer = ABsummoner.EventFrame:CreateAnimationGroup()
			ABsummoner.Timer.anim = ABsummoner.Timer:CreateAnimation()
			ABsummoner.Timer.anim:SetDuration(1)
			ABsummoner.Timer:SetLooping("REPEAT")
			ABsummoner.Timer:SetScript("OnLoop", function(self, event, ...)
				if (ABsummoner.whotosummon) then
					for AAPC_index2,AAPC_value2 in pairs(ABsummoner.whotosummon) do
						ABsummoner.whotosummon[AAPC_index2] = AAPC_value2 + 1
					end
					if (InCombatLockdown()) then
						for h=1, 20 do
							ABsummoner.LootFrame.TopGuildFrame[h].Button:Disable()
						end
						ABsummoner.LootFrame.TopGuildFrame.Button2:Disable()
					else
						ABsummoner.CheckRange()
						ABsummoner.CheckRaid()
					end
				else
					if (InCombatLockdown()) then
						for h=1, 20 do
							ABsummoner.LootFrame.TopGuildFrame[h].Button:Disable()
						end
						ABsummoner.LootFrame.TopGuildFrame.Button2:Disable()
					else
						ABsummoner.CheckRaid()
						ABsummoner.Timer:Stop()
					end
				end
			end)
			ABsummoner.MakeFrame()
			ABsummoner.CheckRaid()
		end
		
	elseif (event=="CHAT_MSG_RAID_LEADER" or event=="CHAT_MSG_RAID" or event=="CHAT_MSG_PARTY" or event=="CHAT_MSG_PARTY_LEADER" or event=="CHAT_MSG_GUILD" or event=="CHAT_MSG_WHISPER") then

		local arg1, arg2, arg3, arg4, arg5 = ...;
		
		-- Monitor chat message for summon trigger code
		if (arg1 and ABsummoner.TriggerWord[string.lower(arg1)]) then
			local playerClass, englishClass = UnitClass("player")
			if (playerClass ~= "Warlock") then
				return
			end
			local zname, zserv = strsplit("-",arg2)
			if (not ABsummoner.whotosummon) then
				ABsummoner.whotosummon = {}
			end
			
			
			-- If the player isn't in raid, get them an invite
			if UnitInRaid(playerName) == nil then
			
				-- Request an invite if you can't do it
				if summonRaidRank() == "none" then
					SendChatMessage("Please make me assist, or invite "..zname.." for summons", "RAID", nil)
				
				-- Or invite the player yourself
				else
					InviteUnit(zname)
				end
				
			end

			-- Add player to summon list
			SendChatMessage("Adding you to the summon list for "..GetZoneText(), "WHISPER", nil, zname)
			PlaySoundFile("sound/interface/ui_bnettoast.ogg")
			ABsummoner.whotosummon[zname] = 0
			ABsummoner.Timer:Play()
			
			
		-- Auto invite if whispered
		elseif event == "CHAT_MSG_WHISPER" and (string.lower(arg1) == "inv" or string.lower(arg1) == "invite") then	
			local zname, zserv = strsplit("-",arg2)
			
			if absummon_auto_invite == true then
				InviteUnit(zname)
			end
		
		-- Auto invite for clickers
		elseif (event == "CHAT_MSG_GUILD" or event=="CHAT_MSG_WHISPER") and string.lower(arg1) == "click" then	
			local zname, zserv = strsplit("-",arg2)
			
			InviteUnit(zname)
		end
		
	-- Whisper players when they are being summoned
	elseif event == "UNIT_SPELLCAST_START" then
		local unitCasting, spellGUID, spellID = ...;
		
		if unitCasting == "player" and spellID == 698 and UnitName("target") ~= nil then
			SendChatMessage("Summoning "..UnitName("target").." to "..GetZoneText(),(UnitInRaid("player") and "RAID" or "PARTY"))
			SendChatMessage("Summoning you now - if you don't receive it, let me know", "WHISPER", nil, UnitName("target"))
		end
	
	end
	
end)


-- Monitor for players who are in a different group
ABsummoner.InviteEventFrame = CreateFrame("Frame")
ABsummoner.InviteEventFrame:RegisterEvent ("CHAT_MSG_SYSTEM") 
ABsummoner.InviteEventFrame:SetScript("OnEvent", function(self, event, ...)

	local eventMsg = ...;
	
	-- Player is already in a group
	if string.find(eventMsg, string.gsub(ERR_ALREADY_IN_GROUP_S, "%%s", "%%S+")) then
		local playerName = string.match(eventMsg, string.gsub(ERR_ALREADY_IN_GROUP_S, "%%s", "(%%S+)"));
		
		-- If they are in a different group, let them know
		if UnitInRaid(playerName) == nil then
			SendChatMessage("Error: can't invite, leave group and try again", "WHISPER", nil, playerName)
			
			-- Remove them from summon list
			ABsummoner.whotosummon[playerName] = nil
			PlaySoundFile("sound/interface/igquestfailed.ogg")
		end
	end

end)
	

-- Load Ace3 libraries and define addon
Applebandit_Buff_Summons = LibStub("AceAddon-3.0"):NewAddon("Applebandit_Buff_Summons", "AceConsole-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")

-- Ace3 Configuration window GUI
local options = {
    name = "Applebandit_Buff_Summons",
    handler = Applebandit_Buff_Summons,
    type = "group",
    args = {
		buff_heading = {
			order = 1,
			width = 1,
			type = "header",
			name = "Scheduled buff times",
		},
		buff_description = {
			order = 1.25,
			type = "description",
			name = "If you're in the zone where the buff happens, these times will be included in the summon message, until the time has passed.\n\nFormat times like this: |caa91f1418:00am|caaffffff or |caa91f1415:00pm|caaffffff",
		},
		hakkar_time = {
			order = 2,
			width = 1,
			type = "input",
			name = "Heart of Hakkar buff time",
			get = "GetValue",
			set = "SetValue",
			validate = function(info, value) return summonValidateTime(value) end,
		},
		dire_maul_time = {
			order = 3,
			width = 1,
			type = "input",
			name = "Dire Maul respawn time",
			get = "GetValue",
			set = "SetValue",
			validate = function(info, value) return summonValidateTime(value) end,
		},
		songflower_time = {
			order = 4,
			width = 1,
			type = "input",
			name = "Songflower spawn time",
			get = "GetValue",
			set = "SetValue",
			validate = function(info, value) return summonValidateTime(value) end,
		},
		dragonslayer_time = {
			order = 5,
			width = 1,
			type = "input",
			name = "Dragonslayer buff time",
			get = "GetValue",
			set = "SetValue",
			validate = function(info, value) return summonValidateTime(value) end,
		},
		
		summon_status = {
			order = 10,
			type = "header",
			name = function (info)
				
				local white = "|caaffffff"
				local red = "|caaf14141"
				local green = "|caa91f141"
				local yellow = "|caaffd100"
				local channelName = ""
				
				if summonMessageChannel == "SILENT" then
					channelName = "no chat, "
				elseif summonMessageChannel == "GUILD" then
					channelName = "guild chat, "
				elseif summonMessageChannel == "RAID" then
					channelName = "raid chat, "
				end
			
				if summon_auto_message ~= nil and summon_auto_message._cancelled == nil then
					return green.."Summoning enabled: "..yellow..channelName..SummonCode
				else
					return red.."Summoning disabled: "..white.."select below to start"
				end
			end,
		},
		button_summon_guild = {
			disabled = function(info)
				if summon_auto_message ~= nil and summon_auto_message._cancelled == nil then
					return true
				end
			end,
			order = 11,
			width = 1,
			type = "execute",
			name = "Summon (guild chat)",
			desc = "Sends a message to guild chat offering summons, and repeats it every 2 mins",
			func = function (info)
				initiateSummon("guild")
				-- After 1 second, refresh GUI
				C_Timer.After(1, function()
					AceConfigRegistry:NotifyChange("Applebandit_Buff_Summons")
				end)
			end,
		},
		button_summon_raid = {
			disabled = function(info)
				if summon_auto_message ~= nil and summon_auto_message._cancelled == nil then
					return true
				end
			end,
			order = 12,
			width = 1,
			type = "execute",
			name = "Summon (raid chat)",
			desc = "Sends a message to raid chat offering summons, and repeats it every 2 mins",
			func = function (info)
				initiateSummon("raid")
				-- After 1 second, refresh GUI
				C_Timer.After(1, function()
					AceConfigRegistry:NotifyChange("Applebandit_Buff_Summons")
				end)
			end,
		},
		button_summon_silent = {
			disabled = function(info)
				if summon_auto_message ~= nil and summon_auto_message._cancelled == nil then
					return true
				end
			end,
			order = 13,
			width = 1,
			type = "execute",
			name = "Summon (no chat)",
			desc = "Enable summoning, but don't send messages to any channels",
			func = function (info)
				initiateSummon("silent")
				-- After 1 second, refresh GUI
				C_Timer.After(1, function()
					AceConfigRegistry:NotifyChange("Applebandit_Buff_Summons")
				end)
			end,
		},
		button_summon_stop = {
			disabled = function(info)
				if summon_auto_message == nil or summon_auto_message._cancelled ~= nil then
					return true
				end
			end,
			order = 14,
			width = 1,
			type = "execute",
			name = "Stop summon message",
			desc = "Stops the summon message from repeating and disables summon code",
			func = function (info)
				initiateSummon("stop")
				-- After 1 second, refresh GUI
				C_Timer.After(1, function()
					AceConfigRegistry:NotifyChange("Applebandit_Buff_Summons")
				end)
			end,
		},
		
		options_spacer = {
			order = 19.5,
			width = 3,
			type = "description",
			name = " ",
		},		
		options_heading = {
			order = 20,
			width = 1,
			type = "header",
			name = "Options and utilities",
		},
		auto_promote = {
			order = 21,
			width = 3,
			type = "toggle",
			name = "Auto promote level 20+ warlocks to raid assist",
			get = "GetValue",
			set = "SetValue",
		},
		auto_invite = {
			order = 22,
			width = 3,
			type = "toggle",
			name = "Auto invite people who whisper inv/invite",
			get = "GetValue",
			set = "SetValue",
		},
		mark_summoner = {
			order = 23,
			width = 3,
			type = "toggle",
			name = "Put a raid marker on yourself when you are summoning",
			get = "GetValue",
			set = "SetValue",
		},
		button_clean_group = {
			disabled = function(info)
				if summonRaidRank() == "none" then
					return true
				end
			end,
			order = 24,
			width = 1,
			type = "execute",
			name = "Clean raid group",
			desc = "Removes all players who are offline and below level 60",
			func = function (info)
				summonCleanGroup()
				-- After 1 second, refresh GUI
				C_Timer.After(1, function()
					AceConfigRegistry:NotifyChange("Applebandit_Buff_Summons")
				end)
			end,
		},
		button_disband_raid = {
			disabled = function(info)
				if summonRaidRank() ~= "leader" then
					return true
				end
			end,
			order = 25,
			width = 1,
			type = "execute",
			name = "Disband raid",
			desc = "Removes all players from the raid",
			func = function (info)
				summonDisbandRaid()
				-- After 1 second, refresh GUI
				C_Timer.After(1, function()
					AceConfigRegistry:NotifyChange("Applebandit_Buff_Summons")
				end)
			end,
		},
		
	}
}

-- Ace3 Methods
-- Called when the addon is loaded
function Applebandit_Buff_Summons:OnInitialize()
	-- Register the options table
    AceConfigRegistry:RegisterOptionsTable("Applebandit_Buff_Summons", options)	
end

-- Called when the addon is enabled
function Applebandit_Buff_Summons:OnEnable()
	self:Print("loaded. To open, type /summon")
	AceConfigDialog:SelectGroup("Applebandit_Buff_Summons")
	
	--Start automatic maintenance timer for auto promote/convert to raid
	summon_auto_maintenance = C_Timer.NewTicker(5, function()
		if absummon_auto_promote == true then
			summonAutoPromote()
		end
	end)
	
end

-- Get/Set variables, using info parent name in dynamic variables
function Applebandit_Buff_Summons:GetValue(info)
	return _G["absummon_"..info[#info] ]
end
function Applebandit_Buff_Summons:SetValue(info, value)
	_G["absummon_"..info[#info] ] = value
end


-- Use chat command to open the addon window
SLASH_SUMMON1 = "/summon"
SlashCmdList["SUMMON"] = function(msg)
	AceConfigDialog:SetDefaultSize("Applebandit_Buff_Summons", 390, 480)
	AceConfigDialog:Open("Applebandit_Buff_Summons")
end


-- Function to send summon message
function sendSummonMessage(messageType)
	-- Convert to a raid
	if IsInGroup() then
		ConvertToRaid()
	end
	-- After 1 second, refresh GUI
	C_Timer.After(1, function()
		AceConfigRegistry:NotifyChange("Applebandit_Buff_Summons")
	end)

	-- Set zone details and chat trigger
	if GetZoneText() == "Blackrock Mountain" then
		SummonZone = "Blackrock Mountain"
		SummonCode = "BRM"	
		SummonTime = ""
		SummonTimeMsg = ""
		SummonIconId = 7 --Cross
		
	elseif GetZoneText() == "Gates of Ahn'Qiraj" then
		SummonZone = "Gates of Ahn'Qiraj"
		SummonCode = "AQ"
		SummonTime = ""
		SummonTimeMsg = ""
		SummonIconId = 2 --Circle
		
	elseif GetZoneText() == "Eastern Plaguelands" then
		SummonZone = "Naxxramas"
		SummonCode = "NAXX"
		SummonTime = ""
		SummonTimeMsg = ""
		SummonIconId = 4 --Triangle
		
	elseif GetZoneText() == "Dire Maul" then
		SummonZone = "Dire Maul buffs"
		SummonCode = "DMT"
		SummonTime = absummon_dire_maul_time
		SummonTimeMsg = " Open until "..SummonTime.." -"
		SummonIconId = 6 --Square
		
	elseif GetZoneText() == "Felwood" then
		SummonZone = "Songflower buff"
		SummonCode = "SONG"
		SummonTime = absummon_songflower_time
		SummonTimeMsg = " Next flower at "..SummonTime.." -"
		SummonIconId = 1 --Star
		
	elseif GetZoneText() == "Mulgore" or GetZoneText() == "Elwynn Forest" then
		SummonZone = "Darkmoon Faire buff"
		SummonCode = "DMF"
		SummonTime = ""
		SummonTimeMsg = ""
		SummonIconId = 5 --Moon
		
	elseif GetZoneText() == "Orgrimmar" or GetZoneText() == "Stormwind" then
		SummonZone = "Dragonslayer buff"
		SummonCode = "DRAG"
		SummonTime = absummon_dragonslayer_time
		SummonTimeMsg = " Next buff at "..SummonTime.." -"
		SummonIconId = 8 --Skull
		
	elseif GetZoneText() == "Stranglethorn Vale" then
		SummonZone = "Heart of Hakkar buff"
		SummonCode = "HOH"
		SummonTime = absummon_hakkar_time
		SummonTimeMsg = " Next buff at "..SummonTime.." -"
		SummonIconId = 3 --Diamond
		
	else
		SummonZone = GetZoneText()
		SummonCode = GetZoneText():gsub("(%w%w%w).*","%1"):upper()
		SummonTime = ""
		SummonTimeMsg = ""
		SummonIconId = ""
	end
	
	-- Send the message
	if messageType == "start" then
		
		-- Enable the chat trigger
		if SummonZone ~= "Gates of Ahn'Qiraj" then
			ABsummoner.TriggerWord = {
				[string.lower(SummonCode)] = 1,
			}
		else
			-- Legacy support for old AQ summon code
			ABsummoner.TriggerWord = {
				[string.lower(SummonCode)] = 1,
				["gat"] = 1,
			}
		end
		
		-- Set the raid icon for message and player marker
		if SummonIconId ~= "" then
			SummonMsgIcon = "{rt"..SummonIconId.."} "
			
			if absummon_mark_summoner == true and GetRaidTargetIndex("player") ~= SummonIconId then
				SetRaidTarget("player",SummonIconId)
			end
		else
			SummonMsgIcon = ""
			SetRaidTarget("player",0) -- Clear any raid target
		end
		
		-- If clickers are needed, send a message asking
		if summonCheckClickers() > 0 and summonMessageChannel ~= "SILENT" then
			
			if summonParseTimes(SummonTime) then
				SendChatMessage("Need "..summonCheckClickers().." clicker(s) for "..SummonZone.." summons."..SummonTimeMsg.." type CLICK for group invite.", summonMessageChannel, nil, nil)
			else
				SendChatMessage("Need "..summonCheckClickers().." clicker(s) for "..SummonZone.." summons. Type CLICK for group invite.", summonMessageChannel, nil, nil)
			end

			-- Before starting a clicker recheck timer, cancel any existing ones
			if summon_recheck_clickers ~= nil then
				summon_recheck_clickers:Cancel()
			end	
			
			-- Create a new timer to check clickers every 5 seconds
			summon_recheck_clickers = C_Timer.NewTicker(5, function()
				
				if summonCheckClickers() <= 0 then
					Applebandit_Buff_Summons:Print("got enough clickers, restarting summon message")
				
					-- Report summon message immediately
					sendSummonMessage(messageType)
					
					-- Cancel existing summon message timer and restart
					if summon_auto_message ~= nil then
						summon_auto_message:Cancel()
					end
					summon_auto_message = C_Timer.NewTicker(120, function()
						sendSummonMessage(messageType)
					end)
					
					-- Cancel clicker recheck timers
					if summon_recheck_clickers ~= nil then
						summon_recheck_clickers:Cancel()
					end	
				end
			end)		
		
		-- Otherwise send summon message
		elseif summonParseTimes(SummonTime) then
			if summonMessageChannel ~= "SILENT" then
				SendChatMessage(SummonMsgIcon.."Need a summon to "..SummonZone.."?"..SummonTimeMsg.." type "..SummonCode.." for group invite/summon", summonMessageChannel, nil, nil)
			else
				Applebandit_Buff_Summons:Print("summoning in silent mode, listening for "..SummonCode)
			end
			
		else
			if summonMessageChannel ~= "SILENT" then
				SendChatMessage(SummonMsgIcon.."Need a summon to "..SummonZone.."? Type "..SummonCode.." for group invite/summon", summonMessageChannel, nil, nil)
			else
				Applebandit_Buff_Summons:Print("summoning in silent mode, listening for "..SummonCode)
			end
		end
		
	elseif messageType == "stop" then
		-- Disable the chat trigger
		ABsummoner.TriggerWord = "TRIGGER WORD DISABLED"
	end
end


-- Function to initiate summoning mode
function initiateSummon(command)

	if command == "guild" or command == "raid" or command == "silent" then
		-- Set message channel
		summonMessageChannel = string.upper(command)

		-- Report summon message immediately
		sendSummonMessage("start")
		
		-- Cancel any existing summon message timers
		if summon_auto_message ~= nil then
			summon_auto_message:Cancel()
		end
		
		-- Start a new summon message timer for every 2 mins
		if command ~= "silent" then
			Applebandit_Buff_Summons:Print("repeating summon message every 2 minutes")
		end
		
		summon_auto_message = C_Timer.NewTicker(120, function()
			sendSummonMessage("start")
		end)
		
	elseif command == "stop" then
		-- Cancel any existing summon message timers
		if summon_auto_message ~= nil and summon_auto_message._cancelled == nil then
			Applebandit_Buff_Summons:Print("stopped repeating summon message")
			summon_auto_message:Cancel()
			sendSummonMessage("stop")
		else
			Applebandit_Buff_Summons:Print("no active summon messages found")
		end
		
		-- Remove any raid target from self
		SetRaidTarget("player",0)
		
	end
	
end


-- Function to parse time and check whether it's passed
function summonParseTimes(buffTime)
	
	local validTime = false
	
	if buffTime ~= "" then
		-- Build a number string to represent current server time
		local serverHour, serverMinute = GetGameTime()
		
		if serverMinute < 10 then
			serverMinute = "0"..tostring(serverMinute)
		end
		
		local serverTimeVal = tonumber(serverHour..serverMinute)
		
		-- Build a number string to represent buff time
		local buffHour, buffMinute, buffModifier = buffTime:match("(%d+):(%d%d)(%a%a)")
		local buffTimeVal = tonumber(buffHour..buffMinute)
		
		if string.lower(buffModifier) == "pm" then
			buffTimeVal = buffTimeVal + 1200
		end
	
		-- Compare numbers to check if buff time has passed
		if buffTimeVal > serverTimeVal then
			validTime = true
		end
		
		-- print("Server time: "..serverTimeVal.." Buff time: "..buffTimeVal)
	end
	
	return validTime
end


-- Function to do basic validation on buff time entries
function summonValidateTime(buffTime)
	-- Error if time string is longer than 7 chars, or doesn't match format
	if buffTime ~= "" and (string.len(buffTime) > 7 or string.match(buffTime,"%d+:%d%d%a%a") == nil) then
		PlaySoundFile("sound/interface/igquestfailed.ogg")
		return "Invalid time, try again"
	else
		return true
	end 
end


-- Function to check if raid leader/assistant
function summonRaidRank()
	-- Check if you are raid leader or assistant 
	local myRank = "none"
	if IsInRaid() then
		for i=1,40 do
			local name, rank = GetRaidRosterInfo(i)

			if name == UnitName("player") and rank ~= 0 then
				-- You are a raid assist [1] or raid leader [2]
				if rank == 1 then
					myRank = "assist"
				elseif rank == 2 then
					myRank = "leader"
				end

				break -- stop loop
			end
		end
	end
	
	return myRank
end


-- Function to auto promote level 20+ warlocks to raid assist
function summonAutoPromote()
	-- Promote warlocks to assist
	if summonRaidRank() == "leader" then
		for i=1,40 do
			local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i)

			if class == "Warlock" and online == true then
				if UnitLevel(name) >= 20 then
					PromoteToAssistant(name)
				end
			end
		end
	end
end


-- Function to remove offline players below level 60
function summonCleanGroup()
	local cleanupCount = 0
	
	-- Remove offline players
	if summonRaidRank() == "leader" or summonRaidRank() == "assist" then
		for i=1,40 do
			local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i)
			
			if online == false then
				if UnitLevel(name) < 60 then
					UninviteUnit(name)
					cleanupCount = cleanupCount +1
				end
			end
		end
	end
	
	Applebandit_Buff_Summons:Print("removed "..cleanupCount.." players from raid")
end


-- Function to disband raid
function summonDisbandRaid()
	if summonRaidRank() == "leader" then
	
		-- Tell people the raid is being disbanded (use loop as delay hack)
		local raidMessageSent = false
		
		for i=1,GetNumGroupMembers() do
			if raidMessageSent == false then
				SendChatMessage("This raid is being disbanded", "RAID_WARNING", nil, nil)
				raidMessageSent = true
			end
		end
		
		-- Actually disband the raid
		for i=1,GetNumGroupMembers() do
			if UnitName("raid"..i) ~= UnitName("player") then
				UninviteUnit("raid"..i, "reason")
			end
		end
	end
end


-- Function to check whether people around to to help summon
function summonCheckClickers()
	local clickersNeeded = 2
	
	if IsInRaid() then
		for i=1,40 do
			local name = GetRaidRosterInfo(i)
			
			if name ~= nil and name ~= UnitName("player") and UnitInRange(name) == true and UnitIsAFK(name) == false then
				clickersNeeded = clickersNeeded - 1
			end
			
			if clickersNeeded == 0 then
				break -- stop loop
			end
		end
		
	elseif IsInGroup() then
		for i=1,4 do
			local name = UnitName('party'..i)

			if name ~= nil and name ~= UnitName("player") and UnitInRange(name) == true and UnitIsAFK(name) == false then
				clickersNeeded = clickersNeeded - 1
			end
			
			if clickersNeeded == 0 then
				break -- stop loop
			end
		end
	end

	return clickersNeeded
end


--[[
-- Use Nova world buffs database to check for songflower timers
function summonSongflower()

	-- Check the timers for songflowers near bloodvenom post
	local songflowerList = {	
		["flower5"] = {subZone = "Shatter Scar Vale"},
		["flower6"] = {subZone = "Bloodvenom Post"},
		["flower7"] = {subZone = "East of Jaedenar"}
		
		 Unused songflowers
		["flower1"] = {subZone = "North Felpaw Village"},
		["flower2"] = {subZone = "West Felpaw Village"},
		["flower3"] = {subZone = "North of Irontree Woods"},
		["flower4"] = {subZone = "Talonbranch Glade"},
		["flower8"] = {subZone = "North of Emerald Sanctuary"},
		["flower9"] = {subZone = "West of Emerald Sanctuary"},
		["flower10"] = { subZone = "South of Emerald Sanctuary"},
		
	}
	
	for k, v in pairs(songflowerList) do
		local time = (NWB.data[k] + 1500) - GetServerTime();
		if (time > 0) then
			local minutes = string.format("%02.f", math.floor(time / 60));
    		local seconds = string.format("%02.f", math.floor(time - minutes * 60));
			print(v.subZone .. " " .. minutes .. "m" .. seconds .. "s")
  		end
	end

end
]]--