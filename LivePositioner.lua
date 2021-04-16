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
    self:changeSubject(firstThing)
end

function LivePositioner:changeSubject(thisSubject) 
    print(thisSubject)
    if self.subject and self.subject.material then
        self.subject.material.diffuse = vec3(1,1,1)
    end
    self.subjectChanging = true
    self.subject = thisSubject
    subjectScaleAll = 1
    subjectX, subjectY, subjectZ = thisSubject.position.x, thisSubject.position.y, thisSubject.position.z
    if self.subject.sliderEulers then
        subjectEulerX, subjectEulerY, subjectEulerZ = self.subject.sliderEulers.x, self.subject.sliderEulers.y, self.subject.sliderEulers.z
        self.subject.rotation = quat.eulerAngles(subjectEulerX, subjectEulerY, subjectEulerZ)
    else
        subjectEulerX, subjectEulerY, subjectEulerZ = self.subject.eulerAngles.x, self.subject.eulerAngles.y, self.subject.eulerAngles.z
    end
    subjectScaleX, subjectScaleY, subjectScaleZ = thisSubject.scale.x, thisSubject.scale.y, thisSubject.scale.z
    self.subjectChanging = false
end



-- defineLiveParameters(...) sets up the parameter controls
function LivePositioner:define(thing, pTable, eTable, sTable)
    local position = pTable or self:rangeTable(0,0,1000)
    local eulers = eTable or self:rangeTable(0,0,0,180)
    local scales = sTable or self:rangeTable(1,1,1,150,1,40)
    LivePositioner:setUpParametersWithMicroSettingOf(false)
end

