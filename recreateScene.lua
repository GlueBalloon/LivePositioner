    
function recreateScene()
    
    local scene = scene or craft.scene()
    
    local sceneTable = {}
    sceneTable.entities = {}
    
    
    local newEntity = scene:entity()
    newEntity.position = vec3(11.928571, -16.383116, 40.976189)
    newEntity.rotation = quat.eulerAngles(-3.506494, 60.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(-3.506494, 60.000000, 0.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Man.obj"
    newEntity.name = "20773217"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Man.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(64.935066, -47.619049, 316.017303)
    newEntity.rotation = quat.eulerAngles(0.000000, -54.545456, 0.000000)
    newEntity.scale = vec3(68.398270, 45.014057, 68.398270)
    newEntity.sliderEulers = vec3(0.000000, -54.545456, 0.000000)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_119.obj"
    newEntity.name = "1581285114"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_119.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(260.240265, -55.777054, 84.093094)
    newEntity.rotation = quat.eulerAngles(-3.896104, -19.480520, -7.792208)
    newEntity.scale = vec3(58.831177, 84.978348, 52.554111)
    newEntity.sliderEulers = vec3(-3.896104, -19.480520, -7.792208)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_119.obj"
    newEntity.name = "16790978"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_119.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(242.924255, -38.461033, 205.305222)
    newEntity.rotation = quat.eulerAngles(7.792208, -14.805195, 0.000000)
    newEntity.scale = vec3(86.103905, 52.294373, 52.294373)
    newEntity.sliderEulers = vec3(7.792208, -14.805195, 0.000000)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_119.obj"
    newEntity.name = "15728210"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_119.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(142.857147, 108.225105, -155.844162)
    newEntity.rotation = quat.eulerAngles(-35.064934, 143.376617, -15.584415)
    newEntity.scale = vec3(2.874009, 2.874009, 2.874009)
    newEntity.sliderEulers = vec3(-35.064934, 143.376617, -15.584415)
    newEntity.modelPack = "SpaceKit"
    newEntity.modelName = "spaceCraft5.obj"
    newEntity.name = "46142188"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["SpaceKit"]["spaceCraft5.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(0.000000, -36.902596, 0.000000)
    newEntity.rotation = quat.eulerAngles(-0.779221, -3.116883, -10.909091)
    newEntity.scale = vec3(14.480471, 14.480471, 14.480471)
    newEntity.sliderEulers = vec3(-0.779221, -3.116883, -10.909091)
    newEntity.modelPack = "Watercraft"
    newEntity.modelName = "watercraftPack_007.obj"
    newEntity.name = "startingThing"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Watercraft"]["watercraftPack_007.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-3.742424, -14.088728, 40.456711)
    newEntity.rotation = quat.eulerAngles(0.000000, -75.194809, 1.558442)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(0.000000, -75.194809, 1.558442)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "WomanAlternative.obj"
    newEntity.name = "31998308"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["WomanAlternative.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-99.067101, -38.461040, -192.963211)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(4.159780, 8.319560, 6.363636)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "CastleKit"
    newEntity.modelName = "wall.obj"
    newEntity.name = "77900663"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["CastleKit"]["wall.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(16.430735, 44.915585, 24.612555)
    newEntity.rotation = quat.eulerAngles(6.103897, -25.974028, 6.753247)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(6.103897, -25.974028, 6.753247)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Robot.obj"
    newEntity.name = "27421333"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Robot.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(11.928572, 3.270563, -15.820346)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 8.701299)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 8.701299)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Soldier.obj"
    newEntity.name = "63049979"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Soldier.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-389.610382, -43.593075, 134.199127)
    newEntity.rotation = quat.eulerAngles(0.000000, -22.597403, 0.779221)
    newEntity.scale = vec3(196.129669, 76.349136, 199.169800)
    newEntity.sliderEulers = vec3(0.000000, -22.597403, 0.779221)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_146.obj"
    newEntity.name = "17868578"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_146.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(48.119049, -21.145021, -19.803030)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Orc.obj"
    newEntity.name = "54253005"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Orc.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-38.461040, 9.590909, 36.560604)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(2.908968, 2.908968, 2.908968)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Primitives"
    newEntity.modelName = "Sphere.obj"
    newEntity.name = "8536199"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Primitives"]["Sphere.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-66.080086, 13.746753, 35.911255)
    newEntity.rotation = quat.eulerAngles(18.831169, 19.740261, 52.857143)
    newEntity.scale = vec3(2.809524, 2.900433, 2.900433)
    newEntity.sliderEulers = vec3(18.831169, 19.740261, 52.857143)
    newEntity.modelPack = "SpaceKit"
    newEntity.modelName = "spaceCraft2.obj"
    newEntity.name = "36628789"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["SpaceKit"]["spaceCraft2.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(47.619049, 56.277058, 90.909088)
    newEntity.rotation = quat.eulerAngles(-14.025974, 143.376617, 35.064934)
    newEntity.scale = vec3(2.121212, 2.121212, 2.121212)
    newEntity.sliderEulers = vec3(-14.025974, 143.376617, 35.064934)
    newEntity.modelPack = "SpaceKit"
    newEntity.modelName = "spaceCraft6.obj"
    newEntity.name = "32653373"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["SpaceKit"]["spaceCraft6.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(424.742432, -25.474022, 75.435089)
    newEntity.rotation = quat.eulerAngles(0.000000, 83.376625, 0.000000)
    newEntity.scale = vec3(128.925644, 62.927956, 167.661774)
    newEntity.sliderEulers = vec3(0.000000, 83.376625, 0.000000)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_083.obj"
    newEntity.name = "11457043"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_083.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-99.067101, -42.790043, -149.673157)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(4.414460, 8.828920, 4.966268)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "CastleKit"
    newEntity.modelName = "wallNarrowCorner.obj"
    newEntity.name = "433713"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["CastleKit"]["wallNarrowCorner.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    return sceneTable
    
end