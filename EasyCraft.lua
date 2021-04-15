function testEasyCraft()
    
    CodeaUnit.detailed = true
    CodeaUnit.skip = false
    
    _:describe("Testing EasyCraft", function()
        _:before(function()
        end)
        _:after(function()
        end)
        
        
        _:test("makeAThing() creates entity when called without parameters", function()
            local entity = EasyCraft.makeAThing()
            _:expect(tostring(entity)).is("entity")
        end)
        
        
        _:test("makeAThing() creates correct name, position, rotation, scale, and model", function()
            local name = "Joe Entity"
            local position = vec3(19, 22, 3.333)
            local rotation = vec3(-26.973995, -30.679983, -28.186922)
            local eScale = vec3(99, 5, 2)
            local modelPack = "Watercraft"
            local modelName = "watercraftPack_003_obj"
            local entity = EasyCraft.makeAThing(name, modelPack, modelName, position, rotation, eScale)
            --eulerAngles can be expressed different ways, so the 'set' value may be different from the 'get' value
            --that's why this little jig here is necessary:
            local angleAdjuster = scene:entity()
            angleAdjuster.eulerAngles = vec3(-26.973995, -30.679983, -28.186922)
            local regurgutatedEulers = angleAdjuster.eulerAngles
            _:expect("--a: name assignment", entity.name).is(name)
            _:expect("--b: position assignment", tostring(entity.position)).is(tostring(position))
            _:expect("--c: rotation assignment", tostring(entity.eulerAngles)).is(tostring(regurgutatedEulers))
            _:expect("--d: scale assignment", tostring(entity.scale)).is(tostring(eScale))
            _:expect("--e: modelName", entity.modelName).is(modelName)
        end)
        
        
        _:test("writing to a tab does not crash", function()
            saveProjectTab("temporaryTab", "--testMeaninglessString")
            local infoString = "can't really test this. just sit there and see if it crashes"
            _:expect(infoString).is(infoString)
        end)
        
        
        _:test("deleting a tab does not crash", function()
            saveProjectTab("temporaryTab", nil)
            local infoString = "can't really test this. just sit there and see if it crashes"
            _:expect(infoString).is(infoString)
        end)
        
        
        _:test("reading from a tab that was just written to does not crash", function()
            local saveString = "--testAnotherMeaninglessString"
            saveProjectTab("readWriteTab", saveString)
            local returned = readProjectTab("readWriteTab")
            saveProjectTab("readWriteTab", nil)
            _:expect(returned).is(saveString)
        end)
        
        
        _:test("reading, loading, and calling a function saved to a tab works", function()
            local stringToReturn = "anotherMeaninglessString"
            saveProjectTab("meaninglessTab", [[
function meaninglessFunction()
    local anotherMeaninglessString = ']]..stringToReturn..[['
    return anotherMeaninglessString
end]])
        local tab = readProjectTab("meaninglessTab")
        load(tab)()
        local result = meaninglessFunction()
        saveProjectTab("meaninglessTab", nil) --deletes
        _:expect(stringToReturn).is(result)
    end)
        
    
    _:test("string wrapped in function ran properly", function()
        local successString = "successfully returned this"
        local dataString = [[   return ']]..successString..[[']]
        local returnedFunctionString = EasyCraft.stringWrappingStringInFunctionNamed("returnThatStringBaby", dataString)
        saveProjectTab("functionTab", returnedFunctionString)
        local tab = readProjectTab("functionTab")
        load(tab)()
        local returnedString = returnThatStringBaby()
        saveProjectTab("functionTab", nil) --deletes
        _:expect("string wrapped in function ran properly", successString).is(returnedString)
    end)
    
    
        _:test("recreateScene() returns entity table", function()
            local recreateString = [[ 
             
    local sceneParts = {}
    sceneParts.entities = {}
    return sceneParts       
        ]]
        local returnedFunctionString = EasyCraft.stringWrappingStringInFunctionNamed("recreateScene", recreateString)
        saveProjectTab("recreateSceneTableTest", returnedFunctionString)
        local tab = readProjectTab("recreateSceneTableTest")
        load(tab)()
        local returnedTable = recreateScene()
        _:expect(string.sub(tostring(returnedTable.entities), 1, 5)).is("table")
        saveProjectTab("recreateSceneTableTest", nil)
        end)
        
    
    _:test("entity table stores an entity by name", function()
        local newEntity = EasyCraft.makeAThing("testEntity")
        local recreateString = [[
    local sceneParts = {}
    sceneParts.entities = {}
    local recreatedEntity = scene:entity()
    recreatedEntity.name = ']]..newEntity.name..[['
    sceneParts.entities.]]..newEntity.name..[[ = recreatedEntity
    return sceneParts
        ]]
        local returnedFunctionString = EasyCraft.stringWrappingStringInFunctionNamed("recreateScene", recreateString)
        saveProjectTab("recreateSceneKeyTest", returnedFunctionString)
        local tab = readProjectTab("recreateSceneKeyTest")
        load(tab)()
        local returnedTable = recreateScene()
        _:expect(tostring(returnedTable.entities[newEntity.name])).is("entity")
        saveProjectTab("recreateSceneKeyTest", nil)
    end)
    
    
    _:test("entity from table has right values", function()
        local entity, name, modelPack, modelName, position, rotation, eScale, entityString
        name = "Test Entity"
        position = EasyCraft.randomVec3()
        rotation = EasyCraft.randomVec3()
        eScale = EasyCraft.randomVec3()
        modelPack = "Watercraft"
        modelName = "watercraftPack_003_obj"
        entity = EasyCraft.makeAThing(name, modelPack, modelName, position, rotation, eScale) --changes eulerAngles once
        entityString = EasyCraft.stringForRecreatingEntity(entity)
        entityString = [[
        
    local sceneParts = {}
    sceneParts.entities = {} 
        ]]..entityString..[[
        
    sceneParts.entities[']]..entity.name..[['] = newEntity
    return sceneParts]]
        local returnedFunctionString = EasyCraft.stringWrappingStringInFunctionNamed("recreateScene", entityString)
        saveProjectTab("recreateSceneTest", returnedFunctionString)
        local tab = readProjectTab("recreateSceneTest")
        load(tab)()
        local returnedTable = recreateScene() --new entity will have eulerAngles changed twice
        local entity2 = returnedTable.entities[entity.name]
        entity.eulerAngles = entity.eulerAngles --adjusts eulerAngles a second time for first entity
        _:expect(EasyCraft.entitiesHaveSameBasicProperties(entity, entity2)).is(true)
        saveProjectTab("recreateSceneTest", nil)
    end)

    
    _:test("saveScene() makes recreateScene() that returns right number of entities", function()
        local preservedEntities = EasyCraft.entities
        EasyCraft.entities = {}
        local randomAmount = math.random(25)
        for i=1, randomAmount do
            local modelPack, modelName, position, rotation, eScale
            position = EasyCraft.randomVec3()
            rotation = EasyCraft.randomVec3()
            eScale = EasyCraft.randomVec3()
            modelPack = "Watercraft"
            modelName = "watercraftPack_003_obj"
            EasyCraft.makeAThing("testThing"..tostring(i), modelPack, modelName, position, rotation, eScale) --changes eukerAngles once
           -- local thing = EasyCraft.makeAThing("testThing"..tostring(i))
           -- print("newThing name: "..thing.name)
         --   for k,v in pairs(EasyCraft.entities) do
           --     print(k, v)
         --   end
         --   print("thing by key: "..EasyCraft.entities[thing.name].name)
        end
        --[[
        local entityCountEC = 0
        for k, v in pairs(EasyCraft.entities) do
            entityCountEC = entityCountEC + 1
        end
        print("entities in EasyCraft.entities = "..entityCountEC)
          ]]
        EasyCraft.saveScene()
        local tab = readProjectTab("recreateScene")
        load(tab)()
        local returnedTable = recreateScene()        
        local entityCount = 0
        for k, v in pairs(returnedTable.entities) do
            entityCount = entityCount + 1
        end      
       -- print("entities in returnedTable.entities = "..entityCount)      
        _:expect(entityCount).is(randomAmount)
        EasyCraft.entities = preservedEntities
        end)  
    end)
