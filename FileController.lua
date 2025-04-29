---@diagnostic disable: missing-return
---@class FileController
FileController = {}

---@return number
function FileController:getFileCount()
end

---@return table<string, LuaInt64>
function FileController:getAllFiles()
end

-- TODO: Check params
---@param name string
---@return LuaInt64
function FileController:getFileByName(name)
end

---@return ActiveSkillsFile
function FileController:getActiveSkillsFile()
end

---@return ActiveSkillTypesFile
function FileController:getActiveSkillTypesFile()
end

---@return BaseItemTypesFile
function FileController:getBaseItemTypesFile()
end

---@return BuffDefinitionsFile
function FileController:getBuffDefinitionsFile()
end

---@return GameObjectTasksFile
function FileController:getGameObjectTasksFile()
end

---@return GrantedEffectsFile
function FileController:getGrantedEffectsFile()
end

---@return GrantedEffectsPerLevelsFile
function FileController:getGrantedEffectsPerLevelsFile()
end

---@return GrantedEffectStatSetsFile
function FileController:getGrantedEffectStatSetsFile()
end

---@return GrantedEffectStatSetsPerLevelFile
function FileController:getGrantedEffectStatSetsPerLevelFile()
end

---@return ItemClassesFile
function FileController:getItemClassesFile()
end

---@return InventoriesFile
function FileController:getInventoriesFile()
end

---@return StatsFile
function FileController:getStatsFile()
end

---@return ModsFile
function FileController:getModsFile()
end

---@return ModTypesFile
function FileController:getModTypesFile()
end

---@return TagsFile
function FileController:getTagsFile()
end

---@return WorldAreasFile
function FileController:getWorldAreasFile()
end

---@return BuffTemplatesFile
function FileController:getBuffTemplatesFile()
end

---@return ClientStringsFile
function FileController:getClientStringsFile()
end

---@return ShrinesFile
function FileController:getShrinesFile()
end

---@return EndgameMapContentsFile
function FileController:getEndgameMapContentsFile()
end

---@return DynamicStashSlotsFile
function FileController:getDynamicStashSlotsFile()
end

---@return CurrencyStashTabLayoutFile
function FileController:getCurrencyStashTabLayoutFile()
end

---@return DeliriumStashTabLayoutFile
function FileController:getDeliriumStashTabLayoutFile()
end

---@return BlightStashTabLayoutFile
function FileController:getBlightStashTabLayoutFile()
end

---@return EssenceStashTabLayoutFile
function FileController:getEssenceStashTabLayoutFile()
end

---@return MinimapIconsFile
function FileController:getMinimapIconsFile()
end

---@return CurrencyExchangeFile
function FileController:getCurrencyExchangeFile()
end

---@return CurrencyExchangeCategoriesFile
function FileController:getCurrencyExchangeCategoriesFile()
end

---@return NPCTalksFile
function FileController:getNPCTalksFile()
end

---@return NPCTalkCategoriesFile
function FileController:getNPCTalkCategoriesFile()
end

---@return NPCShopsFile
function FileController:getNPCShopsFile()
end

---@return NPCShopFile
function FileController:getNPCShopFile()
end

---@return NPCsFile
function FileController:getNPCsFile()
end

---@return ThreeToOneRecipesFile
function FileController:getThreeToOneRecipesFile()
end

---@return ActionTypesFile
function FileController:getActionTypesFile()
end