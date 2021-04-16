    
function recreateScene()
    
    local scene = scene
    if not scene then
        scene = craft.scene()
    end
    
    local sceneTable = {}
    sceneTable.entities = {}
    
    
    local newEntity = scene:entity()
    newEntity.position = vec3(-38.461040, 13.487013, 6.170996)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(2.337662, 2.337662, 2.337662)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Primitives"
    newEntity.modelName = "Sphere.obj"
    newEntity.name = "8536199"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Primitives"]["Sphere.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(15.564935, -18.201298, 43.573593)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Man.obj"
    newEntity.name = "20773217"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Man.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(30.803030, -3.829004, -84.738098)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(3.116883, 3.116883, 3.116883)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "SpaceKit"
    newEntity.modelName = "spaceCraft2.obj"
    newEntity.name = "46142188"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["SpaceKit"]["spaceCraft2.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-60.106060, 91.409088, 0.000000)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(2.900433, 2.900433, 2.900433)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "SpaceKit"
    newEntity.modelName = "spaceCraft5.obj"
    newEntity.name = "36628789"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["SpaceKit"]["spaceCraft5.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(242.924240, -42.790043, 49.461040)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(58.831169, 39.220779, 91.515152)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_083.obj"
    newEntity.name = "11457043"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_083.obj"])
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
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(11.928572, 3.270563, -15.820346)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Soldier.obj"
    newEntity.name = "63049979"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Soldier.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(23.703463, 40.500000, 24.352814)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Robot.obj"
    newEntity.name = "27421333"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Robot.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(87.080086, 65.435066, 53.790043)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(2.121212, 2.121212, 2.121212)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "SpaceKit"
    newEntity.modelName = "spaceCraft6.obj"
    newEntity.name = "32653373"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["SpaceKit"]["spaceCraft6.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-241.924240, -38.461040, 118.725105)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(121.584419, 43.796535, 125.179657)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_146.obj"
    newEntity.name = "17868578"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_146.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(0.000000, -12.660173, 11.019481)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Woman.obj"
    newEntity.name = "31998308"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Woman.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(78.422081, -47.119049, 213.963211)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(65.367966, 52.294373, 52.294373)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_119.obj"
    newEntity.name = "15728210"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_119.obj"])
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
    newEntity.position = vec3(0.000000, -36.902596, 0.000000)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(14.480471, 14.480471, 14.480471)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Watercraft"
    newEntity.modelName = "watercraftPack_007.obj"
    newEntity.name = "startingThing"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Watercraft"]["watercraftPack_007.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(156.344162, -64.435066, 110.067101)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(84.978348, 84.978348, 65.367966)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_119.obj"
    newEntity.name = "16790978"
       
    sceneTable.entities[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_119.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    return sceneTable
    
end