end

EasyCraft = class()
EasyCraft.entities = {}

EasyCraft.randomVec3 = function()
local x, y, z
x = math.random(0, 99999999) * 0.00001
y = math.random(0, 99999999) * 0.00001
z = math.random(0, 99999999) * 0.00001
return vec3(x,y,z)
end

EasyCraft.makeAThing = function(name, modelPack, modelName, positionVec3, rotationVec3, scaleVec3, sliderEulers)
    local newEntity = scene:entity()
    newEntity.name = name or "entityMadeAt"..tostring(os.clock())
    newEntity.position = positionVec3 or newEntity.position
    newEntity.eulerAngles = rotationVec3 or newEntity.eulerAngles
    if sliderEulers then
        newEntity.rotation = quat.eulerAngles(sliderEulers.x, sliderEulers.y, sliderEulers.z)
    end
    newEntity.sliderEulers = sliderEulers or vec3(0,0,0)
    newEntity.scale = scaleVec3 or newEntity.scale
    newEntity.modelPack = modelPack or "Blocky_Characters"
    newEntity.modelName = modelName or "Adventurer.obj"
    newEntity.model = craft.model(asset.builtin[newEntity.modelPack][newEntity.modelName])
    EasyCraft.entities[newEntity.name] = newEntity
    
    --[[
    material = craft.material(asset.builtin.Materials.Basic)
    newEntity.material = material
    newEntity.material.map = readImage(asset.builtin.Blocky_Characters.AdventurerSkin)
    newEntity.material.diffuse = vec3(2.5,1.5,4)
    ]]
    
    return newEntity
