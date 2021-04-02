classdef Charge
    % CHARGE
    %   Charge in an electric field.
    
    properties
        id double           % Charge ID.
        value double        % Value of charge.
        pos Position        % Charge position.
    end
    
    methods
        function obj = Charge(id, value, pos)
            % Charge Construct a charge in an electric field.
            obj.id = id;
            obj.value = value;
            obj.pos = pos;
        end
        
        function obj = set.id(obj,id)
            % set.id Sets a new charge id.
            obj.id = id;
        end
        
        function id = get.id(obj)
            % get.id Retrieves charge id.
            id = obj.id;
        end
        
        function obj = set.value(obj, value)
            % set.value Sets a new charge value.
            obj.value = value;
        end
        
        function value = get.value(obj)
            % get.value Retrieves charge value.
            value = obj.value;
        end
        
        function pos = get.pos(obj)
            % get.pos Retrieves charge position.
            pos = obj.pos;
        end
        
        function displayPosition(obj)
            % displayPosition Prints charge position in a 3-D grid.
            fprintf("La posición de la carga está en %s\n", obj.pos.getDisplay());
        end
        
        function displayDetail(obj)
            % displayDetail Prints charge properties.
            fprintf("- Carga (%i) %i C - Posición %s\n", obj.id, obj.value, obj.pos.getDisplay());
        end
    end
end