function LivePositioner:setUpParametersWithMicroSettingOf(setting)
    
    parameter.clear()
    
    WelcomeString = "Welcome to LivePositioner!\n\nUse the parameter controls to make a custom scene with Codea's built-in models.\n\nYou can save your scene, and it will appear as a function called 'recreateScene()' on the the recreateScene tab.\n\nYou can then cut-and-paste that function into any project of your own, and use it for whatever you want."
    
    parameter.boolean("Show Welcome", true, function(value)
        if value == false then
            output.clear()
            print(WelcomeString)
        end
        Show_Welcome = true
    end)
    

    
    parameter.watch("CurrentModel")
    parameter.watch("CurrentPack")
    parameter.integer("ModelChooser", 1, #self.modelSets[self.currentSetIndex], self.currentModelIndex, function()
        if ModelChooser > #self.modelSets[self.currentSetIndex] then
            ModelChooser = #self.modelSets[self.currentSetIndex]
        end
        self.currentModelIndex = ModelChooser
        local thisEntity = EasyCraft.entities[EasyCraft.entityNames[self.currentEntityIndex] ]
        thisEntity:remove(craft.model)
        thisEntity:remove(craft.renderer)
        local newModel = craft.model(getAssetFor(self.currentSetIndex, ModelChooser))
        thisEntity.modelPack = self. modelSetNames[self.currentSetIndex]
        thisEntity.modelName = self.modelSets[self.currentSetIndex][ModelChooser]
        thisEntity:add(craft.renderer, newModel)
    end)
    
    parameter.integer("PackChooser", 1, #self.modelSets, PackIndexParameterCurrent, function()
        if PackIndexParameterCurrent ~= PackChooser then
            if self.currentModelIndex > #self.modelSets[PackChooser] then
                ModelChooser = #self.modelSets[PackChooser]
                self.currentModelIndex = ModelChooser
            end
            self.currentSetIndex = PackChooser
            local thisEntity = EasyCraft.entities[EasyCraft.entityNames[self.currentEntityIndex] ]
            thisEntity:remove(craft.model)
            thisEntity:remove(craft.renderer)
            local newModel = craft.model(getAssetFor(self.currentSetIndex, self.currentModelIndex))
            thisEntity.modelPack = self. modelSetNames[self.currentSetIndex]
            thisEntity.modelName = self.modelSets[self.currentSetIndex][self.currentModelIndex]
            thisEntity:add(craft.renderer, newModel)
            PackIndexParameterCurrent = PackChooser
            self.currentModelIndex = ModelChooser
         --   if self.mostRecentMicroSetting ~= setting then
          --      self.mostRecentMicroSetting = setting
                self:setUpParametersWithMicroSettingOf(setting)
                return
         --   end
        end
    end)
    
    ModelInfo = "Codea's built-in models come in themed sets called 'packs.'\n\nThe PackChooser switches between packs, and the ModelChooser lets you quickly scroll through the models in each one."
    
    parameter.boolean("Model Choosing Info", true, function(value)
        if value == false then
            output.clear()
            print(ModelInfo)
        end
        Model_Choosing_Info = true
    end)
    
    PositioningFo = "The positioning sliders let you change the placement, rotation, and size of the selected model.\n\nIf it's hard to get a model in the exact right size, place, or angle that you want, toggle 'MicroMode' on.\n\nMicroMode is for making precise adjustments and getting things juuuuuust right."
    
    parameter.boolean("Positioning Info", true, function(value)
        if value == false then
            output.clear()
            print(PositioningFo)
        end
        Positioning_Info = true
    end)
    
    parameter.boolean("MicroMode", setting, function(microOn)
        print(microOn, setting)
        if microOn ~= setting then
            print("not ", microOn, setting)
            self:setUpParametersWithMicroSettingOf(microOn)
        end
    end)
    
    local setSlidersTo = {}
    if not subjectX then
        setSlidersTo.positions = self:rangeTable(0,0,0,1000)
        setSlidersTo.eulers = self:rangeTable(0,0,0,180)
        setSlidersTo.scale = self:rangeTable(1,1,1,150,1,40)
    elseif setting == false then
        setSlidersTo.positions = self:rangeTable(subjectX, subjectY, subjectZ, 1000)
        setSlidersTo.eulers = self:rangeTable(subjectEulerX, subjectEulerY, subjectEulerZ,180)
        setSlidersTo.scale = self:rangeTable(subjectScaleX, subjectScaleY, subjectScaleZ,600,subjectScaleAll,40)
    elseif setting == true then
        setSlidersTo.positions = self:rangeTable(subjectX, subjectY, subjectZ,50)
        setSlidersTo.eulers = self:rangeTable(subjectEulerX, subjectEulerY, subjectEulerZ,40)
        setSlidersTo.scale = self:rangeTable(subjectScaleX, subjectScaleY, subjectScaleZ,10,subjectScaleAll,5)
    end
    
    self:setPositionsAndRanges(setSlidersTo.positions)
    self:setEulersAndRanges(setSlidersTo.eulers)
    self:setScalesAndRanges(setSlidersTo.scale)

    
    SaveAndLoadFo = "There is only one save/load slot, so be careful.\n\nWhen you tap 'Save Scene' your current models and positions are stored on a tab named 'recreateScene'.\n\nIf you want to preserve a creation for good, manually copy the contents of that tab somewhere else.\n\nYou can also save just your camera position to a tab called 'restoreCameraSettings'."
    
    parameter.boolean("Save And Load Info", true, function(value)
        if value == false then
            output.clear()
            print(SaveAndLoadFo)
        end
        Save_And_Load_Info = true
    end)

    parameter.action("Save Scene",
    function()
        EasyCraft.saveScene()
        EasyCraft.saveCameraPlacement()
    end)
    
    parameter.action("Load Saved Scene", function()

        --[[
        for i, name in ipairs(EasyCraft.entityNames) do
            local deadMan = EasyCraft.entities[name]
            EasyCraft.entities[name] = nil
            deadMan:destroy()
        end
        ]]
        
        --reset entity tables and reset indexes
        EasyCraft.entities = {}
        EasyCraft.entityNames = {}
        self.currentEntityIndex = 1
        self.currentSetIndex = 1
        self.currentModelIndex = 1
        
        --not sure why I'm capturing the return value here
        local newSceneParts
        if easyCraftRecreate then
            newSceneParts = easyCraftRecreate()
        end
    end)
    
    parameter.action("Save Just Camera Position", function()
        EasyCraft.saveCameraPlacement()
    end)
    
    parameter.watch("Selecting")
    Selecting = "The selected entity can be positioned and changed. ShowBounds highlights the current selection."
    
    parameter.action("Select Next Entity", function()
        ShowBounds = true
        if self.currentEntityIndex == #EasyCraft.entityNames then
            self.currentEntityIndex = 1
        else
            self.currentEntityIndex = self.currentEntityIndex + 1
        end
        self:changeSubject(EasyCraft.entities[EasyCraft.entityNames[self.currentEntityIndex] ])
    end)
    
    parameter.action("Select Previous Entity", function()
        ShowBounds = true
        if self.currentEntityIndex == 1 then
            self.currentEntityIndex = #EasyCraft.entityNames
        else
            self.currentEntityIndex = self.currentEntityIndex - 1
        end
        self:changeSubject(EasyCraft.entities[EasyCraft.entityNames[self.currentEntityIndex] ])
    end)
    
    parameter.boolean("ShowBounds", false)
       
    parameter.watch("Adding")
    Adding = "Tapping 'New Entity' adds a duplicate of the current selection to the scene."
  
         
    parameter.action("New Entity", function()
        local idNumber = math.random(1,2147483647)
        local newThing = EasyCraft.makeAThing(idNumber)
        self.currentEntityIndex = #EasyCraft.entityNames
        local currentE = getCurrentEntity()
        currentE:remove(craft.renderer)
        currentE:add(craft.renderer, craft.model(getAssetFor(self.currentSetIndex, self.currentModelIndex)))
        currentE.modelPack = self. modelSetNames[self.currentSetIndex]
        currentE.modelName = self.modelSets[self.currentSetIndex][self.currentModelIndex]
        print(EasyCraft.entities[EasyCraft.entityNames[self.currentEntityIndex] ].position)
        self:changeSubject(EasyCraft.entities[EasyCraft.entityNames[self.currentEntityIndex] ])
    end)    
