
-- LivePositioner by ubergoober

--[[bugs and to-do 
 - When using selection controls, model chooser slider maximum amount doesn't change to match number of items in selected entity's model pack
 - not really a bug but it would be cool if we could dynamically apply a glow to the selected entity, instead of using a bounding box
 - make rotation range larger in micro mode
 - expose entity ids
 - Add check for existing ID numbers when creating randomized ids.
]]

function setup()
    perspective(45,WIDTH/HEIGHT,0.1,100000000)
    scene = craft.scene()
    scene.camera.position = vec3(0,0,-10)

    local sunny = readText(asset.builtin.Environments.Night)
    local env = craft.cubeTexture(json.decode(sunny))
    scene.sky.material.envMap = env
    
    firstEntity = EasyCraft.makeAThing("startingThing")
    
    local characters = modelTableFromPack(asset.builtin.Blocky_Characters)
    local nature = modelTableFromPack(asset.builtin.Nature)
    local castles = modelTableFromPack(asset.builtin.CastleKit)
    local space = modelTableFromPack(asset.builtin.SpaceKit)
    local primitive = modelTableFromPack(asset.builtin.Primitives)
    local racing = modelTableFromPack(asset.builtin.RacingKit)
    local watercraft = modelTableFromPack(asset.builtin.Watercraft)
    
    local packs = {characters, nature, castles, space, primitive, racing, watercraft}
    local packNames = {"Blocky_Characters", "Nature", "CastleKit", "SpaceKit", "Primitives", "RacingKit", "Watercraft"}
    
    livePositioner = LivePositioner(firstEntity, packs, packNames, scene)
    livePositioner:setUpBloomingEnvironment()
    livePositioner:setUpParametersWithMicroSettingOf(false)
    livePositioner:loadSavedScene()
    
    if restoreCameraSettings then
        restoreCameraSettings()
    else
        viewer = scene.camera:add(OrbitViewer, getCurrentEntity().position, 23, 6, 800)
    end
end

function getCurrentEntity()
    return EasyCraft.entityTableByNames[ EasyCraft.entityNames[livePositioner.currentEntityIndex] ]
end

function getAssetFor(packIndex, nameIndex)
    return asset.builtin[livePositioner.modelSetNames[packIndex] ][livePositioner.modelSets[packIndex][nameIndex] ]
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

function update(dt)
    -- Generic stuff:
    -- Update the scene (physics, transforms etc)
    scene:update(dt)
    -- LivePositioner stuff:
    -- Update the LivePositioner
    livePositioner:update()

    --[[
    if not Highlight then
        local currentBaby = getCurrentEntity()
        local b = currentBaby:get(craft.renderer).model.bounds
        local boundsScaledBase = vec3(b.max.x * currentBaby.scale.x, b.max.y * currentBaby.scale.y, b.max.z * currentBaby.scale.z)
        local boundsMin =   vec3(b.min.x * currentBaby.scale.x, b.min.y * currentBaby.scale.y, b.min.z * currentBaby.scale.z)
        local boundsMax =   vec3(boundsScaledBase.x, boundsScaledBase.y,  boundsScaledBase.z)
        b2 = bounds(boundsMin, boundsMax)
        b2:translate(currentBaby.position)
        scene.debug:bounds(b2, color(255,255,255,255))
    end
    ]]
end

-- Called automatically by codea
function draw()
    update(DeltaTime)  
    scene:draw()
end

function touched(touch)
    touches.touched(touch)
end