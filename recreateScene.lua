    
function recreateScene()
    
    local scene = scene
    if not scene then
        scene = craft.scene()
    end
    
    local sceneTable = {}
    sceneTable.entities = {}
    
    
    local newEntity = scene:entity()
    newEntity.position = vec3(0.000000, 0.000000, 0.000000)
    newEntity.eulerAngles = vec3(0.000000, -0.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Adventurer.obj"
    newEntity.name = "28929240"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Adventurer.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(0.000000, 0.000000, 0.000000)
    newEntity.eulerAngles = vec3(0.000000, -0.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Adventurer.obj"
    newEntity.name = "82251019"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Adventurer.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(0.000000, 0.000000, 0.000000)
    newEntity.eulerAngles = vec3(0.000000, -0.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Adventurer.obj"
    newEntity.name = "startingThing"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Adventurer.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(0.000000, 0.000000, 0.000000)
    newEntity.eulerAngles = vec3(0.000000, -0.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Adventurer.obj"
    newEntity.name = "81443069"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Adventurer.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(0.000000, 0.000000, 0.000000)
    newEntity.eulerAngles = vec3(0.000000, -0.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Adventurer.obj"
    newEntity.name = "33150462"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Adventurer.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(0.000000, 0.000000, 0.000000)
    newEntity.eulerAngles = vec3(0.000000, -0.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Adventurer.obj"
    newEntity.name = "41610551"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Adventurer.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    return sceneTable
    
end