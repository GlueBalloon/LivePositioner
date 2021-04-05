function easyCraftRecreate()
        
    local scene = scene
    if not scene then
        scene = craft.scene()
    end
        
    local sceneTable = {}
    sceneTable.entities = {}
       
    local newEntity = EasyCraft.makeAThing("28929240", "Blocky_Characters", "Adventurer.obj", vec3(0.000000, 0.000000, 0.000000), vec3(0.000000, -0.000000, 0.000000), vec3(1.000000, 1.000000, 1.000000))        
    sceneTable.entities[newEntity.name] = newEntity
    table.insert(entities, newEntity.name)
                   
    local newEntity = EasyCraft.makeAThing("82251019", "Blocky_Characters", "Adventurer.obj", vec3(0.000000, 0.000000, 0.000000), vec3(0.000000, -0.000000, 0.000000), vec3(1.000000, 1.000000, 1.000000))        
    sceneTable.entities[newEntity.name] = newEntity
    table.insert(entities, newEntity.name)
                   
    local newEntity = EasyCraft.makeAThing("startingThing", "Blocky_Characters", "Adventurer.obj", vec3(0.000000, 0.000000, 0.000000), vec3(0.000000, -0.000000, 0.000000), vec3(1.000000, 1.000000, 1.000000))        
    sceneTable.entities[newEntity.name] = newEntity
    table.insert(entities, newEntity.name)
                   
    local newEntity = EasyCraft.makeAThing("81443069", "Blocky_Characters", "Adventurer.obj", vec3(0.000000, 0.000000, 0.000000), vec3(0.000000, -0.000000, 0.000000), vec3(1.000000, 1.000000, 1.000000))        
    sceneTable.entities[newEntity.name] = newEntity
    table.insert(entities, newEntity.name)
                   
    local newEntity = EasyCraft.makeAThing("33150462", "Blocky_Characters", "Adventurer.obj", vec3(0.000000, 0.000000, 0.000000), vec3(0.000000, -0.000000, 0.000000), vec3(1.000000, 1.000000, 1.000000))        
    sceneTable.entities[newEntity.name] = newEntity
    table.insert(entities, newEntity.name)
                   
    local newEntity = EasyCraft.makeAThing("41610551", "Blocky_Characters", "Adventurer.obj", vec3(0.000000, 0.000000, 0.000000), vec3(0.000000, -0.000000, 0.000000), vec3(1.000000, 1.000000, 1.000000))        
    sceneTable.entities[newEntity.name] = newEntity
    table.insert(entities, newEntity.name)
                        
    return sceneTable
        
end