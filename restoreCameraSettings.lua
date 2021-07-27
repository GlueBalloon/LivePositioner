    function restoreCameraSettings(target)
        local targetToUse = target or vec3(0,0,0)
        -- parameters after viewer are target position, initial distance, min dist, max dist
        viewer = scene.camera:add(OrbitViewer, targetToUse, 30, 10, 1000)
        
        --rx and ry control camera placement, though not like you'd think
        --it's all relative to the target
        --positive ry rotates you clockwise around the target, using normal degrees, with 180 being completely behind
        --negative ry rotates you counter-clockwise around the target, so -180 is also completely behind
        --positive rx moves you above the target, with 90 or more being directly overhead
        --negative rx moves you below the target, with -90 or more being directly under
        viewer.ry = 151.76213529665
        viewer.rx = 19.92086657075
        viewer.zoom = 399.90488088776
        viewer.target = target or vec3(17.024047, 7.200596, -70.107191)
end