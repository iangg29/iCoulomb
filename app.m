classdef app<handle
    % APP
    %   Initial app engine.
    %   Contains all program logic.
    
    properties (Access = protected)
        name string = "iCoulomb"
        version double = 1.0
        author string = "Ian García"
        debug = false
        
    end
    
    properties
        num double
        cargas Charge
    end
    
    methods
        function obj = app(name,version, debug)
            % APP contsturctor for main app instance.
            if nargin == 3
                obj.name = name;
                obj.version = version;
                obj.author = "Ian García";
                obj.debug = debug;
                obj.num = 0;
            end
        end
        
        function init(obj)
            % init
            %   Initialize the application.         
            disp("==================================================");
            disp("Starting " + obj.name + " v" + obj.version + ".");
            disp("Created and developed by " + obj.author + ".");
            disp("Copyright (c) 2021 - All rights reserved.");
            disp("The reproduction of this application is prohibited.");
            disp("==================================================");
            obj.setup()
        end

        
        function addCharge(obj, charge)
            obj.num = obj.num + 1;
            obj.cargas(obj.num) = charge;
            if obj.debug
                fprintf("La carga (%i) ha sido agreada al sistema!\n", charge.id)
            end
        end
        
        function setup(obj)
            disp("Starting setup...")
            n = input("¿De cuántas cargas es el sistema?: ");
            for i = 1:n
                charge = Charge(i, input("Ingresa el valor de la carga: "), Position(input("Ingresa el la posición en X: "),input("Ingresa el la posición en Y: "), input("Ingresa el la posición en Z: ")));
                obj.addCharge(charge);
            end
            disp("Charges setup completed.")
            obj.launchConsole()
        end
        
        function menu(obj)
            disp("--== MENU ==--")
            disp("CARGAS - Muestra todas las cargas registradas.")
            disp("SALIR - Cierra el programa.")
            disp("==============")
        end
        
        function launchConsole(obj)
            start = 1;
            while start == 1
                obj.menu()
                answer = upper(input("Ingresa una opción: ", 's'));
                if answer == "CARGAS"
                    for i = 1:length(obj.cargas)
                        obj.cargas(i).displayDetail();
                    end
                elseif answer == "SALIR"
                    disp("Thank you for using this app.")
                    start = 0;
                end
            end
        end
    end
end

