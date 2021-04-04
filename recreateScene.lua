    
function recreateScene()
    
    local scene = scene
    if not scene then
        scene = craft.scene()
    end
    
    local sceneTable = {}
    sceneTable.entities = {}
    
    
    
   -- sceneTable.entities[newEntity.name] = newEntity   
    return sceneTable
    
end