end

function LivePositioner:useTablesIn(tableOfPositions)
    subjectX, subjectY, subjectZ = tableOfPositions.position.x, tableOfPositions.position.y, tableOfPositions.position.z
    subjectEulerX, subjectEulerY, subjectEulerZ = tableOfPositions.eulerAngles.x, tableOfPositions.eulerAngles.y, tableOfPositions.eulerAngles.z
    subjectScaleX, subjectScaleY, subjectScaleZ = tableOfPositions.scale.x, tableOfPositions.scale.y, tableOfPositions.scale.z
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
    parameter.number("subjectX", 
        rangeTable.x - rangeTable.range,  
        rangeTable.x + rangeTable.range,
        rangeTable.x)
    parameter.number("subjectY", 
        rangeTable.y - rangeTable.range,  
        rangeTable.y + rangeTable.range,
        rangeTable.y)
    parameter.number("subjectZ", 
        rangeTable.z - rangeTable.range,  
        rangeTable.z + rangeTable.range,
        rangeTable.z)
end


function LivePositioner:setEulersAndRanges(rangeTable)
    parameter.number("subjectEulerX", 
        rangeTable.x - rangeTable.range,  
        rangeTable.x + rangeTable.range,
        rangeTable.x)
    parameter.number("subjectEulerY", 
        rangeTable.y - rangeTable.range,  
        rangeTable.y + rangeTable.range,
        rangeTable.y)
    parameter.number("subjectEulerZ", 
        rangeTable.z - rangeTable.range,  
        rangeTable.z + rangeTable.range,
        rangeTable.z)
end

function LivePositioner:setScalesAndRanges(rangeTable)
    parameter.number("subjectScaleX",
    rangeTable.x - (rangeTable.range * 0.5),
    rangeTable.x + rangeTable.range,
    rangeTable.x)
    parameter.number("subjectScaleY",
    rangeTable.y - (rangeTable.range * 0.5),
    rangeTable.y + rangeTable.range,
    rangeTable.y)
    parameter.number("subjectScaleZ",
    rangeTable.z - (rangeTable.range * 0.5),
    rangeTable.z + rangeTable.range,
    rangeTable.z)
    if rangeTable.scaleAll then
        parameter.number("subjectScaleAll",
        rangeTable.scaleAll - (rangeTable.scaleRange * 0.5),
        rangeTable.scaleRange,
        rangeTable.scaleAll
        )
    end
end

-- the update() function must be called by the main update() function
function LivePositioner:update()
    if subjectX then
        self.subject.position = vec3(subjectX, subjectY, subjectZ)
     --   subjectPosition = self.subject.position
    end
    if subjectEulerX then
        self.subject.rotation = quat.eulerAngles(subjectEulerX, subjectEulerY, subjectEulerZ)
        self.subject.sliderEulers.x, self.subject.sliderEulers.y, self.subject.sliderEulers.z = subjectEulerX, subjectEulerY, subjectEulerZ
    end
    if subjectScaleX then
        local multiplier = 1
        if subjectScaleAll then
            multiplier = subjectScaleAll
        end
        self.subject.scale = vec3(subjectScaleX * multiplier, subjectScaleY * multiplier, subjectScaleZ * multiplier)
    end
end