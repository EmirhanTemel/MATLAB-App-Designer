classdef Emirhan_Temel_EE101_TermProject2_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure     matlab.ui.Figure
        CButton      matlab.ui.control.Button
        Button       matlab.ui.control.Button
        cotButton    matlab.ui.control.Button
        cosButton    matlab.ui.control.Button
        tanButton    matlab.ui.control.Button
        sinButton    matlab.ui.control.Button
        Switch       matlab.ui.control.Switch
        eButton      matlab.ui.control.Button
        piButton     matlab.ui.control.Button
        divButton    matlab.ui.control.Button
        sumButton    matlab.ui.control.Button
        xButton      matlab.ui.control.Button
        subtButton   matlab.ui.control.Button
        eqButton     matlab.ui.control.Button
        twoButton    matlab.ui.control.Button
        sixButton    matlab.ui.control.Button
        dotButton    matlab.ui.control.Button
        threeButton  matlab.ui.control.Button
        sevButton    matlab.ui.control.Button
        zeroButton   matlab.ui.control.Button
        fourButton   matlab.ui.control.Button
        eightButton  matlab.ui.control.Button
        oneButton    matlab.ui.control.Button
        fiveButton   matlab.ui.control.Button
        nineButton   matlab.ui.control.Button
        STextArea    matlab.ui.control.TextArea
    end



    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: oneButton
        function oneButtonPushed(app, event)
            buttonValue = '1';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: twoButton
        function twoButtonPushed(app, event)
            buttonValue = '2';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: threeButton
        function threeButtonPushed(app, event)
            buttonValue = '3';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: fourButton
        function fourButtonPushed(app, event)
            buttonValue = '4';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: fiveButton
        function fiveButtonPushed(app, event)
            buttonValue = '5';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: sixButton
        function sixButtonPushed(app, event)
            buttonValue = '6';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: sevButton
        function sevButtonPushed(app, event)
            buttonValue = '7';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: eightButton
        function eightButtonPushed(app, event)
            buttonValue = '8';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: nineButton
        function nineButtonPushed(app, event)
            buttonValue = '9';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: zeroButton
        function zeroButtonPushed(app, event)
            buttonValue = '0';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: dotButton
        function dotButtonPushed(app, event)
            buttonValue = '.';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: subtButton
        function subtButtonPushed(app, event)
            buttonValue = ' - ';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: xButton
        function xButtonPushed(app, event)
            buttonValue = ' * ';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: sumButton
        function sumButtonPushed(app, event)
            buttonValue = ' + ';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: divButton
        function divButtonPushed(app, event)
            buttonValue = ' / ';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: sinButton
        function sinButtonPushed(app, event)
            if (app.Switch.Value == 'D')
                buttonValue = 'sind';
            elseif (app.Switch.Value == 'R')
                buttonValue = 'sin';
            end
            app.STextArea.Value = append(buttonValue, '(', app.STextArea.Value, ')');
        end

        % Button pushed function: cotButton
        function cotButtonPushed(app, event)
            if (app.Switch.Value == 'D')
                buttonValue = 'cotd';
            elseif (app.Switch.Value == 'R')
                buttonValue = 'cot';
            end
            app.STextArea.Value = append(buttonValue, '(', app.STextArea.Value, ')');
        end

        % Button pushed function: cosButton
        function cosButtonPushed(app, event)
            if (app.Switch.Value == 'D')
                buttonValue = 'cosd';
            elseif (app.Switch.Value == 'R')
                buttonValue = 'cos';
            end
            app.STextArea.Value = append(buttonValue, '(', app.STextArea.Value, ')');
        end

        % Button pushed function: tanButton
        function tanButtonPushed(app, event)
            if (app.Switch.Value == 'D')
                buttonValue = 'tand';
            elseif (app.Switch.Value == 'R')
                buttonValue = 'tan';
            end
            app.STextArea.Value = append(buttonValue, '(', app.STextArea.Value, ')');
        end

        % Button pushed function: Button
        function ButtonPushed(app, event)
            buttonValue = '^';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: eButton
        function eButtonPushed(app, event)
            buttonValue = '2.7182818284';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: piButton
        function piButtonPushed(app, event)
            buttonValue = '3.141592653';
            app.STextArea.Value = append(app.STextArea.Value, buttonValue);
        end

        % Button pushed function: eqButton
        function eqButtonPushed(app, event)
            solvethis = app.STextArea.Value;
            result = str2sym(solvethis);
            lastresult = eval(result);
            app.STextArea.Value = append(app.STextArea.Value, ' = ', string(lastresult));
        end

        % Button pushed function: CButton
        function CButtonPushed(app, event)
            app.STextArea.Value = '';
            app.STextArea.Placeholder = '0';
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 632 338];
            app.UIFigure.Name = 'MATLAB App';

            % Create STextArea
            app.STextArea = uitextarea(app.UIFigure);
            app.STextArea.Editable = 'off';
            app.STextArea.HorizontalAlignment = 'right';
            app.STextArea.FontName = 'Times New Roman';
            app.STextArea.FontSize = 34;
            app.STextArea.Placeholder = '0';
            app.STextArea.Position = [16 213 602 103];

            % Create nineButton
            app.nineButton = uibutton(app.UIFigure, 'push');
            app.nineButton.ButtonPushedFcn = createCallbackFcn(app, @nineButtonPushed, true);
            app.nineButton.BackgroundColor = [1 1 1];
            app.nineButton.FontName = 'Times New Roman';
            app.nineButton.FontSize = 34;
            app.nineButton.Position = [374 143 52 54];
            app.nineButton.Text = '9';

            % Create fiveButton
            app.fiveButton = uibutton(app.UIFigure, 'push');
            app.fiveButton.ButtonPushedFcn = createCallbackFcn(app, @fiveButtonPushed, true);
            app.fiveButton.BackgroundColor = [1 1 1];
            app.fiveButton.FontName = 'Times New Roman';
            app.fiveButton.FontSize = 34;
            app.fiveButton.Position = [374 82 52 54];
            app.fiveButton.Text = '5';

            % Create oneButton
            app.oneButton = uibutton(app.UIFigure, 'push');
            app.oneButton.ButtonPushedFcn = createCallbackFcn(app, @oneButtonPushed, true);
            app.oneButton.BackgroundColor = [1 1 1];
            app.oneButton.FontName = 'Times New Roman';
            app.oneButton.FontSize = 34;
            app.oneButton.Position = [374 21 52 54];
            app.oneButton.Text = '1';

            % Create eightButton
            app.eightButton = uibutton(app.UIFigure, 'push');
            app.eightButton.ButtonPushedFcn = createCallbackFcn(app, @eightButtonPushed, true);
            app.eightButton.BackgroundColor = [1 1 1];
            app.eightButton.FontName = 'Times New Roman';
            app.eightButton.FontSize = 34;
            app.eightButton.Position = [435 143 52 54];
            app.eightButton.Text = '8';

            % Create fourButton
            app.fourButton = uibutton(app.UIFigure, 'push');
            app.fourButton.ButtonPushedFcn = createCallbackFcn(app, @fourButtonPushed, true);
            app.fourButton.BackgroundColor = [1 1 1];
            app.fourButton.FontName = 'Times New Roman';
            app.fourButton.FontSize = 34;
            app.fourButton.Position = [435 82 52 54];
            app.fourButton.Text = '4';

            % Create zeroButton
            app.zeroButton = uibutton(app.UIFigure, 'push');
            app.zeroButton.ButtonPushedFcn = createCallbackFcn(app, @zeroButtonPushed, true);
            app.zeroButton.BackgroundColor = [1 1 1];
            app.zeroButton.FontName = 'Times New Roman';
            app.zeroButton.FontSize = 34;
            app.zeroButton.Position = [435 21 52 54];
            app.zeroButton.Text = '0';

            % Create sevButton
            app.sevButton = uibutton(app.UIFigure, 'push');
            app.sevButton.ButtonPushedFcn = createCallbackFcn(app, @sevButtonPushed, true);
            app.sevButton.BackgroundColor = [1 1 1];
            app.sevButton.FontName = 'Times New Roman';
            app.sevButton.FontSize = 34;
            app.sevButton.Position = [499 143 52 54];
            app.sevButton.Text = '7';

            % Create threeButton
            app.threeButton = uibutton(app.UIFigure, 'push');
            app.threeButton.ButtonPushedFcn = createCallbackFcn(app, @threeButtonPushed, true);
            app.threeButton.BackgroundColor = [1 1 1];
            app.threeButton.FontName = 'Times New Roman';
            app.threeButton.FontSize = 34;
            app.threeButton.Position = [499 82 52 54];
            app.threeButton.Text = '3';

            % Create dotButton
            app.dotButton = uibutton(app.UIFigure, 'push');
            app.dotButton.ButtonPushedFcn = createCallbackFcn(app, @dotButtonPushed, true);
            app.dotButton.BackgroundColor = [1 1 1];
            app.dotButton.FontName = 'Times New Roman';
            app.dotButton.FontSize = 34;
            app.dotButton.Position = [499 21 52 54];
            app.dotButton.Text = '.';

            % Create sixButton
            app.sixButton = uibutton(app.UIFigure, 'push');
            app.sixButton.ButtonPushedFcn = createCallbackFcn(app, @sixButtonPushed, true);
            app.sixButton.BackgroundColor = [1 1 1];
            app.sixButton.FontName = 'Times New Roman';
            app.sixButton.FontSize = 34;
            app.sixButton.Position = [566 143 52 54];
            app.sixButton.Text = '6';

            % Create twoButton
            app.twoButton = uibutton(app.UIFigure, 'push');
            app.twoButton.ButtonPushedFcn = createCallbackFcn(app, @twoButtonPushed, true);
            app.twoButton.BackgroundColor = [1 1 1];
            app.twoButton.FontName = 'Times New Roman';
            app.twoButton.FontSize = 34;
            app.twoButton.Position = [566 82 52 54];
            app.twoButton.Text = '2';

            % Create eqButton
            app.eqButton = uibutton(app.UIFigure, 'push');
            app.eqButton.ButtonPushedFcn = createCallbackFcn(app, @eqButtonPushed, true);
            app.eqButton.BackgroundColor = [0 1 0];
            app.eqButton.FontName = 'Times New Roman';
            app.eqButton.FontSize = 34;
            app.eqButton.FontWeight = 'bold';
            app.eqButton.Position = [566 21 52 54];
            app.eqButton.Text = '=';

            % Create subtButton
            app.subtButton = uibutton(app.UIFigure, 'push');
            app.subtButton.ButtonPushedFcn = createCallbackFcn(app, @subtButtonPushed, true);
            app.subtButton.VerticalAlignment = 'top';
            app.subtButton.BackgroundColor = [0 0 0];
            app.subtButton.FontName = 'Arial';
            app.subtButton.FontSize = 34;
            app.subtButton.FontWeight = 'bold';
            app.subtButton.FontColor = [1 1 1];
            app.subtButton.Position = [245 143 52 54];
            app.subtButton.Text = '-';

            % Create xButton
            app.xButton = uibutton(app.UIFigure, 'push');
            app.xButton.ButtonPushedFcn = createCallbackFcn(app, @xButtonPushed, true);
            app.xButton.BackgroundColor = [0 0 0];
            app.xButton.FontName = 'Arial';
            app.xButton.FontSize = 34;
            app.xButton.FontWeight = 'bold';
            app.xButton.FontColor = [1 1 1];
            app.xButton.Position = [245 82 52 54];
            app.xButton.Text = 'x';

            % Create sumButton
            app.sumButton = uibutton(app.UIFigure, 'push');
            app.sumButton.ButtonPushedFcn = createCallbackFcn(app, @sumButtonPushed, true);
            app.sumButton.BackgroundColor = [0 0 0];
            app.sumButton.FontName = 'Arial';
            app.sumButton.FontSize = 34;
            app.sumButton.FontWeight = 'bold';
            app.sumButton.FontColor = [1 1 1];
            app.sumButton.Position = [306 143 52 54];
            app.sumButton.Text = '+';

            % Create divButton
            app.divButton = uibutton(app.UIFigure, 'push');
            app.divButton.ButtonPushedFcn = createCallbackFcn(app, @divButtonPushed, true);
            app.divButton.BackgroundColor = [0 0 0];
            app.divButton.FontName = 'Arial';
            app.divButton.FontSize = 34;
            app.divButton.FontWeight = 'bold';
            app.divButton.FontColor = [1 1 1];
            app.divButton.Position = [306 82 52 54];
            app.divButton.Text = '/';

            % Create piButton
            app.piButton = uibutton(app.UIFigure, 'push');
            app.piButton.ButtonPushedFcn = createCallbackFcn(app, @piButtonPushed, true);
            app.piButton.VerticalAlignment = 'top';
            app.piButton.BackgroundColor = [1 1 0.0667];
            app.piButton.FontName = 'Times New Roman';
            app.piButton.FontSize = 34;
            app.piButton.Position = [245 21 52 54];
            app.piButton.Text = 'π';

            % Create eButton
            app.eButton = uibutton(app.UIFigure, 'push');
            app.eButton.ButtonPushedFcn = createCallbackFcn(app, @eButtonPushed, true);
            app.eButton.VerticalAlignment = 'top';
            app.eButton.BackgroundColor = [1 1 0.0667];
            app.eButton.FontName = 'Times New Roman';
            app.eButton.FontSize = 34;
            app.eButton.Position = [306 21 52 54];
            app.eButton.Text = 'e';

            % Create Switch
            app.Switch = uiswitch(app.UIFigure, 'slider');
            app.Switch.Items = {'D', 'R'};
            app.Switch.FontName = 'Times New Roman';
            app.Switch.FontSize = 11;
            app.Switch.FontWeight = 'bold';
            app.Switch.Position = [34 156 63 28];
            app.Switch.Value = 'D';

            % Create sinButton
            app.sinButton = uibutton(app.UIFigure, 'push');
            app.sinButton.ButtonPushedFcn = createCallbackFcn(app, @sinButtonPushed, true);
            app.sinButton.VerticalAlignment = 'top';
            app.sinButton.BackgroundColor = [0.502 0.502 0.502];
            app.sinButton.FontName = 'Times New Roman';
            app.sinButton.FontSize = 32;
            app.sinButton.FontWeight = 'bold';
            app.sinButton.FontColor = [1 1 1];
            app.sinButton.Position = [16 82 100 54];
            app.sinButton.Text = 'sin';

            % Create tanButton
            app.tanButton = uibutton(app.UIFigure, 'push');
            app.tanButton.ButtonPushedFcn = createCallbackFcn(app, @tanButtonPushed, true);
            app.tanButton.VerticalAlignment = 'top';
            app.tanButton.BackgroundColor = [0.502 0.502 0.502];
            app.tanButton.FontName = 'Times New Roman';
            app.tanButton.FontSize = 32;
            app.tanButton.FontWeight = 'bold';
            app.tanButton.FontColor = [1 1 1];
            app.tanButton.Position = [16 21 100 54];
            app.tanButton.Text = 'tan';

            % Create cosButton
            app.cosButton = uibutton(app.UIFigure, 'push');
            app.cosButton.ButtonPushedFcn = createCallbackFcn(app, @cosButtonPushed, true);
            app.cosButton.VerticalAlignment = 'top';
            app.cosButton.BackgroundColor = [0.502 0.502 0.502];
            app.cosButton.FontName = 'Times New Roman';
            app.cosButton.FontSize = 32;
            app.cosButton.FontWeight = 'bold';
            app.cosButton.FontColor = [1 1 1];
            app.cosButton.Position = [130 82 100 54];
            app.cosButton.Text = 'cos';

            % Create cotButton
            app.cotButton = uibutton(app.UIFigure, 'push');
            app.cotButton.ButtonPushedFcn = createCallbackFcn(app, @cotButtonPushed, true);
            app.cotButton.VerticalAlignment = 'top';
            app.cotButton.BackgroundColor = [0.502 0.502 0.502];
            app.cotButton.FontName = 'Times New Roman';
            app.cotButton.FontSize = 32;
            app.cotButton.FontWeight = 'bold';
            app.cotButton.FontColor = [1 1 1];
            app.cotButton.Position = [130 21 100 54];
            app.cotButton.Text = 'cot';

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.VerticalAlignment = 'bottom';
            app.Button.BackgroundColor = [0 0 0];
            app.Button.FontName = 'Arial';
            app.Button.FontSize = 34;
            app.Button.FontWeight = 'bold';
            app.Button.FontColor = [1 1 1];
            app.Button.Position = [177 143 53 54];
            app.Button.Text = '^';

            % Create CButton
            app.CButton = uibutton(app.UIFigure, 'push');
            app.CButton.ButtonPushedFcn = createCallbackFcn(app, @CButtonPushed, true);
            app.CButton.BackgroundColor = [1 0 0];
            app.CButton.FontName = 'Bookman';
            app.CButton.FontSize = 34;
            app.CButton.FontWeight = 'bold';
            app.CButton.FontColor = [1 1 1];
            app.CButton.Position = [115 143 52 54];
            app.CButton.Text = 'C';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Emirhan_Temel_EE101_TermProject2_exported

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