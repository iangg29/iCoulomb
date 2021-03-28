classdef Charge
    % CHARGE
    %   Charge in an electric field.
    
    properties
        id double
        value int64
        pos Position
    end
    
    methods
        function obj = Charge(id)
            % Charge Construct an instance of this class
            obj.id = id;
            obj.value = 0;
            obj.pos = Position(0,0,0);
        end
        
        function obj = set.id(obj,id)
            obj.id = id;
        end
        
        function displayPosition(obj)
            % displayPosition Prints charge position in a 3-D grid.
            fprintf("La posición de la carga está en %s\n", obj.pos.getDisplay());
        end
        
        function displayDetail(obj)
            fprintf("- Carga (%i) %i C - Posición %s", obj.id, obj.value, obj.pos.getDisplay());
        end
        
        function setup(obj)
            obj.value = input("Ingresa el valor de la carga: ");
            obj.pos.x = input("Ingresa el la posición en X: ");
            obj.pos.y = input("Ingresa el la posición en Y: ");
            obj.pos.z = input("Ingresa el la posición en Z: ");
            obj.displayPosition();
        end
    end
end

