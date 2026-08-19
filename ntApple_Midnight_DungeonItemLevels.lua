-- Apple's Dungeon Item Levels - Midnight Season 2 / Patch 12.1
-- Data checked against current Midnight Season 2 / Patch 12.1 gearing information.
-- Main view: Mythic+ rewards + Great Vault + current keystone.
-- Additional information: Mistcrest sources, upgrade tracks, exchanges/crafting, and addon info.

local COLORS = {
    white      = "FFFFFFFF",
    gold       = "FFFFD100",
    yellow     = "FFFFFF00",
    adventurer = "FF69B5FF",
    veteran    = "FF65D36E",
    champion   = "FFC77CFF",
    hero       = "FFFF8A3D",
    myth       = "FFFF4F5F",
    muted      = "FFB8B8B8",
    red        = "FFFF3030",
}

local function Color(text, hex)
    return "|c" .. hex .. text .. "|r"
end

local function TrackColor(track)
    if track == "Adventurer" then return COLORS.adventurer end
    if track == "Veteran" then return COLORS.veteran end
    if track == "Champion" then return COLORS.champion end
    if track == "Hero" then return COLORS.hero end
    if track == "Myth" then return COLORS.myth end
    return COLORS.white
end

local function TrackText(track, rank)
    return Color(track .. " " .. rank .. "/6", TrackColor(track))
end

local UPGRADE_TRACKS = {
    {
        name = "Adventurer",
        currencyID = 3442,
        levels = {266, 269, 272, 276, 279, 282},
    },
    {
        name = "Veteran",
        currencyID = 3443,
        levels = {279, 282, 285, 289, 292, 295},
    },
    {
        name = "Champion",
        currencyID = 3444,
        levels = {292, 295, 298, 302, 305, 308},
    },
    {
        name = "Hero",
        currencyID = 3445,
        levels = {305, 308, 311, 315, 318, 321},
    },
    {
        name = "Myth",
        currencyID = 3446,
        levels = {318, 321, 324, 328, 331, 334},
    },
}

local VENOMOUS_ABYSS_MYTH = {
    { rank = "Myth 7/6", ilvl = 337, source = "The Venomous Abyss extended Mythic item levels" },
    { rank = "Myth 8/6", ilvl = 341, source = "The Venomous Abyss extended Mythic item levels" },
    { rank = "Myth 9/6", ilvl = 344, source = "The Venomous Abyss extended Mythic item levels" },
}

local MYTHIC_PLUS = {
    [2]  = {loot = 295, lootTrack = "Champion", lootRank = 2, crest = "Champion", vault = 305, vaultTrack = "Hero", vaultRank = 1},
    [3]  = {loot = 295, lootTrack = "Champion", lootRank = 2, crest = "Champion", vault = 305, vaultTrack = "Hero", vaultRank = 1},
    [4]  = {loot = 298, lootTrack = "Champion", lootRank = 3, crest = "Hero",     vault = 308, vaultTrack = "Hero", vaultRank = 2},
    [5]  = {loot = 302, lootTrack = "Champion", lootRank = 4, crest = "Hero",     vault = 308, vaultTrack = "Hero", vaultRank = 2},
    [6]  = {loot = 305, lootTrack = "Hero",     lootRank = 1, crest = "Hero",     vault = 311, vaultTrack = "Hero", vaultRank = 3},
    [7]  = {loot = 305, lootTrack = "Hero",     lootRank = 1, crest = "Hero",     vault = 315, vaultTrack = "Hero", vaultRank = 4},
    [8]  = {loot = 308, lootTrack = "Hero",     lootRank = 2, crest = "Hero",     vault = 315, vaultTrack = "Hero", vaultRank = 4},
    [9]  = {loot = 308, lootTrack = "Hero",     lootRank = 2, crest = "Myth",     vault = 315, vaultTrack = "Hero", vaultRank = 4},
    [10] = {loot = 311, lootTrack = "Hero",     lootRank = 3, crest = "Myth",     vault = 318, vaultTrack = "Myth", vaultRank = 1},
    [11] = {loot = 311, lootTrack = "Hero",     lootRank = 3, crest = "Myth",     vault = 318, vaultTrack = "Myth", vaultRank = 1},
    [12] = {loot = 311, lootTrack = "Hero",     lootRank = 3, crest = "Myth",     vault = 318, vaultTrack = "Myth", vaultRank = 1},
}

local MISTCREST_SOURCES = {
    {
        name = "Adventurer Mistcrest",
        currencyID = 3442,
        sources = {
            "Repeatable Outdoor Events",
            "Outdoor Treasures",
            "Tier 4 Delves",
            "Normal Difficulty Prey Hunts",
        },
    },
    {
        name = "Veteran Mistcrest",
        currencyID = 3443,
        sources = {
            "Repeatable Outdoor Events",
            "Heroic Seasonal Dungeons",
            "World Difficulty Lairs",
            "Raid Finder Difficulty Raids",
            "Trovehunter's Bounty Tiers 4-5",
            "Delves Tiers 5-6",
            "Hard Difficulty Prey Hunts",
        },
    },
    {
        name = "Champion Mistcrest",
        currencyID = 3444,
        sources = {
            "Weekly Outdoor Events",
            "Mythic+ Dungeons (+2 to +3)",
            "Normal Difficulty Raids and Lairs",
            "Delves Tiers 7-10",
            "Trovehunter's Bounty Tiers 6-7",
            "Nightmare Difficulty Prey Hunts",
        },
    },
    {
        name = "Hero Mistcrest",
        currencyID = 3445,
        sources = {
            "Heroic Difficulty Raids and Lairs",
            "Mythic+ Dungeons (+4 to +8)",
            "Trovehunter's Bounty Tiers 8+",
            "Nightmare Difficulty Prey Hunts",
        },
    },
    {
        name = "Myth Mistcrest",
        currencyID = 3446,
        sources = {
            "Mythic Difficulty Raids and Lairs",
            "Mythic+ Dungeons (+9 and up)",
            "Ritual Sites Tier 6",
            "Bountiful Delves Tier 11 Gilded Stashes",
        },
    },
}

local NORMAL_CONTENT = {
    {difficulty = "Normal / Follower Dungeons", ilvl = 252, note = "Cannot be upgraded"},
    {difficulty = "Seasonal Heroic Dungeons", ilvl = 268, note = "Adventurer-track reward"},
    {difficulty = "Seasonal Mythic Dungeons (M0)", ilvl = 292, note = "Champion 1/6"},
}

