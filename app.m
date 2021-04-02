classdef app<handle
    % APP
    %   Initial app engine.
    %   Contains all program logic.
    
    properties (Access = protected)
        name string = "iCoulomb"        % Application name.
        version double = 1.0            % Application version.
        author string = "Ian García"    % Author.
        debug = false                   % Debug mode.
        
        E0 = 10^-9/(36*pi);             % Vacuum permittivity.
    end
    
    properties
        num double                      % Number of charges.
        cargas Charge                   % System charges array.
        target Charge                   % System target charge.
    end
    
    methods
        function obj = app(name,version, debug)
            % APP Contsturctor for main app instance.
            %       Initialize essential variables.
            if nargin == 3
                obj.name = name;
                obj.version = version;
                obj.author = "Ian García";
                obj.debug = debug;
                obj.num = 0;
            end
        end
        
        function init(obj)
            % init Initialize the application.
            %       Launches electric field setup.
            disp("==================================================");
            disp("Starting " + obj.name + " v" + obj.version + ".");
            disp("Created and developed by " + obj.author + ".");
            disp("Copyright (c) 2021 - All rights reserved.");
            disp("The reproduction of this application is prohibited.");
            disp("==================================================");
            obj.setup()
        end

        
        function addCharge(obj, charge)
            % addCharge Adds a charge to the electric field system.
            obj.num = obj.num + 1;
            obj.cargas(obj.num) = charge;
            if obj.debug
                fprintf("La carga (%i) ha sido agreada al sistema!\n", charge.id)
            end
        end
        
        function setup(obj)
            % setup Initial application setup.
            %       Creates target charge.
            %       Creates system charges depending on user input.
            disp("Starting setup...")
            targetValue = input("¿Cuál es el valor de la carga a evaluar?");
            obj.target  = Charge(0, targetValue, Position(input("Ingresa el la posición en X: "),input("Ingresa el la posición en Y: "), input("Ingresa el la posición en Z: ")));
            n = input("¿De cuántas cargas es el sistema?: ");
            for i = 1:n
                charge = Charge(i, input("Ingresa el valor de la carga: "), Position(input("Ingresa el la posición en X: "),input("Ingresa el la posición en Y: "), input("Ingresa el la posición en Z: ")));
                obj.addCharge(charge);
            end            
            disp("Charges setup completed.")
            obj.launchConsole()
        end
        
        function menu(obj)
            % menu Displays application menu.
            disp("--== MENU ==--")
            disp("CARGAS - Muestra todas las cargas registradas.")
            disp("CALCULAR - Calcula la fuerza eléctrica.")
            disp("INTENSIDAD - Calcula la intensidad del campo eléctrico.")
            disp("SALIR - Cierra el programa.")
            disp("==============")
        end
        
        function launchConsole(obj)
            % launchConsole Application user input logic.
            %       Controls app-user interactions
            start = 1;
            while start == 1
                obj.menu()
                answer = upper(input("Ingresa una opción: ", 's'));
                if answer == "CARGAS"
                    disp("== A EVALUAR ==")
                    obj.target.displayDetail();
                    disp("== CARGAS ==")
                    for i = 1:length(obj.cargas)
                        obj.cargas(i).displayDetail();
                    end
                elseif answer == "CALCULAR"
                    result = obj.calculate();
                    disp("EL RESULTADO ES:")
                    disp(result)
                elseif answer == "INTENSIDAD"
                    intensidad = obj.intensity();
                    disp("LA INTENSIDAD DEL CAMPO ELÉCTRICO ES:")
                    disp(intensidad)
                elseif answer == "SALIR"
                    disp("Thank you for using this app.")
                    start = 0;
                else
                    disp("This option isn't available.")
                end                
            end
        end
        
        function result = calculate(obj)
            % calculate Solves the electric force on the target charge.
            %       Using coulomb law.
            F = obj.target.value()/(4*pi()*obj.E0);
            targetPos = obj.target.pos().vec();
            chargeMult = 0;
            for i = 1:length(obj.cargas)
                carga = obj.cargas(i);
                chargeMult = chargeMult + ((carga.value()*(targetPos-carga.pos().vec()))/(obj.magnitude(targetPos-carga.pos().vec())^3));
            end
            result = F * chargeMult;
        end
        
        function E = intensity(obj)
            % intensity Calculates the electric field intensity.
            F = obj.calculate();
            Q = obj.target.value();
            E = F / Q;
        end
        
        function magnitude = magnitude(obj, vec)
            % magnitude Utility method to calculate vector magnitudes.
            magnitude = 0;
            for i = 1:length(vec)
                magnitude = magnitude + (vec(i)^2);
            end
            magnitude = sqrt(magnitude);
        end
    end
end