end

EasyCraft.setUpBloomingEnvironment = function()
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
end

EasyCraft.stringWrappingStringInFunctionNamed = function(functionName, dataString)
    return [[
function ]]..functionName..[[()
    ]]..dataString..[[
    
end    ]]
end


EasyCraft.stringForRecreatingEntity = function(entity)
  --  print(entity.name)
return [[
    
    local newEntity = scene:entity()
    newEntity.position = vec3]]..tostring(entity.position).."\n"..[[
    newEntity.eulerAngles = vec3]]..tostring(entity.eulerAngles).."\n"..[[
    newEntity.scale = vec3]]..tostring(entity.scale).."\n"..[[
    newEntity.sliderEulers = vec3]]..tostring(entity.sliderEulers).."\n"..[[
    newEntity.modelPack = "]]..entity.modelPack..'"'.."\n"..[[
    newEntity.modelName = "]]..entity.modelName..'"'.."\n"..[[
    newEntity.name = "]]..entity.name..[["]]
end

EasyCraft.stringForEasyCraftRecreatingEntity = function(entity)
    return [[   
    local newEntity = EasyCraft.makeAThing("]]..entity.name..[[", "]]..entity.modelPack..[[", "]]..entity.modelName..[[", vec3]]..tostring(entity.position)..[[, vec3]]..tostring(entity.eulerAngles)..[[, vec3]]..tostring(entity.scale)..[[, vec3]]..tostring(entity.sliderEulers)..[[) 
newEntity.rotation = quat.eulerAngles]]..tostring(entity.sliderEulers).."\n"
end

EasyCraft.entitiesHaveSameBasicProperties = function(entity1, entity2)
    local sameName, samePosition, sameRotation, sameScale, samePackName, sameModelName
    sameName = entity1.name == entity2.name
    samePosition = entity1.position == entity2.position
    sameRotation = entity1.eulerAngles == entity2.eulerAngles
    sameScale = entity1.scale == entity2.scale
    sameSliderEulers = entity1.sliderEulers == entity2.sliderEulers
    samePackName = entity1.modelPack == entity2.modelPack
    sameModelName = entity1.modelName == entity2.modelName
    print(entity1.name, entity2.name)
    print(sameName)
    print(entity1.position, entity2.position)
    print(samePosition)
    print(entity1.eulerAngles, entity2.eulerAngles)
    print(sameRotation)
    print(entity1.scale, entity2.scale)
    print(sameScale)
    print(entity1.sliderEulers, entity2.sliderEulers)
    print(sameSliderEulers)
    print(entity1.modelPack, entity2.modelPack)
    print(samePackName)
    print(entity1.modelName, entity2.modelName)
    print(sameModelName)
    return sameName and samePosition and sameRotation and sameScale and samePackName and sameModelName and sameSliderEulers
