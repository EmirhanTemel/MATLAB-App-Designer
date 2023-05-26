classdef proje303_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        Lamp_8                         matlab.ui.control.Lamp
        Lamp_7                         matlab.ui.control.Lamp
        Lamp_6                         matlab.ui.control.Lamp
        Lamp_5                         matlab.ui.control.Lamp
        Lamp_4                         matlab.ui.control.Lamp
        Lamp_3                         matlab.ui.control.Lamp
        Lamp_2                         matlab.ui.control.Lamp
        Lamp                           matlab.ui.control.Lamp
        DemandLabel                    matlab.ui.control.Label
        BusLabel_2                     matlab.ui.control.Label
        TetaLabel_2                    matlab.ui.control.Label
        VLabel_2                       matlab.ui.control.Label
        QLabel_2                       matlab.ui.control.Label
        PLabel_2                       matlab.ui.control.Label
        BusLabel                       matlab.ui.control.Label
        GeneratorLabel                 matlab.ui.control.Label
        Bus2EditField                  matlab.ui.control.NumericEditField
        Bus2EditFieldLabel             matlab.ui.control.Label
        EditField4_2                   matlab.ui.control.NumericEditField
        EditField3_5                   matlab.ui.control.NumericEditField
        EditField2_8                   matlab.ui.control.NumericEditField
        SolvePowerFlowEquationsButton  matlab.ui.control.Button
        EditField4                     matlab.ui.control.NumericEditField
        EditField3_4                   matlab.ui.control.NumericEditField
        EditField2_7                   matlab.ui.control.NumericEditField
        Bus1EditField_2                matlab.ui.control.NumericEditField
        Bus1EditField_2Label           matlab.ui.control.Label
        TetaLabel                      matlab.ui.control.Label
        VLabel                         matlab.ui.control.Label
        QLabel                         matlab.ui.control.Label
        PLabel                         matlab.ui.control.Label
        Image                          matlab.ui.control.Image
        Image2                         matlab.ui.control.Image
    end

    
    methods (Access = private)
        
        function solve(app)
            %Bus1 voltage angle set 0
            app.EditField4.Value = 0;
            
            %User inputs
            demandP = app.Bus2EditField.Value;
            demandQ = app.EditField2_8.Value;
            V1 = app.EditField3_4.Value;

            %Y bus matrix
            Y_bus = [-10j 10j; 10j -10j];

            %Initial Guesses
            TETA2 = 0;
            V2 = 1;
            
            epsilon = 0.001;
            while(1)
                %Power flow equations        
                f = [V2*10*sind(TETA2) + 2; V2*(-10*cosd(TETA2)) + V2*V2*(10)+1];

                %Jacobian matrix
                J = [(10*V2*cosd(TETA2)) (10*sind(TETA2)); (10*V2*sind(TETA2)) (-10*cosd(TETA2)+20*V2)];

                %Defining delta
                delta_x = -inv(J)*f;

                %Defining x
                x = [TETA2; V2];

                %New x calculation
                x = x + delta_x;

                TETA2 = x(1);
                V2 = x(2);
                if(norm(f) < epsilon)
                    break
                end
            end
            S_1 = V1*(V1*Y_bus(1,1) + V2*Y_bus(1,2));
            P_gen = real(S_1)*100;
            Q_gen = imag(S_1)*100;
            app.Bus1EditField_2.Value = P_gen + demandP;
            app.EditField2_7.Value = Q_gen + demandQ;
            app.EditField3_5.Value = V2;
            app.EditField4_2.Value = TETA2;
        end
    end


    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: SolvePowerFlowEquationsButton
        function SolvePowerFlowEquationsButtonPushed(app, event)
            solve(app)
            app.Lamp.Color = [0 1 0];
            app.Lamp_2.Color = [0 1 0];
            app.Lamp_6.Color = [0 1 0];
            app.Lamp_5.Color = [0 1 0];
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [1 1 1];
            app.UIFigure.Position = [100 100 696 537];
            app.UIFigure.Name = 'MATLAB App';

            % Create Image2
            app.Image2 = uiimage(app.UIFigure);
            app.Image2.Position = [1 -38 674 323];
            app.Image2.ImageSource = 'Screenshot_2.png';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [13 265 662 318];
            app.Image.ImageSource = 'Screenshot_1.png';

            % Create PLabel
            app.PLabel = uilabel(app.UIFigure);
            app.PLabel.HorizontalAlignment = 'center';
            app.PLabel.FontName = 'Dialog';
            app.PLabel.FontSize = 14;
            app.PLabel.FontWeight = 'bold';
            app.PLabel.FontColor = [1 1 1];
            app.PLabel.Position = [166 413 25 22];
            app.PLabel.Text = 'P';

            % Create QLabel
            app.QLabel = uilabel(app.UIFigure);
            app.QLabel.HorizontalAlignment = 'center';
            app.QLabel.FontName = 'Dialog';
            app.QLabel.FontSize = 14;
            app.QLabel.FontWeight = 'bold';
            app.QLabel.FontColor = [1 1 1];
            app.QLabel.Position = [259 413 25 22];
            app.QLabel.Text = 'Q';

            % Create VLabel
            app.VLabel = uilabel(app.UIFigure);
            app.VLabel.HorizontalAlignment = 'center';
            app.VLabel.FontName = 'Dialog';
            app.VLabel.FontSize = 14;
            app.VLabel.FontWeight = 'bold';
            app.VLabel.FontColor = [1 1 1];
            app.VLabel.Position = [351 413 25 22];
            app.VLabel.Text = 'V';

            % Create TetaLabel
            app.TetaLabel = uilabel(app.UIFigure);
            app.TetaLabel.FontName = 'Dialog';
            app.TetaLabel.FontSize = 14;
            app.TetaLabel.FontWeight = 'bold';
            app.TetaLabel.FontColor = [1 1 1];
            app.TetaLabel.Position = [441 413 33 22];
            app.TetaLabel.Text = 'Teta';

            % Create Bus1EditField_2Label
            app.Bus1EditField_2Label = uilabel(app.UIFigure);
            app.Bus1EditField_2Label.HorizontalAlignment = 'right';
            app.Bus1EditField_2Label.FontName = 'Dialog';
            app.Bus1EditField_2Label.FontSize = 14;
            app.Bus1EditField_2Label.FontWeight = 'bold';
            app.Bus1EditField_2Label.Position = [80 431 43 22];
            app.Bus1EditField_2Label.Text = 'Bus1';

            % Create Bus1EditField_2
            app.Bus1EditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.Bus1EditField_2.Editable = 'off';
            app.Bus1EditField_2.Position = [146 452 59 22];

            % Create EditField2_7
            app.EditField2_7 = uieditfield(app.UIFigure, 'numeric');
            app.EditField2_7.Editable = 'off';
            app.EditField2_7.Position = [238 452 68 22];

            % Create EditField3_4
            app.EditField3_4 = uieditfield(app.UIFigure, 'numeric');
            app.EditField3_4.Position = [330 452 67 22];

            % Create EditField4
            app.EditField4 = uieditfield(app.UIFigure, 'numeric');
            app.EditField4.Editable = 'off';
            app.EditField4.Position = [424 452 67 22];

            % Create SolvePowerFlowEquationsButton
            app.SolvePowerFlowEquationsButton = uibutton(app.UIFigure, 'push');
            app.SolvePowerFlowEquationsButton.ButtonPushedFcn = createCallbackFcn(app, @SolvePowerFlowEquationsButtonPushed, true);
            app.SolvePowerFlowEquationsButton.Position = [254 258 168 22];
            app.SolvePowerFlowEquationsButton.Text = 'Solve Power Flow Equations';

            % Create EditField2_8
            app.EditField2_8 = uieditfield(app.UIFigure, 'numeric');
            app.EditField2_8.Position = [238 149 68 22];

            % Create EditField3_5
            app.EditField3_5 = uieditfield(app.UIFigure, 'numeric');
            app.EditField3_5.Editable = 'off';
            app.EditField3_5.Position = [334 149 63 22];

            % Create EditField4_2
            app.EditField4_2 = uieditfield(app.UIFigure, 'numeric');
            app.EditField4_2.Editable = 'off';
            app.EditField4_2.Position = [424 149 70 22];

            % Create Bus2EditFieldLabel
            app.Bus2EditFieldLabel = uilabel(app.UIFigure);
            app.Bus2EditFieldLabel.HorizontalAlignment = 'right';
            app.Bus2EditFieldLabel.FontName = 'Dialog';
            app.Bus2EditFieldLabel.FontSize = 14;
            app.Bus2EditFieldLabel.FontWeight = 'bold';
            app.Bus2EditFieldLabel.Position = [79 128 39 22];
            app.Bus2EditFieldLabel.Text = 'Bus2';

            % Create Bus2EditField
            app.Bus2EditField = uieditfield(app.UIFigure, 'numeric');
            app.Bus2EditField.Position = [146 149 59 22];

            % Create GeneratorLabel
            app.GeneratorLabel = uilabel(app.UIFigure);
            app.GeneratorLabel.FontWeight = 'bold';
            app.GeneratorLabel.Position = [520 452 63 30];
            app.GeneratorLabel.Text = 'Generator';

            % Create BusLabel
            app.BusLabel = uilabel(app.UIFigure);
            app.BusLabel.FontWeight = 'bold';
            app.BusLabel.Position = [538 441 28 18];
            app.BusLabel.Text = 'Bus';

            % Create PLabel_2
            app.PLabel_2 = uilabel(app.UIFigure);
            app.PLabel_2.HorizontalAlignment = 'center';
            app.PLabel_2.FontName = 'Dialog';
            app.PLabel_2.FontSize = 14;
            app.PLabel_2.FontWeight = 'bold';
            app.PLabel_2.FontColor = [1 1 1];
            app.PLabel_2.Position = [166 107 25 22];
            app.PLabel_2.Text = 'P';

            % Create QLabel_2
            app.QLabel_2 = uilabel(app.UIFigure);
            app.QLabel_2.HorizontalAlignment = 'center';
            app.QLabel_2.FontName = 'Dialog';
            app.QLabel_2.FontSize = 14;
            app.QLabel_2.FontWeight = 'bold';
            app.QLabel_2.FontColor = [1 1 1];
            app.QLabel_2.Position = [259 107 25 22];
            app.QLabel_2.Text = 'Q';

            % Create VLabel_2
            app.VLabel_2 = uilabel(app.UIFigure);
            app.VLabel_2.HorizontalAlignment = 'center';
            app.VLabel_2.FontName = 'Dialog';
            app.VLabel_2.FontSize = 14;
            app.VLabel_2.FontWeight = 'bold';
            app.VLabel_2.FontColor = [1 1 1];
            app.VLabel_2.Position = [351 107 25 22];
            app.VLabel_2.Text = 'V';

            % Create TetaLabel_2
            app.TetaLabel_2 = uilabel(app.UIFigure);
            app.TetaLabel_2.FontName = 'Dialog';
            app.TetaLabel_2.FontSize = 14;
            app.TetaLabel_2.FontWeight = 'bold';
            app.TetaLabel_2.FontColor = [1 1 1];
            app.TetaLabel_2.Position = [442 107 33 22];
            app.TetaLabel_2.Text = 'Teta';

            % Create BusLabel_2
            app.BusLabel_2 = uilabel(app.UIFigure);
            app.BusLabel_2.FontWeight = 'bold';
            app.BusLabel_2.Position = [538 140 28 18];
            app.BusLabel_2.Text = 'Bus';

            % Create DemandLabel
            app.DemandLabel = uilabel(app.UIFigure);
            app.DemandLabel.HorizontalAlignment = 'center';
            app.DemandLabel.FontWeight = 'bold';
            app.DemandLabel.Position = [520 149 63 31];
            app.DemandLabel.Text = 'Demand';

            % Create Lamp
            app.Lamp = uilamp(app.UIFigure);
            app.Lamp.Position = [166 484 17 17];
            app.Lamp.Color = [1 1 0];

            % Create Lamp_2
            app.Lamp_2 = uilamp(app.UIFigure);
            app.Lamp_2.Position = [259 484 17 17];
            app.Lamp_2.Color = [1 1 0.0667];

            % Create Lamp_3
            app.Lamp_3 = uilamp(app.UIFigure);
            app.Lamp_3.Position = [351 484 17 17];

            % Create Lamp_4
            app.Lamp_4 = uilamp(app.UIFigure);
            app.Lamp_4.Position = [449 484 17 17];

            % Create Lamp_5
            app.Lamp_5 = uilamp(app.UIFigure);
            app.Lamp_5.Position = [449 179 17 17];
            app.Lamp_5.Color = [1 1 0];

            % Create Lamp_6
            app.Lamp_6 = uilamp(app.UIFigure);
            app.Lamp_6.Position = [351 179 17 17];
            app.Lamp_6.Color = [1 1 0];

            % Create Lamp_7
            app.Lamp_7 = uilamp(app.UIFigure);
            app.Lamp_7.Position = [259 179 17 17];

            % Create Lamp_8
            app.Lamp_8 = uilamp(app.UIFigure);
            app.Lamp_8.Position = [166 179 17 17];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = proje303_exported

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