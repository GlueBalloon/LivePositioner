    
function recreateScene()
    
    local scene = scene
    if not scene then
        scene = craft.scene()
    end
    
    local sceneTable = {}
    sceneTable.entities = {}
    

       table.insert(sceneTable.entities, EasyCraft.makeAThing())

       table.insert(sceneTable.entities, EasyCraft.makeAThing())

       table.insert(sceneTable.entities, EasyCraft.makeAThing())

       table.insert(sceneTable.entities, EasyCraft.makeAThing())

       table.insert(sceneTable.entities, EasyCraft.makeAThing())

       table.insert(sceneTable.entities, EasyCraft.makeAThing())

       table.insert(sceneTable.entities, EasyCraft.makeAThing())

       table.insert(sceneTable.entities, EasyCraft.makeAThing())

       table.insert(sceneTable.entities, EasyCraft.makeAThing())

       table.insert(sceneTable.entities, EasyCraft.makeAThing())

--what the fucking hell Tyson
    
    
   -- sceneTable.entities[newEntity.name] = newEntity   
    return sceneTable
    
end