local WARBAND_ACHIEVEMENTS = {
    {text = "Adventurer of the Mist: 282 in every armor slot", achievementID = 62410},
    {text = "Veteran of the Mist: 295 in every armor slot", achievementID = 62411},
    {text = "Champion of the Mist: 308 in every armor slot", achievementID = 62412},
    {text = "Hero of the Mist: 321 in every armor slot", achievementID = 62414},
    {text = "Myth of the Mist: 331 in every armor slot", achievementID = 62416},
}

local UPGRADE_UNLOCK_QUESTS = {
    {name = "Equipment Seminar (Quest)", questID = 96633},
    {name = "Upgrade Practicum (Quest)", questID = 96635},
}

local function MakeFont(parent, template, size)
    local fs = parent:CreateFontString(nil, "OVERLAY", template or "GameFontHighlight")
    if size then
        fs:SetFont(fs:GetFont(), size)
    end
    return fs
end

local function AddLine(parent, x, y, width, height, alpha)
    local line = parent:CreateTexture(nil, "ARTWORK")
    line:SetColorTexture(1, 1, 1, alpha or 0.15)
    line:SetSize(width, height or 1)
    line:SetPoint("TOPLEFT", x, y)
    return line
end

local function CreatePanel(parent, width, height, point, relativeTo, relativePoint, x, y)
    local panel = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    panel:SetSize(width, height)
    panel:SetPoint(point, relativeTo or parent, relativePoint or point, x or 0, y or 0)
    Mixin(panel, BackdropTemplateMixin)
    panel:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 12,
        insets = {left = 3, right = 3, top = 3, bottom = 3},
    })
    panel:SetBackdropColor(0.015, 0.015, 0.015, 0.94)
    panel:SetBackdropBorderColor(0.35, 0.35, 0.35, 0.8)
    return panel
end

local frame = CreateFrame("Frame", "DungeonItemLevelsFrame", UIParent, "BackdropTemplate")
frame:SetSize(1280, 700)
frame:SetPoint("CENTER")
frame:SetFrameStrata("DIALOG")
frame:SetClampedToScreen(true)

Mixin(frame, BackdropTemplateMixin)
frame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 32,
    insets = {left = 15, right = 15, top = 15, bottom = 15},
})
frame:SetBackdropColor(0.005, 0.005, 0.005, 0.98)
frame:SetBackdropBorderColor(0.55, 0.40, 0.08, 1)
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

-- Title
frame.title = MakeFont(frame, "GameFontNormalLarge", 20)
frame.title:SetPoint("TOPLEFT", 30, -25)
frame.title:SetPoint("TOPRIGHT", -30, -25)
frame.title:SetJustifyH("CENTER")
frame.title:SetText(Color("Apple's Dungeon Item Levels", COLORS.gold) .. Color("  (Midnight - Season 2)", COLORS.white))

local titleSub = MakeFont(frame, "GameFontHighlightSmall", 11)
titleSub:SetPoint("TOP", frame.title, "BOTTOM", 0, -5)
titleSub:SetText(Color("Patch 12.1", COLORS.muted) .. "  |  " .. Color("Mistcrest Gear System", COLORS.muted))

-- Main header line stored for dynamic resizing
frame.headerLine = AddLine(frame, 30, -65, 1220, 1, 0.35)

-- Close button
local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
close:SetPoint("TOPRIGHT", -10, -10)
close:SetScript("OnClick", function() frame:Hide() end)

DungeonItemLevelsDB = DungeonItemLevelsDB or {}

-- Hide WoW UI toggle. Off by default and reset every time the window opens,
-- unless overridden via the settings gear below. Uses UIParent:Hide(), which
-- covers other addons too (not just the default UI) - this window is
-- reparented to WorldFrame while hidden so it isn't hidden along with
-- everything else, with scale compensated so its size doesn't change, and a
-- defensive re-show guard in case any of this ever leaves it unexpectedly hidden.
local function SetHideWowUI(hidden)
    local wasShown = frame:IsShown()

    if hidden then
        frame:SetScale(UIParent:GetEffectiveScale())
        frame:SetParent(WorldFrame)
        UIParent:Hide()
    else
        UIParent:Show()
        frame:SetParent(UIParent)
        frame:SetScale(1)
    end

    if wasShown and not frame:IsShown() then
        frame:Show()
    end
end

local hideUICheckbox = CreateFrame("CheckButton", nil, frame, "UICheckButtonTemplate")
hideUICheckbox:SetSize(20, 20)
hideUICheckbox:SetPoint("BOTTOMLEFT", 25, 27)
hideUICheckbox:SetChecked(false)

local hideUILabel = MakeFont(frame, "GameFontHighlightSmall", 10)
hideUILabel:SetPoint("LEFT", hideUICheckbox, "RIGHT", 4, 0)
hideUILabel:SetText("Hide WoW UI")

hideUICheckbox:SetScript("OnClick", function(self)
    SetHideWowUI(self:GetChecked())
end)

hideUICheckbox:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("Hide WoW UI", 1, 1, 1)
    GameTooltip:AddLine("Hides the default game UI while this window is open.", 0.8, 0.8, 0.8, true)
    GameTooltip:Show()
end)
hideUICheckbox:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

-- Settings gear: lets the user permanently override the off-by-default behavior
local hideUIGear = CreateFrame("Button", nil, frame)
hideUIGear:SetSize(16, 16)
hideUIGear:SetPoint("LEFT", hideUILabel, "RIGHT", 6, 0)
hideUIGear:SetNormalTexture("Interface\\Icons\\Trade_Engineering")
hideUIGear:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")

local hideUIScopeNote = MakeFont(frame, "GameFontHighlightSmall", 9)
hideUIScopeNote:SetPoint("LEFT", hideUIGear, "RIGHT", 6, 0)
hideUIScopeNote:SetText(Color("(Only applies while this window is open)", COLORS.muted))

local hideUISettingsPopup = CreateFrame("Frame", nil, frame, "BackdropTemplate")
hideUISettingsPopup:SetSize(230, 56)
hideUISettingsPopup:SetPoint("TOPLEFT", hideUIGear, "BOTTOMLEFT", -20, -30)
Mixin(hideUISettingsPopup, BackdropTemplateMixin)
hideUISettingsPopup:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 12,
    insets = {left = 3, right = 3, top = 3, bottom = 3},
})
hideUISettingsPopup:SetBackdropColor(0.015, 0.015, 0.015, 0.96)
hideUISettingsPopup:SetBackdropBorderColor(0.35, 0.35, 0.35, 0.8)
hideUISettingsPopup:SetFrameStrata("TOOLTIP")
hideUISettingsPopup:Hide()

