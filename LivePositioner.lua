-- LivePositioner creates Codea parameter controls for positioning. 
-- It also suplies the ability to save the current settings to a tab while a project is running, so it is easy to preserve settings once you've got them just how you like them. 
-- The simplest way to use it is to initialize an instance by passing in the object to be positioned, and update the instance in the update(...) function. 
-- You can get more fancy by passing in tables that define its starting position and the range of adjustment you'd like to allow. The format for this is explained below..
LivePositioner = class()

-- LivePositioner can be initialized with nothing, with just an entity, with an entity plus intial positioning instructions, or any combination thereof
-- If not given positionings, it supplies default initial values.
-- Position instructions must be in the format created by LivePositioner:rangeTable(...)
function LivePositioner:init(firstThing, modelSets, modelSetNames)
    self.currentEntityIndex = 1    
    self.modelSets = modelSets or {}
    self.modelSetNames = modelSetNames or {}
    self.currentSetIndex = 1
    self.currentModelIndex = 1
    self.highlightMultiplier = 4.8
    self:changeSubject(firstThing)
end

function LivePositioner:changeSubject(thisSubject) 
    for i, v in ipairs(self.modelSetNames) do
        if v == thisSubject.modelPack then
            self.currentSetIndex = i
            break
        end
    end
    for i, v in ipairs(self.modelSets[self.currentSetIndex]) do
        if v == thisSubject.modelName then
            self.currentModelIndex = i
            break
        end
    end
    self.subjectChanging = true
    self.subject = thisSubject
    scaleAll = 1
    entityX, entityY, entityZ = thisSubject.position.x, thisSubject.position.y, thisSubject.position.z
    if self.subject.sliderEulers then
        eulerX, eulerY, eulerZ = self.subject.sliderEulers.x, self.subject.sliderEulers.y, self.subject.sliderEulers.z
        self.subject.rotation = quat.eulerAngles(eulerX, eulerY, eulerZ)
    else
        eulerX, eulerY, eulerZ = self.subject.eulerAngles.x, self.subject.eulerAngles.y, self.subject.eulerAngles.z
    end
    scaleX, scaleY, scaleZ = thisSubject.scale.x, thisSubject.scale.y, thisSubject.scale.z
    self.subjectChanging = false
end

function LivePositioner:setUpBloomingEnvironment()
    -- Setup lighting
    scene.ambientColor = color(63, 63, 63, 255)
    sunLight = scene.sun:get(craft.light)
    sunLight.intensity = 0.7
    scene.sun.rotation = quat.eulerAngles(80, 0, 0)
    
    cameraComponent = scene.camera:get(craft.camera)
    cameraComponent.hdr = true
    cameraComponent.colorTextureEnabled = true
    
    bloom = craft.bloomEffect()
    cameraComponent:addPostEffect(bloom)
    bloom.threshold = 2.9
    bloom.intensity = 0.58
    bloom.softThreshold = 0.16
    bloom.iterations = 8
    
    scene.sky.material.sky = color(20, 19, 29, 255)
    scene.sky.material.horizon = color(22, 21, 28, 255)
    
    local keyLight = scene:entity():add(craft.light, DIRECTIONAL)
    keyLight.entity.parent = scene.camera
    keyLight.entity.eulerAngles = vec3(-230,100,0)
    keyLight.intensity = 1.0
    keyLight.color = color(241, 241, 238)
end

function LivePositioner:applyDiffuseMultiplier(multiplier, entity)
    local numberOfSubmeshes, thisMaterial
    numberOfSubmeshes = entity.model.submeshCount
    for i=1, numberOfSubmeshes do
        thisMaterial = entity.model:getMaterial(i)
        thisMaterial.diffuse = thisMaterial.diffuse*multiplier
    end
end

-- defineLiveParameters(...) sets up the parameter controls
function LivePositioner:define(thing, pTable, eTable, sTable)
    local position = pTable or self:rangeTable(0,0,1000)
    local eulers = eTable or self:rangeTable(0,0,0,180)
    local scales = sTable or self:rangeTable(1,1,1,150,1,40)
    LivePositioner:setUpParametersWithMicroSettingOf(false)
end

function LivePositioner:setHighlightFor(thisEntity, stateToSet)
    if self.highlightedEntity then --un-highlight anything currently lit
        print("removing highlight for: ", self.highlightedEntity)
        Highlight = false
        self:applyDiffuseMultiplier(1/self.highlightMultiplier, self.highlightedEntity)
        self.highlightedEntity = nil
    end
    if stateToSet == true then --highlight thisEntity if needed
        print("adding highlight to: ", thisEntity)
        Highlight = true
        self.highlightedEntity = thisEntity
        self:applyDiffuseMultiplier(self.highlightMultiplier, self.highlightedEntity)
    end
