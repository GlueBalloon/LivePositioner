    
function recreateScene()
    
    local scene = scene
    if not scene then
        scene = craft.scene()
    end
    
    local sceneTable = {}
    sceneTable.entities = {}
    
    
    local newEntity = scene:entity()
    newEntity.position = vec3(212.670364, 61.569210, 619.639648)
    newEntity.eulerAngles = vec3(-158.157379, 41.509926, 170.633041)
    newEntity.scale = vec3(171.743256, 269.588959, 32.511768)
    newEntity.modelPack = "Watercraft"
    newEntity.modelName = "watercraftPack_003_obj"
    newEntity.name = "testThing1"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Watercraft"]["watercraftPack_003_obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(466.595825, 433.525269, 143.720764)
    newEntity.eulerAngles = vec3(49.006489, -76.253029, 55.252296)
    newEntity.scale = vec3(121.515358, 409.778625, 290.425964)
    newEntity.modelPack = "Watercraft"
    newEntity.modelName = "watercraftPack_003_obj"
    newEntity.name = "testThing2"

        
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Watercraft"]["watercraftPack_003_obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    return sceneTable
    
end