local alwaysHideCheckbox = CreateFrame("CheckButton", nil, hideUISettingsPopup, "UICheckButtonTemplate")
alwaysHideCheckbox:SetSize(20, 20)
alwaysHideCheckbox:SetPoint("TOPLEFT", 8, -8)

local alwaysHideLabel = MakeFont(hideUISettingsPopup, "GameFontHighlightSmall", 10)
alwaysHideLabel:SetPoint("LEFT", alwaysHideCheckbox, "RIGHT", 4, 0)
alwaysHideLabel:SetWidth(190)
alwaysHideLabel:SetJustifyH("LEFT")
alwaysHideLabel:SetText("Always hide WoW UI when this window opens")

alwaysHideCheckbox:SetScript("OnClick", function(self)
    local checked = self:GetChecked() and true or false
    DungeonItemLevelsDB.alwaysHideWowUI = checked

    if checked then
        hideUICheckbox:SetChecked(true)
        SetHideWowUI(true)
    end
end)

hideUIGear:SetScript("OnClick", function()
    if hideUISettingsPopup:IsShown() then
        hideUISettingsPopup:Hide()
    else
        alwaysHideCheckbox:SetChecked(DungeonItemLevelsDB.alwaysHideWowUI and true or false)
        hideUISettingsPopup:Show()
    end
end)

hideUIGear:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("Hide WoW UI Settings", 1, 1, 1)
    GameTooltip:Show()
end)
hideUIGear:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

frame:HookScript("OnShow", function()
    local defaultHidden = DungeonItemLevelsDB.alwaysHideWowUI and true or false
    hideUICheckbox:SetChecked(defaultHidden)
    SetHideWowUI(defaultHidden)
end)

frame:HookScript("OnHide", function()
    hideUISettingsPopup:Hide()
    hideUICheckbox:SetChecked(false)
    SetHideWowUI(false)
end)

-- Main content panel
local main = CreatePanel(frame, 680, 570, "TOPLEFT", frame, "TOPLEFT", 25, -82)

local intro = MakeFont(main, "GameFontHighlight", 12)
intro:SetPoint("TOPLEFT", 18, -14)
intro:SetPoint("TOPRIGHT", -18, -14)
intro:SetJustifyH("CENTER")
intro:SetSpacing(3)

local introText = ""
for i, row in ipairs(NORMAL_CONTENT) do
    if i > 1 then introText = introText .. "\n" end
    introText = introText .. Color(row.difficulty .. ": ", COLORS.white)
        .. Color(row.ilvl .. " ilvl", COLORS.gold)
        .. "  " .. Color("(" .. row.note .. ")", COLORS.muted)
end
intro:SetText(introText)

AddLine(main, 18, -72, 644, 1, 0.25)

local tableTitle = MakeFont(main, "GameFontNormal", 14)
tableTitle:SetPoint("TOP", main, "TOP", 0, -84)
tableTitle:SetText(Color("Mythic+ Rewards & Great Vault", COLORS.gold))

local columns = {
    {title = "Keystone", x = 18, width = 80},
    {title = "End of Dungeon", x = 105, width = 170},
    {title = "Mistcrest", x = 285, width = 135},
    {title = "Great Vault", x = 430, width = 220},
}

for _, col in ipairs(columns) do
    local h = MakeFont(main, "GameFontNormal", 11)
    h:SetPoint("TOPLEFT", col.x, -108)
    h:SetWidth(col.width)
    h:SetJustifyH("CENTER")
    h:SetText(Color(col.title, COLORS.muted))
end

AddLine(main, 18, -126, 644, 1, 0.15)

local rowY = -136
local rowHeight = 21

local function MakeRewardText(ilvl, track, rank)
    return Color(tostring(ilvl) .. " ", COLORS.gold) .. TrackText(track, rank)
end

local level12Key
for level = 2, 12 do
    local data = MYTHIC_PLUS[level]
    local y = rowY - ((level - 2) * rowHeight)

    local key = MakeFont(main, "GameFontHighlight", 11)
    key:SetPoint("TOPLEFT", 18, y)
    key:SetWidth(80)
    key:SetJustifyH("CENTER")
    key:SetText("+" .. level)

    local loot = MakeFont(main, "GameFontHighlight", 11)
    loot:SetPoint("TOPLEFT", 105, y)
    loot:SetWidth(170)
    loot:SetJustifyH("CENTER")
    loot:SetText(MakeRewardText(data.loot, data.lootTrack, data.lootRank))

    local crest = MakeFont(main, "GameFontHighlight", 11)
    crest:SetPoint("TOPLEFT", 285, y)
    crest:SetWidth(135)
    crest:SetJustifyH("CENTER")
    crest:SetText(Color(data.crest .. " Mistcrest", TrackColor(data.crest)))

    local vault = MakeFont(main, "GameFontHighlight", 11)
    vault:SetPoint("TOPLEFT", 430, y)
    vault:SetWidth(220)
    vault:SetJustifyH("CENTER")
    vault:SetText(MakeRewardText(data.vault, data.vaultTrack, data.vaultRank))

    if level == 12 then
        level12Key = key
    end
end

if level12Key then
    level12Key:SetText("+12+")
end

-- Extended Myth section
local abyssPanel = CreatePanel(main, 644, 115, "BOTTOMLEFT", main, "BOTTOMLEFT", 18, 70)

local abyssTitle = MakeFont(abyssPanel, "GameFontNormal", 12)
abyssTitle:SetPoint("TOP", 0, -8)
abyssTitle:SetText(Color("THE VENOMOUS ABYSS - EXTENDED MYTHIC ITEM LEVELS", COLORS.myth))

local abyssHeaders = {
    {"Rank", 60, 260},
    {"Item Level", 324, 260},
}
for _, h in ipairs(abyssHeaders) do
    local fs = MakeFont(abyssPanel, "GameFontNormal", 10)
    fs:SetPoint("TOPLEFT", h[2], -26)
    fs:SetWidth(h[3])
    fs:SetJustifyH("CENTER")
    fs:SetText(Color(h[1], COLORS.muted))
end

