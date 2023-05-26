classdef Emirhan_Temel_EE101_TermProject1_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        AdjustVolumeKnob                matlab.ui.control.Knob
        AdjustVolumeKnobLabel           matlab.ui.control.Label
        PlayLabel                       matlab.ui.control.Label
        RecordLabel                     matlab.ui.control.Label
        TimeReversalofVoiceSwitch       matlab.ui.control.Switch
        TimeReversalofVoiceSwitchLabel  matlab.ui.control.Label
        AdjustSpeedKnob                 matlab.ui.control.Knob
        AdjustSpeedKnobLabel            matlab.ui.control.Label
        PlayButton                      matlab.ui.control.Button
        Record_Button                   matlab.ui.control.Button
        UIAxes2                         matlab.ui.control.UIAxes
        UIAxes                          matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Record_Button
        function Record_ButtonPushed(app, event)
            
            recordObj = audiorecorder;

            recordblocking(recordObj, 2);

            assignin( "base", "recordObj", recordObj);

        end

        % Button pushed function: PlayButton
        function PlayButtonPushed(app, event)
            playObj = evalin( "base", "recordObj");

            SR = playObj.SampleRate;
            plotdata = getaudiodata(playObj);
            reverseddata = flipud(plotdata);
            speed = app.AdjustSpeedKnob.Value;
            volume = app.AdjustVolumeKnob.Value;
            timedomain = linspace(0,length(plotdata)/SR,length(plotdata));
            freq = real(fft(plotdata));
          
            plot(app.UIAxes2,freq);
            plot(app.UIAxes,timedomain,plotdata);
            
            if app.TimeReversalofVoiceSwitch.Value == "Straight"
                sound(plotdata*volume, SR*speed);
            
            elseif app.TimeReversalofVoiceSwitch.Value == "Reversed"
                sound(reverseddata*volume, SR*speed);
            end

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [1 1 1];
            app.UIFigure.Position = [100 100 713 461];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Audio Sample')
            xlabel(app.UIAxes, 'Time (sec)')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [38 228 300 185];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.UIFigure);
            title(app.UIAxes2, 'Transformed Data')
            xlabel(app.UIAxes2, 'Frequency (Hz)')
            zlabel(app.UIAxes2, 'Z')
            app.UIAxes2.Position = [381 228 300 185];

            % Create Record_Button
            app.Record_Button = uibutton(app.UIFigure, 'push');
            app.Record_Button.ButtonPushedFcn = createCallbackFcn(app, @Record_ButtonPushed, true);
            app.Record_Button.Icon = 'mi.png';
            app.Record_Button.IconAlignment = 'center';
            app.Record_Button.Position = [39 71 52 85];
            app.Record_Button.Text = '';

            % Create PlayButton
            app.PlayButton = uibutton(app.UIFigure, 'push');
            app.PlayButton.ButtonPushedFcn = createCallbackFcn(app, @PlayButtonPushed, true);
            app.PlayButton.Icon = 'pi.png';
            app.PlayButton.IconAlignment = 'center';
            app.PlayButton.Position = [122 71 91 85];
            app.PlayButton.Text = '';

            % Create AdjustSpeedKnobLabel
            app.AdjustSpeedKnobLabel = uilabel(app.UIFigure);
            app.AdjustSpeedKnobLabel.HorizontalAlignment = 'center';
            app.AdjustSpeedKnobLabel.Position = [243 50 77 22];
            app.AdjustSpeedKnobLabel.Text = 'Adjust Speed';

            % Create AdjustSpeedKnob
            app.AdjustSpeedKnob = uiknob(app.UIFigure, 'continuous');
            app.AdjustSpeedKnob.Limits = [0 2];
            app.AdjustSpeedKnob.Position = [258 91 46 46];
            app.AdjustSpeedKnob.Value = 1;

            % Create TimeReversalofVoiceSwitchLabel
            app.TimeReversalofVoiceSwitchLabel = uilabel(app.UIFigure);
            app.TimeReversalofVoiceSwitchLabel.HorizontalAlignment = 'center';
            app.TimeReversalofVoiceSwitchLabel.Position = [464 95 129 22];
            app.TimeReversalofVoiceSwitchLabel.Text = 'Time Reversal of Voice';

            % Create TimeReversalofVoiceSwitch
            app.TimeReversalofVoiceSwitch = uiswitch(app.UIFigure, 'slider');
            app.TimeReversalofVoiceSwitch.Items = {'Straight', 'Reversed'};
            app.TimeReversalofVoiceSwitch.Position = [505 132 45 20];
            app.TimeReversalofVoiceSwitch.Value = 'Straight';

            % Create RecordLabel
            app.RecordLabel = uilabel(app.UIFigure);
            app.RecordLabel.Position = [44 50 44 22];
            app.RecordLabel.Text = 'Record';

            % Create PlayLabel
            app.PlayLabel = uilabel(app.UIFigure);
            app.PlayLabel.Position = [154 50 29 22];
            app.PlayLabel.Text = 'Play';

            % Create AdjustVolumeKnobLabel
            app.AdjustVolumeKnobLabel = uilabel(app.UIFigure);
            app.AdjustVolumeKnobLabel.HorizontalAlignment = 'center';
            app.AdjustVolumeKnobLabel.Position = [348 50 82 22];
            app.AdjustVolumeKnobLabel.Text = 'Adjust Volume';

            % Create AdjustVolumeKnob
            app.AdjustVolumeKnob = uiknob(app.UIFigure, 'continuous');
            app.AdjustVolumeKnob.Position = [365 91 46 46];
            app.AdjustVolumeKnob.Value = 50;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Emirhan_Temel_EE101_TermProject1_exported

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