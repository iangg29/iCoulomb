classdef app
    % APP
    %   Initial app engine.
    %   TODO
    
    properties
        name
        version
        author
        debug
    end
    
    methods
        function obj = app(name,version, debug)
            %APP Construct an instance of this class
            %   Detailed explanation goes here
            if nargin == 3
                obj.name = name;
                obj.version = version;
                obj.author = "Ian García";
                obj.debug = debug;
            end
        end
        
        function start(obj)
            % start
            %   Detailed explanation goes here
            
            disp("==================================================");
            disp("Starting " + obj.name + " v" + obj.version + ".");
            disp("Created and developed by " + obj.author + ".");
            disp("Copyright (c) 2021 - All rights reserved.");
            disp("The reproduction of this application is prohibited.");
            disp("==================================================");
        end
    end
end