for i, row in ipairs(VENOMOUS_ABYSS_MYTH) do
    local y = -42 - ((i - 1) * 20)

    local rank = MakeFont(abyssPanel, "GameFontHighlight", 11)
    rank:SetPoint("TOPLEFT", 60, y)
    rank:SetWidth(260)
    rank:SetJustifyH("CENTER")
    rank:SetText(Color(row.rank, COLORS.myth))

    local ilvl = MakeFont(abyssPanel, "GameFontHighlight", 11)
    ilvl:SetPoint("TOPLEFT", 324, y)
    ilvl:SetWidth(260)
    ilvl:SetJustifyH("CENTER")
    ilvl:SetText(Color(tostring(row.ilvl), COLORS.gold))
end

-- Current keystone area
frame.keystoneInfo = MakeFont(main, "GameFontHighlight", 11)
frame.keystoneInfo:SetPoint("BOTTOMLEFT", 18, 44)
frame.keystoneInfo:SetPoint("BOTTOMRIGHT", -18, 44)
frame.keystoneInfo:SetHeight(22)
frame.keystoneInfo:SetJustifyH("CENTER")

-- Keystone announcer: chat channel dropdown + announce button
local CHAT_CHANNEL_OPTIONS = {
    {text = "Say", value = "SAY"},
    {text = "Guild", value = "GUILD"},
    {text = "Party", value = "PARTY"},
    {text = "Raid", value = "RAID"},
}

frame.selectedChatChannel = "SAY"

local chatDropdown = CreateFrame("Frame", "DungeonItemLevelsChatDropdown", main, "UIDropDownMenuTemplate")
chatDropdown:SetPoint("BOTTOM", main, "BOTTOM", -50, 4)
UIDropDownMenu_SetWidth(chatDropdown, 90)
UIDropDownMenu_SetText(chatDropdown, "Say")

local function ChatDropdown_OnClick(self)
    frame.selectedChatChannel = self.value
    UIDropDownMenu_SetText(chatDropdown, self:GetText())
end

UIDropDownMenu_Initialize(chatDropdown, function(self, level)
    for _, option in ipairs(CHAT_CHANNEL_OPTIONS) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = option.text
        info.value = option.value
        info.func = ChatDropdown_OnClick
        info.checked = (frame.selectedChatChannel == option.value)
        UIDropDownMenu_AddButton(info, level)
    end
end)

local function FindKeystoneLink()
    if not (C_Item and C_Item.IsItemKeystoneByID) then
        return nil
    end

    for bag = 0, NUM_BAG_SLOTS do
        local numSlots = C_Container.GetContainerNumSlots(bag)
        for slot = 1, numSlots do
            local itemID = C_Container.GetContainerItemID(bag, slot)
            if itemID and C_Item.IsItemKeystoneByID(itemID) then
                local itemLink = C_Container.GetContainerItemLink(bag, slot)
                if itemLink then
                    return itemLink
                end
            end
        end
    end

    return nil
end

local function AnnounceKeystone(channel)
    local level = C_MythicPlus.GetOwnedKeystoneLevel()
    if not level or level < 2 then
        print(Color("Apple's Dungeon Item Levels: ", COLORS.red) .. "No keystone found in your inventory to announce.")
        return
    end

    local keystoneLink = FindKeystoneLink()
    if not keystoneLink then
        print(Color("Apple's Dungeon Item Levels: ", COLORS.red) .. "Could not find your keystone item to link.")
        return
    end

    local message = "My Key: " .. keystoneLink

    if channel == "SAY" then
        SendChatMessage(message, "SAY")
    elseif channel == "GUILD" then
        if IsInGuild() then
            SendChatMessage(message, "GUILD")
        else
            print(Color("Apple's Dungeon Item Levels: ", COLORS.red) .. "You are not in a guild.")
        end
    elseif channel == "PARTY" then
        if IsInGroup() then
            SendChatMessage(message, "PARTY")
        else
            print(Color("Apple's Dungeon Item Levels: ", COLORS.red) .. "You are not in a party.")
        end
    elseif channel == "RAID" then
        if IsInRaid() then
            SendChatMessage(message, "RAID")
        else
            print(Color("Apple's Dungeon Item Levels: ", COLORS.red) .. "You are not in a raid.")
        end
    end
end

local announceButton = CreateFrame("Button", nil, main, "UIPanelButtonTemplate")
announceButton:SetSize(110, 22)
announceButton:SetPoint("LEFT", chatDropdown, "RIGHT", -6, 3)
announceButton:SetText("Key Announcer")
announceButton:SetScript("OnClick", function()
    AnnounceKeystone(frame.selectedChatChannel)
end)

-- Floating keystone icon decorations (bottom corners of the main panel).
-- Only shown when a keystone is actually owned, since that uses the real
-- item icon rather than guessing at a generic keystone texture path.
local function GetKeystoneIcon()
    if not (C_Item and C_Item.IsItemKeystoneByID) then
        return nil
    end

    for bag = 0, NUM_BAG_SLOTS do
        local numSlots = C_Container.GetContainerNumSlots(bag)
        for slot = 1, numSlots do
            local itemID = C_Container.GetContainerItemID(bag, slot)
            if itemID and C_Item.IsItemKeystoneByID(itemID) then
                local info = C_Container.GetContainerItemInfo(bag, slot)
                if info and info.iconFileID then
                    return info.iconFileID
                end
            end
        end
    end

    return nil
end

local function CreateFloatingKeystoneIcon(anchorPoint, xOffset)
    local container = CreateFrame("Frame", nil, main)
    container:SetSize(40, 40)
    container:SetPoint(anchorPoint, main, anchorPoint, xOffset, 8)
    container:Hide()

    local glow = container:CreateTexture(nil, "BACKGROUND")
    glow:SetSize(60, 60)
    glow:SetPoint("CENTER")
    glow:SetTexture("Interface\\Cooldown\\star4")
    glow:SetBlendMode("ADD")
    glow:SetVertexColor(1, 0.82, 0.2, 0.7)

    local icon = container:CreateTexture(nil, "ARTWORK")
    icon:SetSize(32, 32)
    icon:SetPoint("CENTER")

    local glowAnim = glow:CreateAnimationGroup()
    glowAnim:SetLooping("REPEAT")

    local spin = glowAnim:CreateAnimation("Rotation")
    spin:SetDegrees(360)
    spin:SetDuration(6)
    spin:SetOrder(1)

    local pulseUp = glowAnim:CreateAnimation("Alpha")
    pulseUp:SetFromAlpha(0.3)
    pulseUp:SetToAlpha(0.9)
    pulseUp:SetDuration(1.2)
    pulseUp:SetOrder(1)

    local pulseDown = glowAnim:CreateAnimation("Alpha")
    pulseDown:SetFromAlpha(0.9)
    pulseDown:SetToAlpha(0.3)
    pulseDown:SetDuration(1.2)
    pulseDown:SetOrder(2)

    glowAnim:Play()

    local bobAnim = container:CreateAnimationGroup()
    bobAnim:SetLooping("REPEAT")

    local bobUp = bobAnim:CreateAnimation("Translation")
    bobUp:SetOffset(0, 8)
    bobUp:SetDuration(1.6)
    bobUp:SetSmoothing("IN_OUT")
    bobUp:SetOrder(1)

    local bobDown = bobAnim:CreateAnimation("Translation")
    bobDown:SetOffset(0, -8)
    bobDown:SetDuration(1.6)
    bobDown:SetSmoothing("IN_OUT")
    bobDown:SetOrder(2)

    bobAnim:Play()

    return container, icon, bobAnim
