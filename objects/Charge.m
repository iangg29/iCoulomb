classdef Charge
    % CHARGE
    %   Charge in an electric field.
    
    properties
        id double
        value double
        pos Position
    end
    
    methods
        function obj = Charge(id, value, pos)
            % Charge Construct an instance of this class
            obj.id = id;
            obj.value = value;
            obj.pos = pos;
        end
        
        function obj = set.id(obj,id)
            obj.id = id;
        end
        
        function displayPosition(obj)
            % displayPosition Prints charge position in a 3-D grid.
            fprintf("La posición de la carga está en %s\n", obj.pos.getDisplay());
        end
        
        function displayDetail(obj)
            fprintf("- Carga (%i) %i C - Posición %s\n", obj.id, obj.value, obj.pos.getDisplay());
        end
    end
end

