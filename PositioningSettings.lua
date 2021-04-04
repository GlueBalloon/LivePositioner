--[[
	subject.position = vec3(0.000000, 0.000000, 0.000000)
	subject.eulerAngles = vec3(0.000000, -0.000000, 0.000000)
	subject.scale = vec3(1.000000, 1.000000, 1.000000)
]]
    function LivePositioner:useStoredCameraPosition(target)
        local targetToUse = target or vec3(0,0,0)
        -- parameters are (target position, initial distance, min dist, max dist)
        --it's great
        viewer = scene.camera:add(OrbitViewer, targetToUse, 30, 10, 300)
        
        --rx and ry control camera placement, though not like you'd think
        --it's all relative to the target
        --positive ry rotates you clockwise around the target, using normal degrees, with 180 being completely behind
        --negative ry rotates you counter-clockwise around the target, so -180 is also completely behind
        --positive rx moves you above the target, with 90 or more being directly overhead
        --negative rx moves you below the target, with -90 or more being directly under
        viewer.ry = -125.67038055546
        viewer.rx = 43.688796632105
        viewer.zoom = 32.966762174604
        viewer.target = target or vec3(0.045085, 7.694529, 0.615834)
end