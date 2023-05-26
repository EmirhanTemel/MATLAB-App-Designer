classdef Emirhan_Temel_EE101_TermProject4_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        ChargePowerkWhEditField       matlab.ui.control.NumericEditField
        ChargePowerkWhEditFieldLabel  matlab.ui.control.Label
        ChargeStationsEditField       matlab.ui.control.NumericEditField
        ChargeStationsEditFieldLabel  matlab.ui.control.Label
        bEditField                    matlab.ui.control.NumericEditField
        bEditFieldLabel               matlab.ui.control.Label
        aEditField                    matlab.ui.control.NumericEditField
        aEditFieldLabel               matlab.ui.control.Label
        PricekWHEditField             matlab.ui.control.NumericEditField
        PricekWHLabel                 matlab.ui.control.Label
        AvgVisitDurationhEditField    matlab.ui.control.NumericEditField
        AvgVisitDurationhEditFieldLabel  matlab.ui.control.Label
        DailyCustomersEditField       matlab.ui.control.NumericEditField
        DailyCustomersEditFieldLabel  matlab.ui.control.Label
        ParametersLabel_2             matlab.ui.control.Label
        BetaDistributionLabel         matlab.ui.control.Label
        ParametersLabel               matlab.ui.control.Label
        RunButton                     matlab.ui.control.Button
        CreateExcelSheetButton        matlab.ui.control.Button
        Revenue                       matlab.ui.control.UIAxes
        BrandsGraph                   matlab.ui.control.UIAxes
        StateDep                      matlab.ui.control.UIAxes
        StateArriv                    matlab.ui.control.UIAxes
        DepartureGraph                matlab.ui.control.UIAxes
        ArrivalGraph                  matlab.ui.control.UIAxes
    end

    
    properties (Access = public)
        infoTable % Description
        modelID % Description
        chrgDecision % Description
        brands % Description
        brandData % Description
        arrival % Description
        departure % Description
        visitDuration % Description
        stateChrg % Description
        chargePower % Description
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: RunButton
        function RunButtonPushed(app, event)
            %% Uniform distribution used to create Charge Decision and Brand
            %% model ids. Beta distribution used to create state of charge,
            %% arrival & departure times.
            app.chargePower = app.ChargePowerkWhEditField.Value;
            app.chrgDecision = app.DailyCustomersEditField.Value:1;
            app.modelID = app.DailyCustomersEditField.Value:1;
            app.arrival = app.DailyCustomersEditField.Value:1;
            app.departure = app.DailyCustomersEditField.Value:1;
            app.visitDuration = app.DailyCustomersEditField.Value:1;
            app.stateChrg = app.DailyCustomersEditField.Value:1;
            app.brands = {'BMW', 'Tesla', 'Volkswagen', 'TOGG', 'Ford', 'Kia', 'Porsche', 'Nissan', 'Mercedes', 'Audi', 'Toyota'};
            
            for c = 1:app.DailyCustomersEditField.Value

                x = rand(); %uniform distribution for model id and charge
                r = betarnd(app.aEditField.Value, app.bEditField.Value); %beta distribution for arrival, departure, state of charge...
                
                app.stateChrg(c,1) = 100*r; %Customer's state of charge between 0 and 100
                app.arrival(c,1) = 12*r + 10; %Customers can enter between 10:00 and 22:00
                app.visitDuration(c,1) = app.AvgVisitDurationhEditField.Value*x; %Each customer will stay random hours defined to them
                app.departure(c,1) = app.arrival(c,1) + app.visitDuration(c,1); %Customer's departure time (arrival + visitduration)
                app.modelID(c,1) = int8(x*10+1); %Customer's brand model defined to 1-11 randomly
                
                if(x < 0.5)
                    x = 0;
                    app.chrgDecision(c,1) = x;
                else
                    x = 1;
                    app.chrgDecision(c,1) = x;
                end
                
            end
            app.infoTable = table(app.modelID, app.arrival, app.departure, app.stateChrg, app.chrgDecision, app.visitDuration);

            histogram(app.StateArriv, app.stateChrg);
            
            %% Creating a histogram chart and connecting it to brand by vehicle graph. 
            %% While assigning "x labels" to "brand model ids" defined above. 
            histData = histogram(app.BrandsGraph, app.modelID);
            numBins = histData.NumBins;
            xtickPositions = linspace(1, numBins, numel(app.brands));
            xtickLabels = app.brands(xtickPositions);
            set(app.BrandsGraph, 'XTick', xtickPositions, 'XTickLabel', xtickLabels);

            %% Creating a histogram chart and connecting it to arrival graph.
            %% While converting "x labels" to "HH:MM".
            % Define the number of bins to 10 hours
            numBins = 10;
            % Calculate the edges for the histogram
            histEdges = linspace(min(app.arrival), max(app.arrival), numBins + 1);
            % Calculate the centers of each bin
            histCenters = (histEdges(1:end-1) + histEdges(2:end)) / 2;
            % Convert the bin centers to time format (HH:MM)
            timeFormat = histCenters / 24;
            timeLabels = datestr(timeFormat, 'HH:MM'); 
            % Plot the histogram
            histogram(app.ArrivalGraph, app.arrival, histEdges);
            set(app.ArrivalGraph, 'XTick', histCenters, 'XTickLabel', timeLabels);
            display(app.departure)

            %% Creating a histogram chart and connecting it to departure graph.
            %% While converting "x labels" to "HH:MM".
            % Define the number of bins to 10 hours
            numBins1 = 10;
            % Calculate the edges for the histogram
            histEdges1 = linspace(min(app.departure), max(app.departure), numBins1 + 1);
            % Calculate the centers of each bin
            histCenters1 = (histEdges1(1:end-1) + histEdges1(2:end)) / 2;
            % Convert the bin centers to time format (HH:MM)
            timeFormat1 = histCenters1 / 24;
            timeLabels1 = datestr(timeFormat1, 'HH:MM'); 
            % Plot the histogram
            histogram(app.DepartureGraph, app.departure, histEdges1);
            set(app.DepartureGraph, 'XTick', histCenters1, 'XTickLabel', timeLabels1);

                        
        end

        % Button pushed function: CreateExcelSheetButton
        function CreateExcelSheetButtonPushed(app, event)
            filename = 'MallChargers.xlsx';
            writetable(app.infoTable, filename, 'Sheet', 1, 'Range',' D1');
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [1 1 1];
            app.UIFigure.Position = [100 100 843 616];
            app.UIFigure.Name = 'MATLAB App';

            % Create ArrivalGraph
            app.ArrivalGraph = uiaxes(app.UIFigure);
            title(app.ArrivalGraph, 'Arrival Times')
            xlabel(app.ArrivalGraph, 'Daily')
            ylabel(app.ArrivalGraph, 'Y')
            zlabel(app.ArrivalGraph, 'Z')
            app.ArrivalGraph.Position = [197 419 300 185];

            % Create DepartureGraph
            app.DepartureGraph = uiaxes(app.UIFigure);
            title(app.DepartureGraph, 'Departure Times')
            xlabel(app.DepartureGraph, 'Daily')
            ylabel(app.DepartureGraph, 'Y')
            zlabel(app.DepartureGraph, 'Z')
            app.DepartureGraph.Position = [511 419 300 185];

            % Create StateArriv
            app.StateArriv = uiaxes(app.UIFigure);
            title(app.StateArriv, 'State of Charge @Arrival')
            xlabel(app.StateArriv, 'Daily')
            ylabel(app.StateArriv, 'Y')
            zlabel(app.StateArriv, 'Z')
            app.StateArriv.Position = [197 228 300 185];

            % Create StateDep
            app.StateDep = uiaxes(app.UIFigure);
            title(app.StateDep, 'State of Charge @Departure')
            xlabel(app.StateDep, 'Daily')
            ylabel(app.StateDep, 'Y')
            zlabel(app.StateDep, 'Z')
            app.StateDep.Position = [511 228 300 185];

            % Create BrandsGraph
            app.BrandsGraph = uiaxes(app.UIFigure);
            title(app.BrandsGraph, 'Brand by Vehicle')
            xlabel(app.BrandsGraph, 'Daily')
            ylabel(app.BrandsGraph, 'Y')
            zlabel(app.BrandsGraph, 'Z')
            app.BrandsGraph.Position = [198 37 300 185];

            % Create Revenue
            app.Revenue = uiaxes(app.UIFigure);
            title(app.Revenue, 'Revenue')
            xlabel(app.Revenue, 'Daily')
            ylabel(app.Revenue, 'Y')
            zlabel(app.Revenue, 'Z')
            app.Revenue.Position = [511 37 300 185];

            % Create CreateExcelSheetButton
            app.CreateExcelSheetButton = uibutton(app.UIFigure, 'push');
            app.CreateExcelSheetButton.ButtonPushedFcn = createCallbackFcn(app, @CreateExcelSheetButtonPushed, true);
            app.CreateExcelSheetButton.Position = [32 118 119 22];
            app.CreateExcelSheetButton.Text = 'Create Excel Sheet';

            % Create RunButton
            app.RunButton = uibutton(app.UIFigure, 'push');
            app.RunButton.ButtonPushedFcn = createCallbackFcn(app, @RunButtonPushed, true);
            app.RunButton.Position = [93 221 68 56];
            app.RunButton.Text = 'Run';

            % Create ParametersLabel
            app.ParametersLabel = uilabel(app.UIFigure);
            app.ParametersLabel.FontSize = 26;
            app.ParametersLabel.FontWeight = 'bold';
            app.ParametersLabel.Position = [33 552 147 31];
            app.ParametersLabel.Text = 'Parameters';

            % Create BetaDistributionLabel
            app.BetaDistributionLabel = uilabel(app.UIFigure);
            app.BetaDistributionLabel.FontSize = 18;
            app.BetaDistributionLabel.FontWeight = 'bold';
            app.BetaDistributionLabel.Position = [33 325 145 25];
            app.BetaDistributionLabel.Text = 'Beta Distribution';

            % Create ParametersLabel_2
            app.ParametersLabel_2 = uilabel(app.UIFigure);
            app.ParametersLabel_2.FontSize = 18;
            app.ParametersLabel_2.FontWeight = 'bold';
            app.ParametersLabel_2.Position = [47 298 103 22];
            app.ParametersLabel_2.Text = 'Parameters';

            % Create DailyCustomersEditFieldLabel
            app.DailyCustomersEditFieldLabel = uilabel(app.UIFigure);
            app.DailyCustomersEditFieldLabel.HorizontalAlignment = 'right';
            app.DailyCustomersEditFieldLabel.Position = [22 518 94 22];
            app.DailyCustomersEditFieldLabel.Text = 'Daily Customers';

            % Create DailyCustomersEditField
            app.DailyCustomersEditField = uieditfield(app.UIFigure, 'numeric');
            app.DailyCustomersEditField.Position = [129 518 37 22];
            app.DailyCustomersEditField.Value = 100;

            % Create AvgVisitDurationhEditFieldLabel
            app.AvgVisitDurationhEditFieldLabel = uilabel(app.UIFigure);
            app.AvgVisitDurationhEditFieldLabel.HorizontalAlignment = 'right';
            app.AvgVisitDurationhEditFieldLabel.Position = [-3 484 119 22];
            app.AvgVisitDurationhEditFieldLabel.Text = 'Avg. Visit Duration(h)';

            % Create AvgVisitDurationhEditField
            app.AvgVisitDurationhEditField = uieditfield(app.UIFigure, 'numeric');
            app.AvgVisitDurationhEditField.Position = [129 484 37 22];
            app.AvgVisitDurationhEditField.Value = 3;

            % Create PricekWHLabel
            app.PricekWHLabel = uilabel(app.UIFigure);
            app.PricekWHLabel.HorizontalAlignment = 'right';
            app.PricekWHLabel.Position = [46 449 70 22];
            app.PricekWHLabel.Text = 'Price(kW/H)';

            % Create PricekWHEditField
            app.PricekWHEditField = uieditfield(app.UIFigure, 'numeric');
            app.PricekWHEditField.Position = [129 448 37 22];
            app.PricekWHEditField.Value = 0.2;

            % Create aEditFieldLabel
            app.aEditFieldLabel = uilabel(app.UIFigure);
            app.aEditFieldLabel.HorizontalAlignment = 'right';
            app.aEditFieldLabel.Position = [21 255 25 22];
            app.aEditFieldLabel.Text = 'a';

            % Create aEditField
            app.aEditField = uieditfield(app.UIFigure, 'numeric');
            app.aEditField.Position = [55 255 25 22];
            app.aEditField.Value = 2;

            % Create bEditFieldLabel
            app.bEditFieldLabel = uilabel(app.UIFigure);
            app.bEditFieldLabel.HorizontalAlignment = 'right';
            app.bEditFieldLabel.Position = [21 221 25 22];
            app.bEditFieldLabel.Text = 'b';

            % Create bEditField
            app.bEditField = uieditfield(app.UIFigure, 'numeric');
            app.bEditField.Position = [55 221 25 22];
            app.bEditField.Value = 8;

            % Create ChargeStationsEditFieldLabel
            app.ChargeStationsEditFieldLabel = uilabel(app.UIFigure);
            app.ChargeStationsEditFieldLabel.HorizontalAlignment = 'right';
            app.ChargeStationsEditFieldLabel.Position = [26 413 91 22];
            app.ChargeStationsEditFieldLabel.Text = 'Charge Stations';

            % Create ChargeStationsEditField
            app.ChargeStationsEditField = uieditfield(app.UIFigure, 'numeric');
            app.ChargeStationsEditField.Position = [129 412 37 22];
            app.ChargeStationsEditField.Value = 10;

            % Create ChargePowerkWhEditFieldLabel
            app.ChargePowerkWhEditFieldLabel = uilabel(app.UIFigure);
            app.ChargePowerkWhEditFieldLabel.HorizontalAlignment = 'right';
            app.ChargePowerkWhEditFieldLabel.Position = [0 378 118 22];
            app.ChargePowerkWhEditFieldLabel.Text = 'Charge Power (kWh)';

            % Create ChargePowerkWhEditField
            app.ChargePowerkWhEditField = uieditfield(app.UIFigure, 'numeric');
            app.ChargePowerkWhEditField.Position = [129 376 37 22];
            app.ChargePowerkWhEditField.Value = 7;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Emirhan_Temel_EE101_TermProject4_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end