function recreateScene()
            
    local sceneParts = {}
    sceneParts.entities = {} 
            
    local newEntity = scene:entity()
    newEntity.position = vec3(755.366882, 847.867493, 517.369324)
    newEntity.eulerAngles = vec3(139.907806, 26.146563, -159.243820)
    newEntity.scale = vec3(535.817383, 927.432617, 746.204956)
    newEntity.modelPack = "Watercraft"
    newEntity.modelName = "watercraftPack_003_obj"
    newEntity.name = "Test Entity"        
    sceneParts.entities['Test Entity'] = newEntity
    return sceneParts    
end    