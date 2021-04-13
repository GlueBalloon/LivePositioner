-- LivePositioner creates Codea parameter controls for positioning. 
-- It also suplies the ability to save the current settings to a tab while a project is running, so it is easy to preserve settings once you've got them just how you like them. 
-- The simplest way to use it is to initialize an instance by passing in the object to be positioned, and update the instance in the update(...) function. 
-- You can get more fancy by passing in tables that define its starting position and the range of adjustment you'd like to allow. The format for this is explained below..
LivePositioner = class()

-- LivePositioner can be initialized with nothing, with just an entity, with an entity plus intial positioning instructions, or any combination thereof
-- If not given positionings, it supplies default initial values.
-- Position instructions must be in the format created by LivePositioner:rangeTable(...)
function LivePositioner:init(thing, pTable, eTable, sTable)
    self.subject = thing
    --[[
    local position = pTable or self:rangeTable(0.5,0.5,10.5,1000)
    local eulers = eTable or self:rangeTable(0,0,0,180)
    local scales = sTable or self:rangeTable(1,1,1,150)
    self:setNonPositioningParameters()
    self:define(self.subject, position, eulers, scales)
    ]]
end

function LivePositioner:changeSubject(thisSubject) 
    print(thisSubject)
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

-- setNonPositioningParameters sets up the watched variables and the button for saving the current settings
--[[
function LivePositioner:setNonPositioningParameters()

    SaveAndLoadFo = "There is only one save/load slot, so be careful.\n\nWhen you tap 'Save Scene' your current models and positions are stored on a tab named 'recreateScene'.\n\nIf you want to preserve a creation for good, manually copy the contents of that tab somewhere else.\n\nYou can also save just your camera position to a tab called 'restoreCameraSettings'."
    
    parameter.boolean("Save And Load Info", true, function(value)
        if value == false then
            output.clear()
            print(SaveAndLoadFo)
        end
        Save_And_Load_Info = true
    end)
    parameter.watch("Storing")
    Storing = "Only one save/load slot, so be careful. If you want to keep your current save forever, copy the contents of the 'recreateScene' tab to another location."
    parameter.action("Save Scene", 
        function() 
        EasyCraft.saveScene() 
        EasyCraft.saveCameraPlacement()
    end)

    parameter.action("Load Saved Scene",
    function() 

        entities = {}
        currentEntityIndex = 1
        currentSetIndex = 1
        currentModelIndex = 1
        
        local destroyUs = {}
        for k, v in pairs(EasyCraft.entities) do
            destroyUs[k] = v
        end      
        -- EasyCraft.entities = {}

        local newSceneParts
        if easyCraftRecreate then
            newSceneParts = easyCraftRecreate()
        end
    end)
    
    parameter.action("Save Just Camera Position", function()
        EasyCraft.saveCameraPlacement()
    end)
end
]]

-- defineLiveParameters(...) sets up the parameter controls
function LivePositioner:define(thing, pTable, eTable, sTable)
    local position = pTable or self:rangeTable(0,0,1000)
    local eulers = eTable or self:rangeTable(0,0,0,180)
    local scales = sTable or self:rangeTable(1,1,1,150,1,40)
    LivePositioner:setUpParametersWithMicroSettingOf(false)
end

