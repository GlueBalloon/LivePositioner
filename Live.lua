-- LivePositioner creates Codea parameter controls for positioning. 
-- It also suplies the ability to save the current settings to a tab while a project is running, so it is easy to preserve settings once you've got them just how you like them. 
-- The simplest way to use it is to initialize an instance by passing in the object to be positioned, and update the instance in the update(...) function. 
-- You can get more fancy by passing in tables that define its starting position and the range of adjustment you'd like to allow. The format for this is explained below..
LivePositioner = class()

-- LivePositioner can be initialized with nothing, with just an entity, with an entity plus intial positioning instructions, or any combination thereof
-- If not given positionings, it supplies default initial values.
-- Position instructions must be in the format created by LivePositioner:rangeTable(...)
function LivePositioner:init(thing, pTable, eTable, sTable)
    self.subject = thing
    local position = pTable or self:rangeTable(0.5,0.5,10.5,40)
    local eulers = eTable or self:rangeTable(0,0,0,400)
    local scales = sTable or self:rangeTable(1.5,1.5,1.5,40)
    self:setNonPositioningParameters()
    self:define(self.subject, position, eulers, scales)
end

function LivePositioner:changeSubject(thisSubject) 
    self.subject = thisSubject
    subjectScaleAll = 1
    subjectX, subjectY, subjectZ = thisSubject.position.x, thisSubject.position.y, thisSubject.position.z
    subjectEulerX, subjectEulerY, subjectEulerZ = thisSubject.eulerAngles.x, thisSubject.eulerAngles.y, thisSubject.eulerAngles.z
    subjectScaleX, subjectScaleY, subjectScaleZ = thisSubject.scale.x, thisSubject.scale.y, thisSubject.scale.z
end

-- setNonPositioningParameters sets up the watched variables and the button for saving the current settings
function LivePositioner:setNonPositioningParameters()
    parameter.action("Save Scene", 
        function() 
        EasyCraft.saveScene() 
        EasyCraft.saveCameraPlacement()
    end)
  --  parameter.watch("subjectPosition")
  --  parameter.watch("subjectEulers")
  --  parameter.watch("subjectScale")
    parameter.action("Load Saved Scene",
    function() 

        entities = {}
        currentEntityIndex = 1
        currentSetIndex = 1
        currentModelIndex = 1
    
        for k, v in pairs(EasyCraft.entities) do
            v:destroy()
            EasyCraft.entities[k] = nil
        end

        if easyCraftRecreate then
            easyCraftRecreate()
        end
        
        if LivePositioner.useStoredCameraPosition then
            LivePositioner:useStoredCameraPosition()
        end
        
    end)
end

-- defineLiveParameters(...) sets up the parameter controls
function LivePositioner:define(thing, pTable, eTable, sTable)
    if thing then
        self.subject = thing
    end
    if pTable then
        self:setPositionsAndRanges(pTable)
    end
    if eTable then
        self:setEulersAndRanges(eTable)
    end
    if sTable then
        self:setScalesAndRanges(sTable)
    end
end

function LivePositioner:useTablesIn(tableOfPositions)
    subjectX, subjectY, subjectZ = tableOfPositions.position.x, tableOfPositions.position.y, tableOfPositions.position.z
    subjectEulerX, subjectEulerY, subjectEulerZ = tableOfPositions.eulerAngles.x, tableOfPositions.eulerAngles.y, tableOfPositions.eulerAngles.z
    subjectScaleX, subjectScaleY, subjectScaleZ = tableOfPositions.scale.x, tableOfPositions.scale.y, tableOfPositions.scale.z
end

-- rangeTable(...) creates tables in the format required by the initializer and the defineLiveParameters(..) function
-- the format is simply a key-value table with the keys x, y, z, and range
-- parameters are set by taking the given x, y, and z and then creating a parameter slider that can be slid above and below those starting values by an amount equal to the range value
function LivePositioner:rangeTable(startX, startY, startZ, givenRange, scaleAll, scaleRange)
    local returnTable = {}
    returnTable.x = startX
    returnTable.y = startY
    returnTable.z = startZ
    returnTable.range = givenRange
    if scaleAll then
        returnTable.scaleAll = scaleAll
    end
    if scaleRange then
        returnTable.scaleRange = scaleRange
    end
    return returnTable
end


function LivePositioner:setPositionsAndRanges(rangeTable)
    parameter.number("subjectX", 
        rangeTable.x - rangeTable.range,  
        rangeTable.x + rangeTable.range,
        rangeTable.x)
    parameter.number("subjectY", 
        rangeTable.y - rangeTable.range,  
        rangeTable.y + rangeTable.range,
        rangeTable.y)
    parameter.number("subjectZ", 
        rangeTable.z - rangeTable.range,  
        rangeTable.z + rangeTable.range,
        rangeTable.z)
end


function LivePositioner:setEulersAndRanges(rangeTable)
    parameter.number("subjectEulerX", 
        rangeTable.x - rangeTable.range,  
        rangeTable.x + rangeTable.range,
        rangeTable.x)
    parameter.number("subjectEulerY", 
        rangeTable.y - rangeTable.range,  
        rangeTable.y + rangeTable.range,
        rangeTable.y)
    parameter.number("subjectEulerZ", 
        rangeTable.z - rangeTable.range,  
        rangeTable.z + rangeTable.range,
        rangeTable.z)
end

function LivePositioner:setScalesAndRanges(rangeTable)
    parameter.number("subjectScaleX",
    rangeTable.x - rangeTable.range,
    rangeTable.x + rangeTable.range,
    rangeTable.x)
    parameter.number("subjectScaleY",
    rangeTable.y - rangeTable.range,
    rangeTable.y + rangeTable.range,
    rangeTable.y)
    parameter.number("subjectScaleZ",
    rangeTable.z - rangeTable.range,
    rangeTable.z + rangeTable.range,
    rangeTable.z)
    if rangeTable.scaleAll then
        parameter.number("subjectScaleAll",
        0,
        rangeTable.scaleRange,
        1
        )
    end
end

-- the update() function must be called by the main update() function
function LivePositioner:update()
    if subjectX then
        self.subject.position = vec3(subjectX, subjectY, subjectZ)
        subjectPosition = self.subject.position
    end
    if subjectEulerX then
        self.subject.eulerAngles = vec3(subjectEulerX, subjectEulerY, subjectEulerZ)
        subjectEulers = self.subject.eulerAngles
    end
    if subjectScaleX then
        local multiplier = 1
        if subjectScaleAll and subjectScaleAll > 0 then
            multiplier = subjectScaleAll
        end
        self.subject.scale = vec3(subjectScaleX * multiplier, subjectScaleY * multiplier, subjectScaleZ * multiplier)
        subjectScale = self.subject.scale
    end
    --[[
    if subjectScaleAll then
        local computedX, computedY, computedZ = subjectScaleX * subjectScaleAll, subjectScaleY * subjectScaleAll, subjectScaleZ * subjectScaleAll
     --   self.subject.scale = vec3(computedX, computedY, computedZ)
        subjectAllScaled = self.subject.scale
    end
    ]]
end

