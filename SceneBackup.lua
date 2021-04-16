function backupRecreate()
--function easyCraftRecreate()
    
    local scene = scene
    if not scene then
        scene = craft.scene()
    end
    
    local sceneTable = {}
    sceneTable.entities = {}
    
    local newEntity = EasyCraft.makeAThing("8536199", "Primitives", "Sphere.obj", vec3(-38.461040, 13.487013, 6.170996), vec3(0.000000, -0.000000, 0.000000), vec3(2.337662, 2.337662, 2.337662))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("433713", "CastleKit", "wallNarrowCorner.obj", vec3(-99.067101, -42.790043, -149.673157), vec3(0.000000, 15.584415, 0.000000), vec3(4.414460, 8.828920, 4.966268))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("15728210", "Nature", "naturePack_119.obj", vec3(78.422081, -47.119049, 213.963211), vec3(19.104719, -31.717356, -15.269655), vec3(65.367966, 52.294373, 52.294373))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("27421333", "Blocky_Characters", "Robot.obj", vec3(23.703463, 40.500000, 24.352814), vec3(0.000000, -0.000000, 0.000000), vec3(1.000000, 1.000000, 1.000000))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("17868578", "Nature", "naturePack_146.obj", vec3(-241.924240, -38.461040, 118.725105), vec3(0.000000, -24.242435, 0.000000), vec3(121.584419, 43.796535, 125.179657))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("20773217", "Blocky_Characters", "Man.obj", vec3(15.564935, -18.201298, 43.573593), vec3(-137.083344, -69.248405, 100.246826), vec3(1.000000, 1.000000, 1.000000))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("36628789", "SpaceKit", "spaceCraft5.obj", vec3(-60.106060, 91.409088, 0.000000), vec3(102.234238, -6.354290, 72.357422), vec3(2.900433, 2.900433, 2.900433))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("63049979", "Blocky_Characters", "Soldier.obj", vec3(11.928572, 3.270563, -15.820346), vec3(-6.802041, 5.640794, 2.996618), vec3(1.000000, 1.000000, 1.000000))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("77900663", "CastleKit", "wall.obj", vec3(-99.067101, -38.461040, -192.963211), vec3(0.000000, -76.190475, 0.000000), vec3(4.159780, 8.319560, 6.363636))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("startingThing", "Watercraft", "watercraftPack_007.obj", vec3(0.000000, -36.902596, 0.000000), vec3(0.000000, -0.000000, -15.584422), vec3(14.480471, 14.480471, 14.480471))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("31998308", "Blocky_Characters", "Woman.obj", vec3(0.000000, -12.660173, 11.019481), vec3(-48.097672, -34.383663, 10.153232), vec3(1.000000, 1.000000, 1.000000))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("32653373", "SpaceKit", "spaceCraft6.obj", vec3(87.080086, 65.435066, 53.790043), vec3(-164.230698, -7.264833, 151.966766), vec3(2.121212, 2.121212, 2.121212))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("46142188", "SpaceKit", "spaceCraft2.obj", vec3(30.803030, -3.829004, -84.738098), vec3(44.843552, -33.505348, 10.061004), vec3(3.116883, 3.116883, 3.116883))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("11457043", "Nature", "naturePack_083.obj", vec3(242.924240, -42.790043, 49.461040), vec3(5.194801, 81.212151, -0.000006), vec3(58.831169, 39.220779, 91.515152))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("16790978", "Nature", "naturePack_119.obj", vec3(156.344162, -64.435066, 110.067101), vec3(6.685928, -28.734371, -5.177595), vec3(84.978348, 84.978348, 65.367966))
    sceneTable.entities[newEntity.name] = newEntity
    
    local newEntity = EasyCraft.makeAThing("54253005", "Blocky_Characters", "Orc.obj", vec3(48.119049, -21.145021, -19.803030), vec3(35.374283, 9.198385, -120.573494), vec3(1.000000, 1.000000, 1.000000))
    sceneTable.entities[newEntity.name] = newEntity
    
    return sceneTable
    
end