end

local leftFloatIcon, leftFloatTexture = CreateFloatingKeystoneIcon("BOTTOMLEFT", 45)
local rightFloatIcon, rightFloatTexture, rightBobAnim = CreateFloatingKeystoneIcon("BOTTOMRIGHT", -45)

-- Restart the right side's bob slightly offset so the two never move in lockstep
C_Timer.After(0.5, function()
    rightBobAnim:Stop()
    rightBobAnim:Play()
end)

local function UpdateFloatingKeystoneIcons()
    local iconFileID = GetKeystoneIcon()

    if iconFileID then
        leftFloatTexture:SetTexture(iconFileID)
        rightFloatTexture:SetTexture(iconFileID)
        leftFloatIcon:Show()
        rightFloatIcon:Show()
    else
        leftFloatIcon:Hide()
        rightFloatIcon:Hide()
    end
end

-- Right-side information sheet
local side = CreatePanel(frame, 530, 570, "TOPRIGHT", frame, "TOPRIGHT", -25, -82)
frame.side = side

local sideTitle = MakeFont(side, "GameFontNormal", 15)
sideTitle:SetPoint("TOP", 0, -12)
sideTitle:SetText(Color("Midnight 12.1 Information", COLORS.gold))

local tabs = {}
local tabPanels = {}
local tabNames = {"Mistcrests", "Other Sources", "Upgrades", "Info"}

local function CreateTab(index, name)
    local tab = CreateFrame("Button", nil, side, "UIPanelButtonTemplate")
    tab:SetSize(120, 24)
    tab:SetPoint("TOPLEFT", 10 + ((index - 1) * 126), -38)
    tab:SetText(name)
    tab:SetScript("OnClick", function()
        frame:SelectTab(index)
    end)
    tabs[index] = tab
end

for i, name in ipairs(tabNames) do
    CreateTab(i, name)
end

local contentArea = CreateFrame("Frame", nil, side)
contentArea:SetPoint("TOPLEFT", 10, -68)
contentArea:SetPoint("BOTTOMRIGHT", -10, 10)

for i = 1, #tabNames do
    local panel = CreateFrame("Frame", nil, contentArea)
    panel:SetAllPoints()
    panel:Hide()
    tabPanels[i] = panel
end

frame.SelectTab = function(_, index)
    for i, panel in ipairs(tabPanels) do
        panel:SetShown(i == index)
    end
    for i, tab in ipairs(tabs) do
        if i == index then
            tab:LockHighlight()
        else
            tab:UnlockHighlight()
        end
    end
end

local function EnableSmoothScroll(scrollFrame, step)
    step = step or 20
    scrollFrame:EnableMouseWheel(true)
    scrollFrame:SetScript("OnMouseWheel", function(self, delta)
        local newScroll = self:GetVerticalScroll() - (delta * step)
        local maxScroll = self:GetVerticalScrollRange()

        if newScroll < 0 then
            newScroll = 0
        elseif newScroll > maxScroll then
            newScroll = maxScroll
        end

        self:SetVerticalScroll(newScroll)
    end)
end

-- Tab 1: Mistcrest sources
local mistPanel = tabPanels[1]
local mistScroll = CreateFrame("ScrollFrame", nil, mistPanel, "UIPanelScrollFrameTemplate")
mistScroll:SetPoint("TOPLEFT", 0, 0)
mistScroll:SetPoint("BOTTOMRIGHT", -20, 0)

local mistChild = CreateFrame("Frame", nil, mistScroll)
mistChild:SetWidth(480)
mistChild:SetHeight(650)
mistScroll:SetScrollChild(mistChild)
EnableSmoothScroll(mistScroll, 20)

frame.mistCrestCounts = {}
frame.upgradeQuestTexts = {}
frame.warbandAchievementTexts = {}