end

EasyCraft.saveScene = function ()
    local entitiesString = ""
    local easyCraftEntitiesString = ""
    
    for k, entity in pairs(EasyCraft.entities) do
        entitiesString = entitiesString..EasyCraft.stringForRecreatingEntity(entity).."\n\n"..[[
        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["]]..entity.modelPack..[["]["]]..entity.modelName..[["])
    newEntity:add(craft.renderer, newModel)
        
        ]]
        easyCraftEntitiesString = easyCraftEntitiesString..EasyCraft.stringForEasyCraftRecreatingEntity(entity)..[[       
    sceneTable.entities[newEntity.name] = newEntity
    table.insert(entities, newEntity.name)
                ]]
       -- entitiesString = ""..entitiesString.."\n".."       table.insert(sceneTable.entities, EasyCraft.makeAThing())\n"
     --   print("string is"..entitiesString)
    end
    --[[
    
    local entitiesString = ""
    for k, storedEntity in pairs(EasyCraft.entities) do
        print(k.name)
        entitiesString = entitiesString..stringForEntity(storedEntity)
    end
    
      ]]
    
    local dataString = [[    
function recreateScene()
    
    local scene = scene
    if not scene then
        scene = craft.scene()
    end
    
    local sceneTable = {}
    sceneTable.entities = {}
    ]].."\n"..entitiesString..[[
    
    return sceneTable
    
end]]
    saveProjectTab("recreateScene", dataString)
    
    local easyCraftDataString = [[
function easyCraftRecreate()
        
    local scene = scene
    if not scene then
        scene = craft.scene()
    end
        
    local sceneTable = {}
    sceneTable.entities = {}
    ]]..easyCraftEntitiesString..[[
        
    return sceneTable
        
end]]
    
    saveProjectTab("easyCraftRecreate", easyCraftDataString)
    
end

EasyCraft.saveCameraPlacement = function()
    --[[
    local rySignRememberer = 1
    local adjustedRy = viewer.ry
    if viewer.ry < 0 then
        rySignRememberer = -1
    end
    if viewer.ry > 180 then
        adjustedRy = ((viewer.ry % 180) - 180) * rySignRememberer
    elseif viewer.ry < -180 then
        adjustedRy = 180 - 180 - (viewer.ry % 180)
    end
    ]]
    function reduce(ang)
        local a=ang%180
        if (ang//180)%2~=0 then
            a=a-180
        end
        return(a)
    end
    adjustedRy = reduce(viewer.ry)
    local dataString = [[
    function restoreCameraSettings(target)
        local targetToUse = target or vec3(0,0,0)
        -- parameters after viewer are target position, initial distance, min dist, max dist
        viewer = scene.camera:add(OrbitViewer, targetToUse, 30, 10, 1000)
        
        --rx and ry control camera placement, though not like you'd think
        --it's all relative to the target
        --positive ry rotates you clockwise around the target, using normal degrees, with 180 being completely behind
        --negative ry rotates you counter-clockwise around the target, so -180 is also completely behind
        --positive rx moves you above the target, with 90 or more being directly overhead
        --negative rx moves you below the target, with -90 or more being directly under
        viewer.ry = ]]..tostring(adjustedRy).."\n"..[[
        viewer.rx = ]]..tostring(viewer.rx).."\n"..[[
        viewer.zoom = ]]..tostring(viewer.zoom).."\n"..[[
        viewer.target = target or vec3]]..tostring(viewer.target).."\nend"
        saveProjectTab("restoreCameraSettings",dataString)
        print("Settings saved to tab \"restoreCameraSettings\"")
    end
