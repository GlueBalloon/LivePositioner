    
function recreateScene()
    
    local scene = scene or craft.scene()
    
    local sceneTable = {}
    sceneTable.entities = {}
    
    
    local newEntity = scene:entity()
    newEntity.position = vec3(13.852814, -17.316017, 10.129870)
    newEntity.rotation = quat.eulerAngles(-15.584415, 65.367966, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(-15.584415, 65.367966, 0.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Soldier.obj"
    newEntity.name = "408691390"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Soldier.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(239.720795, -38.461033, 211.971893)
    newEntity.rotation = quat.eulerAngles(7.792208, -19.999996, 0.000000)
    newEntity.scale = vec3(86.103905, 52.294373, 52.294373)
    newEntity.sliderEulers = vec3(7.792208, -19.999996, 0.000000)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_119.obj"
    newEntity.name = "15728210"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_119.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-90.909088, 90.909088, -207.792206)
    newEntity.rotation = quat.eulerAngles(13.246754, 0.000000, 0.000000)
    newEntity.scale = vec3(2.454545, 2.454545, 2.454545)
    newEntity.sliderEulers = vec3(13.246754, 0.000000, 0.000000)
    newEntity.modelPack = "SpaceKit"
    newEntity.modelName = "buildingOpen.obj"
    newEntity.name = "1863112216"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["SpaceKit"]["buildingOpen.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-67.965370, -20.798702, -260.952393)
    newEntity.rotation = quat.eulerAngles(0.000000, 90.000000, 0.000000)
    newEntity.scale = vec3(3.997750, 3.995499, 4.000000)
    newEntity.sliderEulers = vec3(0.000000, 90.000000, 0.000000)
    newEntity.modelPack = "CastleKit"
    newEntity.modelName = "wallCorner.obj"
    newEntity.name = "433713"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["CastleKit"]["wallCorner.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(3.549785, 13.679655, 157.792206)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(3.349092, 3.349092, 3.349092)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Primitives"
    newEntity.modelName = "Sphere.obj"
    newEntity.name = "987086466"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Primitives"]["Sphere.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(16.430735, 44.915585, 24.612555)
    newEntity.rotation = quat.eulerAngles(6.103897, -25.974028, 6.753247)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(6.103897, -25.974028, 6.753247)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Robot.obj"
    newEntity.name = "27421333"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Robot.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(33.030308, 11.428567, -14.738096)
    newEntity.rotation = quat.eulerAngles(-180.129868, 210.519485, 57.922077)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(-180.129868, 210.519485, 57.922077)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Orc.obj"
    newEntity.name = "54253005"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Orc.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-90.909088, 25.800865, -285.714294)
    newEntity.rotation = quat.eulerAngles(0.000000, 156.709961, -6.060606)
    newEntity.scale = vec3(2.071429, 2.071429, 2.071429)
    newEntity.sliderEulers = vec3(0.000000, 156.709961, -6.060606)
    newEntity.modelPack = "CastleKit"
    newEntity.modelName = "knightRed.obj"
    newEntity.name = "1055224350"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["CastleKit"]["knightRed.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-66.080086, 13.746753, 35.911255)
    newEntity.rotation = quat.eulerAngles(18.831169, 19.740261, 52.857143)
    newEntity.scale = vec3(2.809524, 2.900433, 2.900433)
    newEntity.sliderEulers = vec3(18.831169, 19.740261, 52.857143)
    newEntity.modelPack = "SpaceKit"
    newEntity.modelName = "spaceCraft2.obj"
    newEntity.name = "36628789"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["SpaceKit"]["spaceCraft2.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(7.965368, -14.329004, 63.852814)
    newEntity.rotation = quat.eulerAngles(-11.948052, 0.000000, 9.610390)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(-11.948052, 0.000000, 9.610390)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Orc.obj"
    newEntity.name = "1955093335"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Orc.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(15.194803, -12.597407, 52.121212)
    newEntity.rotation = quat.eulerAngles(34.675316, 7.922081, -59.480526)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(34.675316, 7.922081, -59.480526)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Woman.obj"
    newEntity.name = "1171073909"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Woman.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(47.619049, 56.277058, 90.909088)
    newEntity.rotation = quat.eulerAngles(-14.025974, 143.376617, 35.064934)
    newEntity.scale = vec3(2.309458, 2.309458, 2.309458)
    newEntity.sliderEulers = vec3(-14.025974, 143.376617, 35.064934)
    newEntity.modelPack = "SpaceKit"
    newEntity.modelName = "spaceCraft6.obj"
    newEntity.name = "32653373"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["SpaceKit"]["spaceCraft6.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(11.928572, 3.270563, -15.820346)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 8.701299)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 8.701299)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Soldier.obj"
    newEntity.name = "63049979"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Soldier.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(0.000000, -36.902596, 0.000000)
    newEntity.rotation = quat.eulerAngles(-0.779221, -3.116883, -10.909091)
    newEntity.scale = vec3(14.480471, 14.480471, 14.480471)
    newEntity.sliderEulers = vec3(-0.779221, -3.116883, -10.909091)
    newEntity.modelPack = "Watercraft"
    newEntity.modelName = "watercraftPack_007.obj"
    newEntity.name = "startingThing"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
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
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["WomanAlternative.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-107.965370, -20.971863, -338.807404)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(4.000000, 4.000000, 4.000000)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "CastleKit"
    newEntity.modelName = "wall.obj"
    newEntity.name = "77900663"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["CastleKit"]["wall.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(64.935066, -47.619049, 316.017303)
    newEntity.rotation = quat.eulerAngles(0.000000, -54.545456, 0.000000)
    newEntity.scale = vec3(68.398270, 45.014057, 68.398270)
    newEntity.sliderEulers = vec3(0.000000, -54.545456, 0.000000)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_119.obj"
    newEntity.name = "1581285114"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_119.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-38.461040, 9.590909, 36.560604)
    newEntity.rotation = quat.eulerAngles(0.000000, 0.000000, 0.000000)
    newEntity.scale = vec3(2.908968, 2.908968, 2.908968)
    newEntity.sliderEulers = vec3(0.000000, 0.000000, 0.000000)
    newEntity.modelPack = "Primitives"
    newEntity.modelName = "Sphere.obj"
    newEntity.name = "8536199"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Primitives"]["Sphere.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-67.965332, -20.885281, -340.000000)
    newEntity.rotation = quat.eulerAngles(0.000000, -180.000000, 0.000000)
    newEntity.scale = vec3(4.000000, 4.000000, 4.000000)
    newEntity.sliderEulers = vec3(0.000000, -180.000000, 0.000000)
    newEntity.modelPack = "CastleKit"
    newEntity.modelName = "wallPillar.obj"
    newEntity.name = "196793"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["CastleKit"]["wallPillar.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-102.683983, -20.885281, -260.952393)
    newEntity.rotation = quat.eulerAngles(0.000000, 90.432899, 0.000000)
    newEntity.scale = vec3(4.000000, 4.000000, 4.000000)
    newEntity.sliderEulers = vec3(0.000000, 90.432899, 0.000000)
    newEntity.modelPack = "CastleKit"
    newEntity.modelName = "wallPillar.obj"
    newEntity.name = "86587903"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["CastleKit"]["wallPillar.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-141.731476, -20.952427, -260.606140)
    newEntity.rotation = quat.eulerAngles(0.000000, -270.129883, 0.000000)
    newEntity.scale = vec3(4.008658, 4.008658, 4.008658)
    newEntity.sliderEulers = vec3(0.000000, -270.129883, 0.000000)
    newEntity.modelPack = "CastleKit"
    newEntity.modelName = "wallNarrowGate.obj"
    newEntity.name = "1203626605"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["CastleKit"]["wallNarrowGate.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-16.450214, -10.346318, 50.952396)
    newEntity.rotation = quat.eulerAngles(-24.415585, -48.831169, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(-24.415585, -48.831169, 0.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Robot.obj"
    newEntity.name = "1841750102"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Robot.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(11.928571, -16.383116, 40.976189)
    newEntity.rotation = quat.eulerAngles(-3.506494, 60.000000, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(-3.506494, 60.000000, 0.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Man.obj"
    newEntity.name = "20773217"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Man.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-4.415585, 5.194800, -30.043282)
    newEntity.rotation = quat.eulerAngles(8.311688, -64.285713, 2.857143)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(8.311688, -64.285713, 2.857143)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Adventurer.obj"
    newEntity.name = "2123724201"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Adventurer.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-8.701298, -2.597403, -9.480519)
    newEntity.rotation = quat.eulerAngles(9.480519, -57.402596, -20.909090)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(9.480519, -57.402596, -20.909090)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Woman.obj"
    newEntity.name = "1322837717"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Woman.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-8.008657, -11.904759, 62.510826)
    newEntity.rotation = quat.eulerAngles(12.597404, 0.000000, -19.090910)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(12.597404, 0.000000, -19.090910)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "ManAlternative.obj"
    newEntity.name = "1756907330"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["ManAlternative.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(142.857147, 108.225105, -155.844162)
    newEntity.rotation = quat.eulerAngles(-35.064934, 143.376617, -15.584415)
    newEntity.scale = vec3(2.874009, 2.874009, 2.874009)
    newEntity.sliderEulers = vec3(-35.064934, 143.376617, -15.584415)
    newEntity.modelPack = "SpaceKit"
    newEntity.modelName = "spaceCraft5.obj"
    newEntity.name = "46142188"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["SpaceKit"]["spaceCraft5.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-389.610382, -43.593075, 134.199127)
    newEntity.rotation = quat.eulerAngles(0.000000, -22.597403, 0.779221)
    newEntity.scale = vec3(196.129669, 76.349136, 199.169800)
    newEntity.sliderEulers = vec3(0.000000, -22.597403, 0.779221)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_146.obj"
    newEntity.name = "17868578"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_146.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-110.995674, 26.363605, -285.714233)
    newEntity.rotation = quat.eulerAngles(0.000000, -157.792206, 8.658009)
    newEntity.scale = vec3(2.000000, 2.000000, 2.000000)
    newEntity.sliderEulers = vec3(0.000000, -157.792206, 8.658009)
    newEntity.modelPack = "CastleKit"
    newEntity.modelName = "knightRed.obj"
    newEntity.name = "617997830"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["CastleKit"]["knightRed.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(260.240265, -55.777054, 84.093094)
    newEntity.rotation = quat.eulerAngles(-3.896104, -19.480520, -7.792208)
    newEntity.scale = vec3(58.831177, 84.978348, 52.554111)
    newEntity.sliderEulers = vec3(-3.896104, -19.480520, -7.792208)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_119.obj"
    newEntity.name = "16790978"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_119.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(424.742432, -25.474022, 75.435089)
    newEntity.rotation = quat.eulerAngles(0.000000, 83.376625, 0.000000)
    newEntity.scale = vec3(128.925644, 62.927956, 167.661774)
    newEntity.sliderEulers = vec3(0.000000, 83.376625, 0.000000)
    newEntity.modelPack = "Nature"
    newEntity.modelName = "naturePack_083.obj"
    newEntity.name = "11457043"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Nature"]["naturePack_083.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    local newEntity = scene:entity()
    newEntity.position = vec3(-3.419911, -12.034630, 8.484848)
    newEntity.rotation = quat.eulerAngles(-5.454545, -67.792206, 0.000000)
    newEntity.scale = vec3(1.000000, 1.000000, 1.000000)
    newEntity.sliderEulers = vec3(-5.454545, -67.792206, 0.000000)
    newEntity.modelPack = "Blocky_Characters"
    newEntity.modelName = "Orc.obj"
    newEntity.name = "1808644964"
       
    sceneTable.entityTableByNames[newEntity.name] = newEntity
    local newModel = craft.model(asset.builtin["Blocky_Characters"]["Orc.obj"])
    newEntity:add(craft.renderer, newModel)
        
            
    return sceneTable
    
end