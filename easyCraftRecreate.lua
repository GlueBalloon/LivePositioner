function easyCraftRecreate()
        
    local scene = scene
    if not scene then
        scene = craft.scene()
    end
        
    local sceneTable = {}
    sceneTable.entities = {}
       
    local newEntity = EasyCraft.makeAThing("20773217", "Blocky_Characters", "Man.obj", vec3(15.564935, -18.201298, 43.573593), vec3(164.415604, -74.372284, 179.999985), vec3(1.000000, 1.000000, 1.000000))        
    sceneTable.entities[newEntity.name] = newEntity
    table.insert(entities, newEntity.name)
                   
    local newEntity = EasyCraft.makeAThing("17868578", "Nature", "naturePack_146.obj", vec3(-21.491343, -37.422077, 20.196970), vec3(0.000000, -0.000000, 0.000000), vec3(20.000000, 20.000000, 20.000000))        
    sceneTable.entities[newEntity.name] = newEntity
    table.insert(entities, newEntity.name)
                   
    local newEntity = EasyCraft.makeAThing("startingThing", "Watercraft", "watercraftPack_007.obj", vec3(0.000000, -36.902596, 0.000000), vec3(0.000000, -0.000000, -15.584422), vec3(14.480471, 14.480471, 14.480471))        
    sceneTable.entities[newEntity.name] = newEntity
    table.insert(entities, newEntity.name)
                   
    local newEntity = EasyCraft.makeAThing("31998308", "Blocky_Characters", "Woman.obj", vec3(0.000000, -12.660173, 11.019481), vec3(178.359146, 89.955765, -179.909256), vec3(1.000000, 1.000000, 1.000000))        
    sceneTable.entities[newEntity.name] = newEntity
    table.insert(entities, newEntity.name)
                   
    local newEntity = EasyCraft.makeAThing("27421333", "Blocky_Characters", "Robot.obj", vec3(23.703463, 40.500000, 24.352814), vec3(0.000000, -0.000000, 0.000000), vec3(1.000000, 1.000000, 1.000000))        
    sceneTable.entities[newEntity.name] = newEntity
    table.insert(entities, newEntity.name)
                   
    local newEntity = EasyCraft.makeAThing("63049979", "Blocky_Characters", "Soldier.obj", vec3(11.928572, 3.270563, -15.820346), vec3(-8.826623, -0.166178, 3.344938), vec3(1.000000, 1.000000, 1.000000))        
    sceneTable.entities[newEntity.name] = newEntity
    table.insert(entities, newEntity.name)
                        
    return sceneTable
        
end