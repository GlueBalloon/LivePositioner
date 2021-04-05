    
function recreateScene()
    
    local scene = scene
    if not scene then
        scene = craft.scene()
    end
    
    local sceneTable = {}
    sceneTable.entities = {}
    
    
    local newEntity = scene:entity()
    newEntity.position = vec3(15.564935, -18.201298, 43.573593)
    newEntity.eulerAngles = vec3(164.415604, -74.372284, 179.999985)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Man.obj"
    newEntity.name = "20773217"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Man.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-21.491343, -37.422077, 20.196970)
    newEntity.eulerAngles = vec3(0.000000, -0.000000, 0.000000)
    newEntity.scale = vec3(20.000000, 20.000000, 20.000000)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_146.obj"
    newEntity.name = "17868578"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_146.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(0.000000, -36.902596, 0.000000)
    newEntity.eulerAngles = vec3(0.000000, -0.000000, -15.584422)
    newEntity.scale = vec3(14.480471, 14.480471, 14.480471)
    newEntity.modelPack = "Watercraft"
    newEntity.modelName = "watercraftPack_007.obj"
    newEntity.name = "startingThing"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Watercraft"]["watercraftPack_007.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(0.000000, -12.660173, 11.019481)
    newEntity.eulerAngles = vec3(178.359146, 89.955765, -179.909256)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Woman.obj"
    newEntity.name = "31998308"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Woman.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(23.703463, 40.500000, 24.352814)
    newEntity.eulerAngles = vec3(0.000000, -0.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Robot.obj"
    newEntity.name = "27421333"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Robot.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(11.928572, 3.270563, -15.820346)
    newEntity.eulerAngles = vec3(-8.826623, -0.166178, 3.344938)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Soldier.obj"
    newEntity.name = "63049979"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Soldier.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    return sceneTable
    
end