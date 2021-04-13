
-- LivePositioner by ubergoober

--bugs: bounds don't scale


function setup()
    
    -- Generic stuff:
    -- Create a new craft scene
    scene = craft.scene()
    -- Set the camera position
    scene.camera.position = vec3(0,0,-10)
    --scene.camera:add(OrbitViewer, vec3(0,5,0), 23, 6, 80)
    EasyCraft.setUpBloomingEnvironment()
    -- use scene to make a new entity
    sceneEntity = EasyCraft.makeAThing("startingThing")

    
    entities = {}
    currentEntityIndex = 1
    table.insert(entities, sceneEntity.name)
    
    modelSets = {}
    currentSetIndex = 1
    currentModelIndex = 1
    
    modelSets = {}
    local characters = modelTableFromPack(asset.builtin.Blocky_Characters)
    local nature = modelTableFromPack(asset.builtin.Nature)
    local castles = modelTableFromPack(asset.builtin.CastleKit)
    local space = modelTableFromPack(asset.builtin.SpaceKit)
    local primitive = modelTableFromPack(asset.builtin.Primitives)
    local racing = modelTableFromPack(asset.builtin.RacingKit)
    local watercraft = modelTableFromPack(asset.builtin.Watercraft)
    modelSets = {characters, nature, castles, space, primitive, racing, watercraft}
    modelSetNames = {"Blocky_Characters", "Nature", "CastleKit", "SpaceKit", "Primitives", "RacingKit", "Watercraft"}
    
    --[[
    characters.liveSettings = {}
    characters.liveSettings.position = vec3(0, 0, 0)
    characters.liveSettings.eulerAngles = vec3(0, 180, 0)
    characters.liveSettings.scale = vec3(1, 1, 1)
    nature.liveSettings = {}
    nature.liveSettings.position = vec3(-11.191559, -11.191559, 29.985931)
    nature.liveSettings.eulerAngles = vec3(-0.207881, -46.731144, 1.269436)
    nature.liveSettings.scale = vec3(4.000000, 4.000000, 4.000000)
    castles.liveSettings = {}
    castles.liveSettings.position = vec3(-22.883118, -22.883118, 166.387451)
    castles.liveSettings.eulerAngles = vec3(-42.530476, 15.329292, -4.326269)
    castles.liveSettings.scale = vec3(4.000000, 4.000000, 4.00000)
    space.liveSettings = {}
    space.liveSettings.position = vec3(-11.191559, 0.500000, 135.209961)
    space.liveSettings.eulerAngles = vec3(-37.204269, 31.040045, -11.118064)
    space.liveSettings.scale = vec3(4.000000, 4.000000, 4.000000)
    ]]
    
    -- print(entities[currentEntityIndex])
    --   print(EasyCraft.entities[entities[currentEntityIndex]])
    --   print(EasyCraft.entities[entities[currentEntityIndex]].name)
    
    local currentEntity = EasyCraft.entities[entities[currentEntityIndex]]
    currentEntity:remove(craft.renderer)
    currentEntity:add(craft.renderer, craft.model(getAssetFor(1, 1)))
    
    --parameter.watch("Welcome")

    
    --[[
    parameter.watch("Model")
    parameter.watch("Pack")
    
    parameter.integer("ModelIndex", 1, #modelSets[currentSetIndex], 1, function()
        local thisEntity = EasyCraft.entities[entities[currentEntityIndex] ]
        thisEntity:remove(craft.model)
        thisEntity:remove(craft.renderer)
        local newModel = craft.model(getAssetFor(currentSetIndex, ModelIndex))
        thisEntity.modelPack = modelSetNames[currentSetIndex]
        thisEntity.modelName = modelSets[currentSetIndex][ModelIndex]
        thisEntity:add(craft.renderer, newModel)
    end)
    
    parameter.action("Next Model", function()
        currentModelIndex = currentModelIndex + 1
        if currentModelIndex > #modelSets[currentSetIndex] then
            currentModelIndex = 1
        end
        local thisEntity = EasyCraft.entities[entities[currentEntityIndex] ]
        thisEntity:remove(craft.model)
        thisEntity:remove(craft.renderer)
        local newModel = craft.model(getAssetFor(currentSetIndex, currentModelIndex))
        thisEntity.modelPack = modelSetNames[currentSetIndex]
        thisEntity.modelName = modelSets[currentSetIndex][currentModelIndex]
        thisEntity:add(craft.renderer, newModel)
    end)
    
    parameter.action("Previous Model", function()
        local thisEntity = EasyCraft.entities[entities[currentEntityIndex] ]
        thisEntity:remove(craft.model)
        thisEntity:remove(craft.renderer)
        currentModelIndex = currentModelIndex - 1
        if currentModelIndex == 0 then
            currentModelIndex = #modelSets[currentSetIndex]
        end
        local newModel = craft.model(getAssetFor(currentSetIndex, currentModelIndex))
        thisEntity.modelPack = modelSetNames[currentSetIndex]
        thisEntity.modelName = modelSets[currentSetIndex][currentModelIndex]
        thisEntity:add(craft.renderer, newModel)
    end)
    
    parameter.action("Next Pack", function()
        currentSetIndex = currentSetIndex + 1
        if currentSetIndex > #modelSets then
            currentSetIndex = 1
        end
        if currentModelIndex > #modelSets[currentSetIndex] then
            currentModelIndex = 1
        end
        --   livePositioner:useTablesIn(modelSets[currentSetIndex].liveSettings)
        local thisEntity = EasyCraft.entities[entities[currentEntityIndex] ]
        thisEntity:remove(craft.model)
        thisEntity:remove(craft.renderer)
        local newModel = craft.model(getAssetFor(currentSetIndex, currentModelIndex))
        thisEntity.modelPack = modelSetNames[currentSetIndex]
        thisEntity.modelName = modelSets[currentSetIndex][currentModelIndex]
        thisEntity:add(craft.renderer, newModel)
    end)
    
    parameter.action("Previous Pack", function()
        local thisEntity = EasyCraft.entities[entities[currentEntityIndex] ]
        thisEntity:remove(craft.model)
        thisEntity:remove(craft.renderer)
        currentSetIndex = currentSetIndex - 1
        if currentSetIndex == 0 then
            currentSetIndex = #modelSets
        end
        if currentModelIndex > #modelSets[currentSetIndex] then
            currentModelIndex = 1
        end
        --     livePositioner:useTablesIn(modelSets[currentSetIndex].liveSettings)
        local newModel = craft.model(getAssetFor(currentSetIndex, currentModelIndex))
        thisEntity:add(craft.renderer, newModel)
        thisEntity.modelPack = modelSetNames[currentSetIndex]
        thisEntity.modelName = modelSets[currentSetIndex][currentModelIndex]
    end)
    ]]
    
    --[[
    parameter.watch("Selecting")
    Selecting = "The selected entity can be positioned and changed. ShowBounds highlights the current selection."
    
    parameter.action("Select Next Entity", function()
        if currentEntityIndex == #entities then
            currentEntityIndex = 1
        else
            currentEntityIndex = currentEntityIndex + 1
        end
        livePositioner:changeSubject(EasyCraft.entities[entities[currentEntityIndex] ])
    end)
    
    parameter.action("Select Previous Entity", function()
        if currentEntityIndex == 1 then
            currentEntityIndex = #entities
        else
            currentEntityIndex = currentEntityIndex - 1
        end
        livePositioner:changeSubject(EasyCraft.entities[entities[currentEntityIndex] ])
    end)
    
    parameter.boolean("ShowBounds", false)
    
    
    parameter.watch("Adding")
    Adding = "Tapping 'New Entity' adds a duplicate of the current selection to the scene."
    parameter.action("New Entity", function()
        local idNumber = math.random(1,99999999)
        local newThing = EasyCraft.makeAThing(idNumber)
        table.insert(entities, newThing.name)
        currentEntityIndex = #entities
        local currentE = getCurrentEntity()
        currentE:remove(craft.renderer)
        currentE:add(craft.renderer, craft.model(getAssetFor(currentSetIndex, currentModelIndex)))
        currentE.modelPack = modelSetNames[currentSetIndex]
        currentE.modelName = modelSets[currentSetIndex][currentModelIndex]
        print(EasyCraft.entities[entities[currentEntityIndex] ].position)
        livePositioner:changeSubject(EasyCraft.entities[entities[currentEntityIndex] ])
    end)
    ]]
    
   -- clearAndRefreshParameters()

            -- Initialize a LivePositioner with the entity to be positioned
            livePositioner = LivePositioner(sceneEntity)
            --livePositioner:define(sceneEntity, ptables, etables, stables)
            --    livePositioner:useTablesIn(characters.liveSettings)
            livePositioner:setUpParametersWithMicroSettingOf(false)
            
            if restoreCameraSettings then
                restoreCameraSettings()
            else
                viewer = scene.camera:add(OrbitViewer, EasyCraft.entities[entities[currentEntityIndex]].position, 23, 6, 80)
            end
                    
                    EasyCraft.makeAThing()