function LivePositioner:setUpParametersWithMicroSettingOf(setting)
    
    --[[
    if not ModelIndexParameterCurrent then
        ModelIndexParameterCurrent = 1
        PackIndexParameterCurrent = 1
    end
    ]]
    
    parameter.clear()
    
    WelcomeString = "Welcome to LivePositioner!\n\nUse the parameter controls to make a custom scene with Codea's built-in models.\n\nYou can save your scene, and it will appear as a function called 'recreateScene()' on the the recreateScene tab.\n\nYou can then cut-and-paste that function into any project of your own, and use it for whatever you want."
    
    parameter.boolean("Show Welcome", true, function(value)
        if value == false then
            output.clear()
            print(WelcomeString)
        end
        Show_Welcome = true
    end)
    
    ModelInfo = "Codea's built-in models come in themed sets called 'packs.'\n\nThe PackChooser switches between packs, and the ModelChooser lets you quickly scroll through the models in each one."
    
    parameter.boolean("Model Choosing Info", true, function(value)
        if value == false then
            output.clear()
            print(ModelInfo)
        end
        Model_Choosing_Info = true
    end)
    
    parameter.watch("CurrentModel")
    parameter.watch("CurrentPack")
    parameter.integer("ModelChooser", 1, #modelSets[currentSetIndex], currentModelIndex, function()
        if ModelChooser > #modelSets[currentSetIndex] then
            ModelChooser = #modelSets[currentSetIndex]
        end
        currentModelIndex = ModelChooser
        local thisEntity = EasyCraft.entities[entities[currentEntityIndex] ]
        thisEntity:remove(craft.model)
        thisEntity:remove(craft.renderer)
        local newModel = craft.model(getAssetFor(currentSetIndex, ModelChooser))
        thisEntity.modelPack = modelSetNames[currentSetIndex]
        thisEntity.modelName = modelSets[currentSetIndex][ModelChooser]
        thisEntity:add(craft.renderer, newModel)
    end)
    

    parameter.integer("PackChooser", 1, #modelSets, PackIndexParameterCurrent, function()
        if PackIndexParameterCurrent ~= PackChooser then
            if currentModelIndex > #modelSets[PackChooser] then
                ModelChooser = #modelSets[PackChooser]
                currentModelIndex = ModelChooser
            end
            currentSetIndex = PackChooser
            local thisEntity = EasyCraft.entities[entities[currentEntityIndex] ]
            thisEntity:remove(craft.model)
            thisEntity:remove(craft.renderer)
            local newModel = craft.model(getAssetFor(currentSetIndex, currentModelIndex))
            thisEntity.modelPack = modelSetNames[currentSetIndex]
            thisEntity.modelName = modelSets[currentSetIndex][currentModelIndex]
            thisEntity:add(craft.renderer, newModel)
            PackIndexParameterCurrent = PackChooser
            currentModelIndex = ModelChooser
         --   if self.mostRecentMicroSetting ~= setting then
          --      self.mostRecentMicroSetting = setting
                self:setUpParametersWithMicroSettingOf(setting)
                return
         --   end
        end
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
        setSlidersTo.scale = self:rangeTable(subjectScaleX, subjectScaleY, subjectScaleZ,150,subjectScaleAll,40)
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
    
    parameter.action("Load Saved Scene",
    function()
        
        entities = {}
        currentEntityIndex = 1
        currentSetIndex = 1
        currentModelIndex = 1
        
        local destroyUs = {}
        for k, v in pairs(EasyCraft.entities) do
            destroyUs[k] = v
        end
        EasyCraft.entities = {}
        
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
        if currentEntityIndex == #entities then
            currentEntityIndex = 1
        else
            currentEntityIndex = currentEntityIndex + 1
        end
        self:changeSubject(EasyCraft.entities[entities[currentEntityIndex] ])
    end)
    
    parameter.action("Select Previous Entity", function()
        if currentEntityIndex == 1 then
            currentEntityIndex = #entities
        else
            currentEntityIndex = currentEntityIndex - 1
        end
        self:changeSubject(EasyCraft.entities[entities[currentEntityIndex] ])
    end)
    
    parameter.boolean("ShowBounds", false)
    
    
    parameter.watch("Adding")
    Adding = "Tapping 'New Entity' adds a duplicate of the current selection to the scene."
    parameter.action("New Entity", function()
        local idNumber = math.random(1,2147483647)
        local newThing = EasyCraft.makeAThing(idNumber)
        table.insert(entities, newThing.name)
        currentEntityIndex = #entities
        local currentE = getCurrentEntity()
        currentE:remove(craft.renderer)
        currentE:add(craft.renderer, craft.model(getAssetFor(currentSetIndex, currentModelIndex)))
        currentE.modelPack = modelSetNames[currentSetIndex]
        currentE.modelName = modelSets[currentSetIndex][currentModelIndex]
        print(EasyCraft.entities[entities[currentEntityIndex] ].position)
        self:changeSubject(EasyCraft.entities[entities[currentEntityIndex] ])
    end)    
    
    --self.mostRecentMicroSetting = setting
end

    
--[[
function LivePositioner:setUpParametersWithMicroSettingOf(setting)
    
    PositioningFo = "The positioning sliders let you change the placement, rotation, and size of the selected model.\n\nIf it's hard to get a model in the exact right size, place, or angle that you want, toggle 'MicroMode' on.\n\nMicroMode is for making precise adjustments and getting things juuuuuust right."
    
    parameter.boolean("Positioning Info", true, function(value)
        if value == false then
            output.clear()
            print(PositioningFo)
        end
        Positioning_Info = true
    end)
    
    parameter.boolean("MicroMode", false, function(microOn)
        if microOn ~= setting then
            setUpParametersWithMicroSettingOf(microOn)
        end
    end)
    

    
    self:setPositionsAndRanges(self:rangeTable(0,0,0,1000))
    if setting == false then
        self:setEulersAndRanges(self:rangeTable(0,0,0,180))
    elseif setting == true then
        self:setEulersAndRanges(self:rangeTable(subjectEulerX, subjectEulerY, subjectEulerZ,20))
    end
    self:setScalesAndRanges(self:rangeTable(1,1,1,150,1,40))
end
]]

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
   --     subjectScale = self.subject.scale
    end
end


--[[
-- Macro-Micro Sliders

function setup()
    scene = craft.scene()
    scene.camera.position=vec3(0,1,-4)
    
    ground = scene:entity()
    ground.model = craft.model.cube(vec3(1,.2,1))
    ground.material = craft.material(asset.builtin.Materials.Specular)
    ground.material.map = readImage(asset.builtin.Surfaces.Desert_Cliff_Roughness)
    ground.position = vec3(1,1,1)
    
    ground2 = scene:entity()
    ground2.model = craft.model.cube(vec3(1,.2,1))
    ground2.material = craft.material(asset.builtin.Materials.Specular)
    ground2.material.map = readImage(asset.builtin.Surfaces.Desert_Cliff_Roughness)
    ground2.position = vec3(-1,1,1)
    
    fill(255)
    
    setUpParametersWithMicroSettingOf(false)
end

function setUpParametersWithMicroSettingOf(setting)
    if not gx then
        gx,gy,gz = 0,0,0
        switchState = false
    end
    parameter.clear()
    parameter.boolean("Micro", setting, function(microOn)
        if microOn ~= setting then
            setUpParametersWithMicroSettingOf(microOn)
        end
    end)
    if setting == false then
        parameter.integer("gx",-180,180,gx)
        parameter.integer("gy",-180,180,gy)
        parameter.integer("gz",-180,180,gz)
    elseif setting == true then
        parameter.integer("gx",gx-10,gx+10,gx)
        parameter.integer("gy",gy-10,gy+10,gy)
        parameter.integer("gz",gz-10,gz+10,gz)
    end
    parameter.boolean("switchControlledBlock", switchState, function(bool)
        if bool == switchState then return end
        switchState = bool == true
        local newBlock, oldBlock = ground2, ground
        if switchState == true then
            newBlock, oldBlock = ground, ground2
        end
        oldBlock.displayEulers = vec3(gx,gy,gz)
        if newBlock.displayEulers then
            gx,gy,gz = newBlock.displayEulers.x, newBlock.displayEulers.y, newBlock.displayEulers.z
        else
            gx,gy,gz = 0,0,0
        end
        if setting == true then
            setUpParametersWithMicroSettingOf(true)
        end
    end)
end

function update(dt)
    if switchControlledBlock == true then
        ground2.rotation=quat.eulerAngles(gx,gy,gz)
    else
        ground.rotation=quat.eulerAngles(gx,gy,gz)
    end
    scene:update(dt)
end

function draw()
    update(DeltaTime)
    scene:draw()
    if switchControlledBlock == true then
        text("eulers control block on right",WIDTH/2,HEIGHT/2+150)
    else
        text("eulers control block on left",WIDTH/2,HEIGHT/2-150)
    end
end
]]