end

function LivePositioner:setUpParametersWithMicroSettingOf(setting)
    
    parameter.clear()
    
    parameter.watch("__________Welcome__________")
    __________Welcome__________ = "Have fun making scenes!"
    
    WelcomeString = "Welcome to LivePositioner!\n\nUse the parameter controls to make a custom scene with Codea's built-in models.\n\nYou can save your scene, and it will appear as a function called 'recreateScene()' on the the recreateScene tab.\n\nYou can then cut-and-paste that function into any project of your own, and use it for whatever you want."
    
    parameter.boolean("MoreWelcomeInfo", false, function(value)
        if value == true then
            output.clear()
            print(WelcomeString)
        end
        MoreWelcomeInfo = false
    end)
    

    
    parameter.watch("__________Models__________")
    __________Models__________ = "Choose any built-in model."
    --make the choosers update with selection correctly
    parameter.integer("ModelChooser", 1, #self.modelSets[self.currentSetIndex], self.currentModelIndex, function()
        if ModelChooser > #self.modelSets[self.currentSetIndex] then
            ModelChooser = #self.modelSets[self.currentSetIndex]
        end
        self.currentModelIndex = ModelChooser
        local thisEntity = EasyCraft.entityTableByNames[EasyCraft.entityNames[self.currentEntityIndex] ]
        thisEntity:remove(craft.model)
        thisEntity:remove(craft.renderer)
        local newModel = craft.model(getAssetFor(self.currentSetIndex, ModelChooser))
        thisEntity.modelPack = self.modelSetNames[self.currentSetIndex]
        thisEntity.modelName = self.modelSets[self.currentSetIndex][ModelChooser]
        thisEntity:add(craft.renderer, newModel)
        self:setHighlightFor(thisEntity, Highlight)
    end)
    
    parameter.integer("PackChooser", 1, #self.modelSets, PackIndexParameterCurrent, function()
        if PackIndexParameterCurrent ~= PackChooser then
            if self.currentModelIndex > #self.modelSets[PackChooser] then
                ModelChooser = #self.modelSets[PackChooser]
                self.currentModelIndex = ModelChooser
            end
            self.currentSetIndex = PackChooser
            local thisEntity = getCurrentEntity()
            thisEntity:remove(craft.model)
            thisEntity:remove(craft.renderer)
            local newModel = craft.model(getAssetFor(self.currentSetIndex, self.currentModelIndex))
            thisEntity.modelPack = self.modelSetNames[self.currentSetIndex]
            thisEntity.modelName = self.modelSets[self.currentSetIndex][self.currentModelIndex]
            thisEntity:add(craft.renderer, newModel)
            self:setHighlightFor(thisEntity, Highlight)
            PackIndexParameterCurrent = PackChooser
            self.currentModelIndex = ModelChooser
            self:setUpParametersWithMicroSettingOf(setting)
            return
        end
    end)
    
    parameter.watch("CurrentModel")
    parameter.watch("CurrentPack")
    
    ModelsInfoString = "Codea's built-in models come in themed sets called 'packs.'\n\nThe PackChooser switches between packs, and the ModelChooser lets you quickly scroll through the models in each one."
    
    parameter.boolean("MoreModelsInfo", false, function(value)
        if value == true then
            output.clear()
            print(ModelsInfoString)
        end
        MoreModelsInfo = false
    end)
    
    parameter.watch("__________Positioning__________")
    __________Positioning__________ = "Move 'em, spin 'em, size 'em!"
    
    local setSlidersTo = {}
    if not entityX then
        setSlidersTo.positions = self:rangeTable(0,0,0,1000)
        setSlidersTo.eulers = self:rangeTable(0,0,0,180)
        setSlidersTo.scale = self:rangeTable(1,1,1,150,1,40)
    elseif setting == false then
        setSlidersTo.positions = self:rangeTable(entityX, entityY, entityZ, 1000)
        setSlidersTo.eulers = self:rangeTable(eulerX, eulerY, eulerZ,180)
        setSlidersTo.scale = self:rangeTable(scaleX, scaleY, scaleZ,600,scaleAll,40)
    elseif setting == true then
        setSlidersTo.positions = self:rangeTable(entityX, entityY, entityZ,20)
        setSlidersTo.eulers = self:rangeTable(eulerX, eulerY, eulerZ,100)
        setSlidersTo.scale = self:rangeTable(scaleX, scaleY, scaleZ,4,scaleAll,4)
    end
    
    self:setPositionsAndRanges(setSlidersTo.positions)
    self:setEulersAndRanges(setSlidersTo.eulers)
    self:setScalesAndRanges(setSlidersTo.scale)
    
    parameter.boolean("MicroMode", setting, function(microOn)
        print(microOn, setting)
        if microOn ~= setting then
            print("not ", microOn, setting)
            self:setUpParametersWithMicroSettingOf(microOn)
        end
    end)
    
    PositioningFo = "The positioning sliders let you change the placement, rotation, and size of the selected model.\n\nIf it's hard to get a model in the exact right size, place, or angle that you want, toggle 'MicroMode' on.\n\nMicroMode is for making precise adjustments and getting things juuuuuust right."
    
    parameter.boolean("MorePositioningInfo", false, function(value)
        if value == true then
            output.clear()
            print(PositioningFo)
        end
        MorePositioningInfo = false
    end)
    
    parameter.watch("__________Selecting__________")
    __________Selecting__________ = "Select the model to work on."
    
    parameter.integer("SelectedEntity", 1, #EasyCraft.entityNames, 1, function()
        print(#EasyCraft.entityTableByNames)
        print(moof)
    end)
    
    parameter.action("Select Next Entity", function()
        if self.currentEntityIndex == #EasyCraft.entityNames then
            self.currentEntityIndex = 1
        else
            self.currentEntityIndex = self.currentEntityIndex + 1
        end
        local thisBaby = getCurrentEntity()
        self:changeSubject(thisBaby)
        PackChooser = self.currentSetIndex
        ModelChooser = self.currentModelIndex
        self:setHighlightFor(getCurrentEntity(), true)
    end)
    
    parameter.action("Select Previous Entity", function()
        if self.currentEntityIndex == 1 then
            self.currentEntityIndex = #EasyCraft.entityNames
        else
            self.currentEntityIndex = self.currentEntityIndex - 1
        end
        self:changeSubject(getCurrentEntity())
        PackChooser = self.currentSetIndex
        ModelChooser = self.currentModelIndex
        self:setHighlightFor(getCurrentEntity(), true)
    end)
    
    parameter.boolean("Highlight", false, function()
        print("highlight",Highlight)
        self:setHighlightFor(getCurrentEntity(), Highlight)
    end)
    
    parameter.watch("__________Creating__________")
    __________Creating__________ = "Make a new entity."
    
    parameter.action("New Entity", function()
        local idNumber = math.random(1,2147483647)
        local newThing = EasyCraft.makeAThing(idNumber)
        self.currentEntityIndex = #EasyCraft.entityNames
        local currentE = getCurrentEntity()
        currentE:remove(craft.renderer)
        currentE:add(craft.renderer, craft.model(getAssetFor(self.currentSetIndex, self.currentModelIndex)))
        currentE.modelPack = self. modelSetNames[self.currentSetIndex]
        currentE.modelName = self.modelSets[self.currentSetIndex][self.currentModelIndex]
        self:changeSubject(EasyCraft.entityTableByNames[EasyCraft.entityNames[self.currentEntityIndex] ])
        self:setHighlightFor(getCurrentEntity(), false)
    end)
    
    parameter.watch("__________Saving__________")
    __________Saving__________ = "Save early and often!"

    parameter.action("Save Scene",
    function()
        EasyCraft.saveScene()
        EasyCraft.saveCameraPlacement()
    end)
    
    parameter.action("Load Saved Scene", function()

        
        --[[
        for i, name in ipairs(EasyCraft.entityNames) do
            local deadMan = EasyCraft.entityTableByNames[name]
            EasyCraft.entityTableByNames[name] = nil
            deadMan:destroy()
        end
        ]]
        
        self:loadSavedScene()
        
        print("entityTableByNames after loading:",#EasyCraft.entityTableByNames)
        
        --reset parameter list to refresh selection slider
        self:setUpParametersWithMicroSettingOf(MicroMode)
    end)
    
    parameter.action("Save Just Camera Position", function()
        EasyCraft.saveCameraPlacement()
    end)
    
    SaveAndLoadFo = "There is only one save/load slot, so be careful.\n\nWhen you tap 'Save Scene' your current models and positions are stored on a tab named 'recreateScene'.\n\nIf you want to preserve a creation for good, manually copy the contents of that tab somewhere else.\n\nYou can also save just your camera position to a tab called 'restoreCameraSettings'."
    
    parameter.boolean("MoreSaveInfo", false, function(value)
        if value == true then
            output.clear()
            print(SaveAndLoadFo)
        end
        MoreSaveInfo = false
    end)
end

function LivePositioner:loadSavedScene()
    --reset entity tables
    EasyCraft.entityTableByNames = {}
    EasyCraft.entityNames = {}
    
    -- reset indexes
    self.currentEntityIndex = 1
    self.currentSetIndex = 1
    self.currentModelIndex = 1
    
    if easyCraftRecreate then
        easyCraftRecreate()
    end
end

function LivePositioner:useTablesIn(tableOfPositions)
    entityX, entityY, entityZ = tableOfPositions.position.x, tableOfPositions.position.y, tableOfPositions.position.z
    eulerX, eulerY, eulerZ = tableOfPositions.eulerAngles.x, tableOfPositions.eulerAngles.y, tableOfPositions.eulerAngles.z
    scaleX, scaleY, scaleZ = tableOfPositions.scale.x, tableOfPositions.scale.y, tableOfPositions.scale.z
end

-- rangeTable(...) creates tables in the format required by the initializer and the defineLiveParameters(..) function
-- the format is simply a key-value table with the keys x, y, z, and range
-- parameters are set by taking the given x, y, and z and then creating a parameter slider that can be slid above and below those starting values by an amount equal to the range value
function LivePositioner:rangeTable(startX, startY, startZ, givenRange, scaleAll, scaleRange)
    local returnTable = {}
    returnTable.x = startX
    returnTable.y = startY
    returnTable.z = startZ
    returnTable.range = givenRange
    if scaleAll then
        returnTable.scaleAll = scaleAll
    end
    if scaleRange then
        returnTable.scaleRange = scaleRange
    end
    return returnTable
end


function LivePositioner:setPositionsAndRanges(rangeTable)
    parameter.number("entityX", 
        rangeTable.x - rangeTable.range,  
        rangeTable.x + rangeTable.range,
        rangeTable.x)
    parameter.number("entityY", 
        rangeTable.y - rangeTable.range,  
        rangeTable.y + rangeTable.range,
        rangeTable.y)
    parameter.number("entityZ", 
        rangeTable.z - rangeTable.range,  
        rangeTable.z + rangeTable.range,
        rangeTable.z)
end


function LivePositioner:setEulersAndRanges(rangeTable)
    parameter.number("eulerX", 
        rangeTable.x - rangeTable.range,  
        rangeTable.x + rangeTable.range,
        rangeTable.x)
    parameter.number("eulerY", 
        rangeTable.y - rangeTable.range,  
        rangeTable.y + rangeTable.range,
        rangeTable.y)
    parameter.number("eulerZ", 
        rangeTable.z - rangeTable.range,  
        rangeTable.z + rangeTable.range,
        rangeTable.z)
end

function LivePositioner:setScalesAndRanges(rangeTable)
    parameter.number("scaleX",
    rangeTable.x - (rangeTable.range * 0.5),
    rangeTable.x + rangeTable.range,
    rangeTable.x)
    parameter.number("scaleY",
    rangeTable.y - (rangeTable.range * 0.5),
    rangeTable.y + rangeTable.range,
    rangeTable.y)
    parameter.number("scaleZ",
    rangeTable.z - (rangeTable.range * 0.5),
    rangeTable.z + rangeTable.range,
    rangeTable.z)
    if rangeTable.scaleAll then
        parameter.number("scaleAll",
        rangeTable.scaleAll - (rangeTable.scaleRange * 0.5),
        rangeTable.scaleRange,
        rangeTable.scaleAll
        )
    end
end

-- the update() function must be called by the main update() function
function LivePositioner:update()
    if entityX then
        self.subject.position = vec3(entityX, entityY, entityZ)
     --   subjectPosition = self.subject.position
    end
    if eulerX then
        self.subject.rotation = quat.eulerAngles(eulerX, eulerY, eulerZ)
        self.subject.sliderEulers.x, self.subject.sliderEulers.y, self.subject.sliderEulers.z = eulerX, eulerY, eulerZ
    end
    if scaleX then
        local multiplier = 1
        if scaleAll then
            multiplier = scaleAll
        end
        self.subject.scale = vec3(scaleX * multiplier, scaleY * multiplier, scaleZ * multiplier)
    end
end