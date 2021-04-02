classdef Position
    % POSITION
    %   X Y Z position object.
    
    properties
        x double            % Value for x-axis.
        y double            % Value for y-axis.
        z double            % Value for z-axis.
        vec double          % Vector of all axis.
    end
    
    methods
        function obj = Position(x,y,z)
            % Position Construct an instance of this class
            obj.x = x;
            obj.y = y;
            obj.z = z;
            obj.vec = [x y z];
        end
        
        function obj = set.vec(obj, vec)
            % set.vec Sets a new position vector.
            obj.vec = vec;
        end
        
        function vec = get.vec(obj)
            % get.vec Retrieves position vector.
            vec = obj.vec;
        end
        
        function obj = set.x(obj, x)
            % set.x Sets x axis value.
            obj.x = x;
        end
        
        function x = get.x(obj)
            % get.x Retrieves x position value.
            x = obj.x;
        end
        
        function obj = set.y(obj, y)
            % set.y Sets y axis value.
            obj.y = y;
        end
        
        function y = get.y(obj)
            % get.y Retrieves y position value.
            y = obj.y;
        end
        
        function obj = set.z(obj, z)
            % set.z Sets z axis value.
            obj.z = z;
        end
        
        function z = get.z(obj)
            % get.z Retrieves z position value.
            z = obj.z;
        end
        
        function str = getDisplay(obj)
            % getDisplay Returns a formated vector string.
            str = obj.vec(1) + "i + " + obj.vec(2) + "j + " + obj.vec(3) + "z";
        end
    end
end