end

--[[
function setUpParametersWithMicroSettingOf(isMicro, positioner)
    
    if not ModelIndexParameterCurrent then
        ModelIndexParameterCurrent = 1
        PackIndexParameterCurrent = 1
    end

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
    parameter.integer("ModelChooser", 1, #modelSets[currentSetIndex], ModelIndexParameterCurrent, function()
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
    
    parameter.watch("CurrentPack")
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
            ModelIndexParameterCurrent = ModelChooser
            setUpParametersWithMicroSettingOf(isMicro, positioner)
        end
    end)
    
    positioner:define()
    positioner:setNonPositioningParameters()
    
    parameter.watch("Selecting")
    Selecting = "The selected entity can be positioned and changed. ShowBounds highlights the current selection."
    
    parameter.action("Select Next Entity", function()
        if currentEntityIndex == #entities then
            currentEntityIndex = 1
        else
            currentEntityIndex = currentEntityIndex + 1
        end
        livePositioner:changeSubject(EasyCraft.entities[entities[currentEntityIndex] ])
    end)
    
    parameter.action("Select Previous Entity", function()
        if currentEntityIndex == 1 then
            currentEntityIndex = #entities
        else
            currentEntityIndex = currentEntityIndex - 1
        end
        livePositioner:changeSubject(EasyCraft.entities[entities[currentEntityIndex] ])
    end)
    
    parameter.boolean("ShowBounds", false)
    
    
    parameter.watch("Adding")
    Adding = "Tapping 'New Entity' adds a duplicate of the current selection to the scene."
    parameter.action("New Entity", function()
        local idNumber = math.random(1,99999999)
        local newThing = EasyCraft.makeAThing(idNumber)
        table.insert(entities, newThing.name)
        currentEntityIndex = #entities
        local currentE = getCurrentEntity()
        currentE:remove(craft.renderer)
        currentE:add(craft.renderer, craft.model(getAssetFor(currentSetIndex, currentModelIndex)))
        currentE.modelPack = modelSetNames[currentSetIndex]
        currentE.modelName = modelSets[currentSetIndex][currentModelIndex]
        print(EasyCraft.entities[entities[currentEntityIndex] ].position)
        livePositioner:changeSubject(EasyCraft.entities[entities[currentEntityIndex] ])
    end)
    

end
]]