local mistY = -2
for _, crest in ipairs(MISTCREST_SOURCES) do
    local icon = mistChild:CreateTexture(nil, "ARTWORK")
    icon:SetSize(20, 20)
    icon:SetPoint("TOPLEFT", 4, mistY - 1)
    local info = C_CurrencyInfo.GetCurrencyInfo(crest.currencyID)
    if info and info.iconFileID then
        icon:SetTexture(info.iconFileID)
    end

    local header = MakeFont(mistChild, "GameFontNormal", 12)
    header:SetPoint("TOPLEFT", 30, mistY)
    header:SetWidth(300)
    header:SetJustifyH("LEFT")
    header:SetText(Color(crest.name, TrackColor(crest.name:gsub(" Mistcrest", ""))))

    local count = MakeFont(mistChild, "GameFontHighlight", 12)
    count:SetPoint("TOPLEFT", 330, mistY)
    count:SetWidth(140)
    count:SetJustifyH("RIGHT")
    frame.mistCrestCounts[#frame.mistCrestCounts + 1] = {currencyID = crest.currencyID, fs = count}

    mistY = mistY - 22

    for _, source in ipairs(crest.sources) do
        local bullet = MakeFont(mistChild, "GameFontHighlightSmall", 10)
        bullet:SetPoint("TOPLEFT", 30, mistY)
        bullet:SetWidth(440)
        bullet:SetJustifyH("LEFT")
        bullet:SetText("- " .. source)
        mistY = mistY - 17
    end

    mistY = mistY - 14
end

-- Tab 2: Other sources
local otherPanel = tabPanels[2]
local otherScroll = CreateFrame("ScrollFrame", nil, otherPanel, "UIPanelScrollFrameTemplate")
otherScroll:SetPoint("TOPLEFT", 0, 0)
otherScroll:SetPoint("BOTTOMRIGHT", -20, 0)

local otherChild = CreateFrame("Frame", nil, otherScroll)
otherChild:SetWidth(480)
otherChild:SetHeight(750)
otherScroll:SetScrollChild(otherChild)
EnableSmoothScroll(otherScroll, 20)

local otherY = -2

local function AddInfoSection(title, lines)
    local h = MakeFont(otherChild, "GameFontNormal", 12)
    h:SetPoint("TOPLEFT", 6, otherY)
    h:SetWidth(460)
    h:SetJustifyH("LEFT")
    h:SetText(Color(title, COLORS.gold))
    otherY = otherY - 22

    for _, line in ipairs(lines) do
        local fs = MakeFont(otherChild, "GameFontHighlightSmall", 10)
        fs:SetPoint("TOPLEFT", 10, otherY)
        fs:SetWidth(450)
        fs:SetJustifyH("LEFT")
        fs:SetText(line)
        otherY = otherY - 18
    end

    otherY = otherY - 10
end

-- Upgrade Vendors (with TomTom waypoint button)
do
    local h = MakeFont(otherChild, "GameFontNormal", 12)
    h:SetPoint("TOPLEFT", 6, otherY)
    h:SetWidth(460)
    h:SetJustifyH("LEFT")
    h:SetText(Color("Upgrade Vendors", COLORS.gold))
    otherY = otherY - 22

    local vendorLines = {
        "Cuzolth - gear upgrades",
        "Vaskarn - Mistcrest exchanges",
        "Silvermoon City, near the Sanctum of Light",
    }
    for _, line in ipairs(vendorLines) do
        local fs = MakeFont(otherChild, "GameFontHighlightSmall", 10)
        fs:SetPoint("TOPLEFT", 10, otherY)
        fs:SetWidth(450)
        fs:SetJustifyH("LEFT")
        fs:SetText(line)
        otherY = otherY - 18
    end

    local WAYPOINT_MAP_ID = 2393
    local WAYPOINT_X = 48.6
    local WAYPOINT_Y = 61.7

    local wayText = MakeFont(otherChild, "GameFontHighlightSmall", 10)
    wayText:SetPoint("TOPLEFT", 10, otherY)
    wayText:SetWidth(150)
    wayText:SetJustifyH("LEFT")
    wayText:SetText("/way #" .. WAYPOINT_MAP_ID .. " " .. WAYPOINT_X .. " " .. WAYPOINT_Y)

    local wayButton = CreateFrame("Button", nil, otherChild, "UIPanelButtonTemplate")
    wayButton:SetSize(90, 18)
    wayButton:SetPoint("LEFT", wayText, "RIGHT", 8, 1)
    wayButton:SetText("Set Waypoint")

    wayButton:SetScript("OnClick", function()
        if TomTom and TomTom.AddWaypoint then
            TomTom:AddWaypoint(WAYPOINT_MAP_ID, WAYPOINT_X / 100, WAYPOINT_Y / 100, {
                title = "Upgrade Vendors (Cuzolth / Vaskarn)",
                persistent = false,
            })
            print(Color("Apple's Dungeon Item Levels: ", COLORS.gold) .. "Waypoint set for the Upgrade Vendors.")
        else
            print(Color("Apple's Dungeon Item Levels: ", COLORS.red) .. "TomTom addon not found. Install TomTom to use this button.")
        end
    end)

    wayButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Set TomTom Waypoint", 1, 1, 1)
        GameTooltip:AddLine("Cuzolth / Vaskarn - Upgrade Vendors", 0.8, 0.8, 0.8)
        GameTooltip:Show()
    end)
    wayButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    otherY = otherY - 18

    local note = MakeFont(otherChild, "GameFontHighlightSmall", 9)
    note:SetPoint("TOPLEFT", 10, otherY)
    note:SetWidth(450)
    note:SetJustifyH("LEFT")
    frame.tomtomNote = note
    otherY = otherY - 18

    otherY = otherY - 10
end

