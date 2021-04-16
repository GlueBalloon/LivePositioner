
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

    currentEntityIndex = 1
    
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
    
    
    local currentEntity = getCurrentEntity()          
    currentEntity:remove(craft.renderer)
    currentEntity:add(craft.renderer, craft.model(getAssetFor(1, 1)))
    livePositioner = LivePositioner(sceneEntity)
    livePositioner:setUpParametersWithMicroSettingOf(false)
    
    if restoreCameraSettings then
        restoreCameraSettings()
    else
        viewer = scene.camera:add(OrbitViewer, currentEntity.position, 23, 6, 80)
    end
end

function getCurrentEntity()
    return EasyCraft.entities[ EasyCraft.entityNames[currentEntityIndex] ]
end

function getAssetFor(packIndex, nameIndex)
  --  return asset.builtin[modelSetNames[packIndex]][modelSets[packIndex][nameIndex]]
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

    local currentBaby = getCurrentEntity()
    if ShowBounds then -- bounds don't scale
        local b = currentBaby:get(craft.renderer).model.bounds
        local boundsScaledBase = vec3(b.max.x * currentBaby.scale.x, b.max.y * currentBaby.scale.y, b.max.z * currentBaby.scale.z)
        local boundsMin =   vec3(b.min.x * currentBaby.scale.x, b.min.y * currentBaby.scale.y, b.min.z * currentBaby.scale.z)
        local boundsMax =   vec3(boundsScaledBase.x, boundsScaledBase.y,  boundsScaledBase.z)
        b2 = bounds(boundsMin, boundsMax)
        b2:translate(currentBaby.position)
        scene.debug:bounds(b2, color(255,255,255,255))
        --   end
    end
end

-- Called automatically by codea
function draw()
    update(DeltaTime)  
    scene:draw()
    CurrentModel = modelSets[currentSetIndex][currentModelIndex]
    CurrentPack = modelSetNames[currentSetIndex]
end

function touched(touch)
    touches.touched(touch)
end