function getCurrentEntity()
    return EasyCraft.entities[entities[currentEntityIndex]]
end

function getAssetFor(packIndex, nameIndex)
    return asset.builtin[modelSetNames[packIndex]][modelSets[packIndex][nameIndex]]
end

function filenameFromModel(model)
    local vs = tostring(model)
    local endIndex = string.find(vs, "path:")
    return string.sub(vs, 12, endIndex - 3) -- 12 removes "Asset Key:", -3 removes " ("
end

function modelTableFromPack(assetPack)
    local modelTable = {}
    for k,v in pairs(assetPack.all) do
        if v.type == MODELS then
            local vs = filenameFromModel(v)
            table.insert(modelTable, vs)
        end
    end
    return modelTable
end

function setViewer(givenScene)
    touches.handlers = {}
    -- Add classname OrbitViewer to the camera as a component
    -- Note that other parameters must be passed in as well:
    -- targetPoint, startingDistance, minDistance, and maxDistance
    givenScene.camera:add(OrbitViewer, vec3(0,5,0), 23, 6, 80)
    -- Change the output text and the screen title
    printExplanation(nameString)
end

function update(dt)
    -- Generic stuff:
    -- Update the scene (physics, transforms etc)
    scene:update(dt)
    -- LivePositioner stuff:
    -- Update the LivePositioner
    livePositioner:update()
    
    if ShowBounds then -- bounds don't scale
        -- for k,v in pairs(modelSets[currentSetIndex]) do
        local b = EasyCraft.entities[entities[currentEntityIndex]]:get(craft.renderer).model.bounds
        b2 = bounds(b.min, b.max)
        b2:translate(EasyCraft.entities[entities[currentEntityIndex]].position)
        scene.debug:bounds(b2, color(255,255,255,255))
        --   end
    end
end

-- Called automatically by codea
function draw()
    update(DeltaTime)
    
    -- Draw the scene
    scene:draw()
    
    CurrentModel = modelSets[currentSetIndex][currentModelIndex]
    CurrentPack = modelSetNames[currentSetIndex]
    
    --[[
    pushMatrix()
    translate(viewer.target)
    sprite(asset.builtin.UI.Blue_Box_Tick)
    popMatrix()
    ]]
end

function touched(touch)
    touches.touched(touch)
end