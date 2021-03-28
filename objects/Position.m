classdef Position
    % POSITION
    %   Detailed explanation goes here
    
    properties
        x double
        y double
        z double
    end
    
    methods
        function obj = Position(x,y,z)
            %POSITION Construct an instance of this class
            obj.x = x;
            obj.y = y;
            obj.z = z;
        end
        
        function obj = set.x(obj, x)
            obj.x = x;
        end        
        
        function obj = set.y(obj, y)
            obj.y = y;
        end
        
        function obj = set.z(obj, z)
            obj.z = z;
        end
        
        function str = getDisplay(obj)
            str = obj.x + "i + " + obj.y + "j + " + obj.z + "z";
        end
    end
end