-- Vaskarn: Lower-Tier Exchanges (with quest completion tracking)
do
    local h = MakeFont(otherChild, "GameFontNormal", 12)
    h:SetPoint("TOPLEFT", 6, otherY)
    h:SetWidth(460)
    h:SetJustifyH("LEFT")
    h:SetText(Color("Vaskarn: Lower-Tier Exchanges", COLORS.gold))
    otherY = otherY - 22

    local exchangeLines = {
        "10 Veteran -> 10 Adventurer",
        "10 Champion -> 10 Veteran",
        "10 Hero -> 10 Champion",
        "10 Myth -> 10 Hero",
    }
    for _, line in ipairs(exchangeLines) do
        local fs = MakeFont(otherChild, "GameFontHighlightSmall", 10)
        fs:SetPoint("TOPLEFT", 10, otherY)
        fs:SetWidth(450)
        fs:SetJustifyH("LEFT")
        fs:SetText(line)
        otherY = otherY - 18
    end

    local reqLine = MakeFont(otherChild, "GameFontHighlightSmall", 10)
    reqLine:SetPoint("TOPLEFT", 10, otherY)
    reqLine:SetWidth(450)
    reqLine:SetJustifyH("LEFT")
    reqLine:SetText("Requires completing these quests:")
    otherY = otherY - 17

    for _, quest in ipairs(UPGRADE_UNLOCK_QUESTS) do
        local qfs = MakeFont(otherChild, "GameFontHighlightSmall", 10)
        qfs:SetPoint("TOPLEFT", 20, otherY)
        qfs:SetWidth(440)
        qfs:SetJustifyH("LEFT")
        frame.upgradeQuestTexts[#frame.upgradeQuestTexts + 1] = {questID = quest.questID, name = quest.name, fs = qfs}
        otherY = otherY - 16
    end

    local capLine = MakeFont(otherChild, "GameFontHighlightSmall", 10)
    capLine:SetPoint("TOPLEFT", 10, otherY)
    capLine:SetWidth(450)
    capLine:SetJustifyH("LEFT")
    capLine:SetText("Lower-tier exchanges do not count toward the weekly cap.")
    otherY = otherY - 18

    otherY = otherY - 10
end

-- Warband / 50% Discounts (with achievement completion tracking)
do
    local h = MakeFont(otherChild, "GameFontNormal", 12)
    h:SetPoint("TOPLEFT", 6, otherY)
    h:SetWidth(460)
    h:SetJustifyH("LEFT")
    h:SetText(Color("Warband / 50% Discounts", COLORS.gold))
    otherY = otherY - 22

    for _, entry in ipairs(WARBAND_ACHIEVEMENTS) do
        local fs = MakeFont(otherChild, "GameFontHighlightSmall", 10)
        fs:SetPoint("TOPLEFT", 10, otherY)
        fs:SetWidth(450)
        fs:SetJustifyH("LEFT")
        frame.warbandAchievementTexts[#frame.warbandAchievementTexts + 1] = {achievementID = entry.achievementID, text = entry.text, fs = fs}
        otherY = otherY - 18
    end

    otherY = otherY - 10
end

AddInfoSection("Profession Crafting", {
    "Rare: 266-279 - 80 Adventurer Mistcrests",
    "Rare: 279-292 - 80 Veteran Mistcrests",
    "Epic: 305-318 - 80 Hero Mistcrests",
    "Epic: 318-331 - 80 Myth Mistcrests",
})

AddInfoSection("Upgrade Rules", {
    "1/6 -> 6/6 costs 100 Mistcrests total.",
    "Each upgrade step costs 20 Mistcrests.",
    "Free upgrades can match the highest item level you have earned for that armor slot.",
})

-- Tab 3: Upgrade tracks (3 x 2 Grid Layout)
local upgradePanel = tabPanels[3]
local upgradeTitle = MakeFont(upgradePanel, "GameFontNormal", 13)
upgradeTitle:SetPoint("TOP", 0, -2)
upgradeTitle:SetText(Color("12.1 Upgrade Tracks", COLORS.gold))

local gridSections = {
    { type = "track", data = UPGRADE_TRACKS[1] }, -- Adventurer
    { type = "track", data = UPGRADE_TRACKS[2] }, -- Veteran
    { type = "track", data = UPGRADE_TRACKS[3] }, -- Champion
    { type = "track", data = UPGRADE_TRACKS[4] }, -- Hero
    { type = "track", data = UPGRADE_TRACKS[5] }, -- Myth
    { type = "abyss", name = "Venomous Abyss" },   -- Abyss extensions
}

local colWidth = 160
local colGap = 10
local startX = 5
local row1Y = -30
local row2Y = -230

for idx, sec in ipairs(gridSections) do
    local col = (idx - 1) % 3
    local row = math.floor((idx - 1) / 3)
    local posX = startX + col * (colWidth + colGap)
    local posY = row == 0 and row1Y or row2Y

    if sec.type == "track" then
        local track = sec.data
        local h = MakeFont(upgradePanel, "GameFontNormal", 11)
        h:SetPoint("TOPLEFT", posX, posY)
        h:SetWidth(colWidth)
        h:SetText(Color(track.name, TrackColor(track.name)))

        local trackY = posY - 18
        for rank = 1, 6 do
            local fs = MakeFont(upgradePanel, "GameFontHighlightSmall", 10)
            fs:SetPoint("TOPLEFT", posX, trackY)
            fs:SetWidth(colWidth)
            fs:SetText(
                Color(rank .. "/6", COLORS.white)
                .. " "
                .. Color(tostring(track.levels[rank]), COLORS.gold)
                .. (rank == 1 and Color(" (base)", COLORS.muted) or Color(" +20", COLORS.muted))
            )
            trackY = trackY - 16
        end
    elseif sec.type == "abyss" then
        local h = MakeFont(upgradePanel, "GameFontNormal", 11)
        h:SetPoint("TOPLEFT", posX, posY)
        h:SetWidth(colWidth)
        h:SetText(Color("Venomous Abyss", COLORS.myth))

        local extY = posY - 18
        for _, rowData in ipairs(VENOMOUS_ABYSS_MYTH) do
            local fs = MakeFont(upgradePanel, "GameFontHighlightSmall", 10)
            fs:SetPoint("TOPLEFT", posX, extY)
            fs:SetWidth(colWidth)
            fs:SetText(Color(rowData.rank, COLORS.myth) .. " " .. Color(tostring(rowData.ilvl) .. " ilvl", COLORS.gold))
            extY = extY - 18
        end
    end
end

-- Tab 4: Info
local infoPanel = tabPanels[4]
local infoText = MakeFont(infoPanel, "GameFontHighlightSmall", 10)
infoText:SetPoint("TOPLEFT", 6, -4)
infoText:SetPoint("TOPRIGHT", -6, -4)
infoText:SetJustifyH("LEFT")
infoText:SetSpacing(3)
infoText:SetText(
    Color("Apple's Dungeon Item Levels", COLORS.gold) .. "\n"
    .. "Midnight Season 2 / Patch 12.1\n\n"
    .. Color("Commands", COLORS.gold) .. "\n"
    .. "/dil  - Toggle the main window\n"
    .. "/dil side  - Show/hide the information sheet\n\n"
    .. Color("Window", COLORS.gold) .. "\n"
    .. "Drag the title area to move the window.\n"
    .. "Use the tabs on the right for detailed information.\n\n"
    .. Color("Keystone", COLORS.gold) .. "\n"
    .. "The overview automatically reads the keystone currently in your character's inventory\n"
    .. "and displays its dungeon, end-of-dungeon loot, and Great Vault reward level.\n\n"
    .. Color("Data note", COLORS.gold) .. "\n"
    .. "Mistcrest amounts by individual M+ level are not hard-coded because the current\n"
    .. "Season 2 guide marks those amounts as unconfirmed. The crest tier is shown instead."
)

-- Toggle button for side sheet
local sideToggle = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
sideToggle:SetSize(120, 26)
sideToggle:SetPoint("BOTTOMRIGHT", -25, 25)
sideToggle:SetText("Hide Details")
sideToggle:SetScript("OnClick", function()
    frame:SetSideShown(not side:IsShown())
end)

function frame:SetSideShown(shown)
    side:SetShown(shown)
    sideToggle:SetText(shown and "Hide Details" or "Show Details")
    if shown then
        frame:SetWidth(1280)
        if frame.headerLine then
            frame.headerLine:SetWidth(1220)
        end
    else
        frame:SetWidth(730)
        if frame.headerLine then
            frame.headerLine:SetWidth(670)
        end
    end
end

-- Current keystone calculation
local function GetKeystoneData(level)
    if not level or level < 2 then
        return nil
    end
    local lookupLevel = math.min(level, 12)
    return MYTHIC_PLUS[lookupLevel]
end

local function UpdateKeystoneInfo()
    local level = C_MythicPlus.GetOwnedKeystoneLevel()
    local mapID = C_MythicPlus.GetOwnedKeystoneChallengeMapID()

    if not level or level < 2 then
        frame.keystoneInfo:SetText(Color("NO KEYSTONE FOUND IN CHARACTER INVENTORY", COLORS.red))
        return
    end

    local mapName = ""
    if mapID and mapID > 0 then
        local name = C_ChallengeMode.GetMapUIInfo(mapID)
        mapName = name or ""
    end

    local data = GetKeystoneData(level)
    if not data then
        frame.keystoneInfo:SetText(Color("Unable to read Keystone reward data.", COLORS.red))
        return
    end

    local keyText = Color("Current Keystone: ", COLORS.white)
        .. Color("+" .. level, COLORS.red)
        .. (mapName ~= "" and Color(" (" .. mapName .. ")", COLORS.white) or "")

    local lootText = Color("Loot: ", COLORS.white)
        .. MakeRewardText(data.loot, data.lootTrack, data.lootRank)

    local vaultText = Color("  |  Vault: ", COLORS.white)
        .. MakeRewardText(data.vault, data.vaultTrack, data.vaultRank)

    frame.keystoneInfo:SetText(keyText .. "  |  " .. lootText .. vaultText)
end

-- Mistcrest currency count tracker
local function UpdateMistcrestCounts()
    if not frame.mistCrestCounts then
        return
    end

    for _, entry in ipairs(frame.mistCrestCounts) do
        local info = C_CurrencyInfo.GetCurrencyInfo(entry.currencyID)
        if info then
            local quantity = info.quantity or 0
            local maxQuantity = info.maxQuantity or 0
            local capped = maxQuantity > 0 and quantity >= maxQuantity

            local text
            if maxQuantity > 0 then
                text = tostring(quantity) .. " / " .. tostring(maxQuantity)
            else
                text = tostring(quantity)
            end

            entry.fs:SetText(Color(text, capped and COLORS.red or COLORS.white))
        else
            entry.fs:SetText(Color("--", COLORS.muted))
        end
    end
end

-- Upgrade-unlock quest tracker (Equipment Seminar / Upgrade Practicum)
local function UpdateUpgradeQuests()
    if not frame.upgradeQuestTexts then
        return
    end

    for _, entry in ipairs(frame.upgradeQuestTexts) do
        local done = C_QuestLog.IsQuestFlaggedCompleted(entry.questID)
        local statusText = done and " - Complete" or " - Incomplete"
        entry.fs:SetText(Color(entry.name .. statusText, done and COLORS.veteran or COLORS.red))
    end
end

-- Warband discount achievement tracker
local function UpdateWarbandAchievements()
    if not frame.warbandAchievementTexts then
        return
    end

    for _, entry in ipairs(frame.warbandAchievementTexts) do
        local completed = select(4, GetAchievementInfo(entry.achievementID))
        entry.fs:SetText(Color(entry.text, completed and COLORS.veteran or COLORS.red))
    end
end

-- TomTom detection - only warn if it's actually missing
local function UpdateTomTomNote()
    if not frame.tomtomNote then
        return
    end

    if TomTom and TomTom.AddWaypoint then
        frame.tomtomNote:Hide()
    else
        frame.tomtomNote:SetText(Color("TomTom addon not detected - enable/install it to use this waypoint button.", COLORS.red))
        frame.tomtomNote:Show()
    end
end

-- Slash commands
SLASH_DIL1 = "/dil"
SlashCmdList["DIL"] = function(msg)
    msg = (msg or ""):lower():gsub("^%s+", ""):gsub("%s+$", "")

    if msg == "side" or msg == "details" then
        frame:SetSideShown(not frame.side:IsShown())
    else
        frame:SetShown(not frame:IsShown())
    end
end

-- Minimap button (LibDBIcon-1.0)
-- LibDBIcon's default button template draws "Interface\Minimap\MiniMap-TrackingBorder"
-- (the gold ring) as an overlay on top of the icon automatically. The previous manual
-- CreateFrame button never added that overlay texture, which is why it had no ring.
DungeonItemLevelsDB = DungeonItemLevelsDB or {}
DungeonItemLevelsDB.minimap = DungeonItemLevelsDB.minimap or {}

local LDB = LibStub("LibDataBroker-1.1", true)
local LDBIcon = LibStub("LibDBIcon-1.0", true)

if LDB and LDBIcon then
    local dilLDB = LDB:NewDataObject("DungeonItemLevels", {
        type = "launcher",
        text = "Apple's Dungeon Item Levels",
        icon = "Interface\\MINIMAP\\Dungeon_Icon.PNG",
        OnClick = function(_, button)
            frame:SetShown(not frame:IsShown())
        end,
        OnTooltipShow = function(tooltip)
            tooltip:AddLine("Apple's Dungeon Item Levels")
            tooltip:AddLine("Left-click to open/close", 1, 1, 1)
            tooltip:AddLine("/dil to toggle", 0.8, 0.8, 0.8)
        end,
    })

    LDBIcon:Register("DungeonItemLevels", dilLDB, DungeonItemLevelsDB.minimap)
else
    print("|cFFFF3030Apple's Dungeon Item Levels:|r LibDataBroker-1.1 / LibDBIcon-1.0 not found. Minimap button disabled.")
end

-- Initialise
frame:SelectTab(1)
frame:SetSideShown(true)
frame:Hide()

frame:HookScript("OnShow", function()
    UpdateKeystoneInfo()
    UpdateMistcrestCounts()
    UpdateUpgradeQuests()
    UpdateWarbandAchievements()
    UpdateFloatingKeystoneIcons()
end)

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:RegisterEvent("BAG_UPDATE_DELAYED")
eventFrame:RegisterEvent("CURRENCY_DISPLAY_UPDATE")
eventFrame:RegisterEvent("QUEST_TURNED_IN")
eventFrame:RegisterEvent("ACHIEVEMENT_EARNED")
eventFrame:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_LOGIN" then
        frame:Hide()
        UpdateKeystoneInfo()
        UpdateMistcrestCounts()
        UpdateUpgradeQuests()
        UpdateWarbandAchievements()
        UpdateTomTomNote()
        UpdateFloatingKeystoneIcons()
    elseif event == "BAG_UPDATE_DELAYED" and frame:IsShown() then
        UpdateKeystoneInfo()
        UpdateFloatingKeystoneIcons()
    elseif event == "CURRENCY_DISPLAY_UPDATE" and frame:IsShown() then
        UpdateMistcrestCounts()
    elseif event == "QUEST_TURNED_IN" and frame:IsShown() then
        UpdateUpgradeQuests()
    elseif event == "ACHIEVEMENT_EARNED" and frame:IsShown() then
        UpdateWarbandAchievements()
    end
end)

tinsert(UISpecialFrames, "DungeonItemLevelsFrame")