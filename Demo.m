%% Sample Code for Xbox 360 Controller for Windows

% Visit http://sharpdx.org/documentation/api for more API details

controllerLibrary = NET.addAssembly([pwd '\SharpDX.XInput.dll']);
myController = SharpDX.XInput.Controller(SharpDX.XInput.UserIndex.One);

VibrationLevel = SharpDX.XInput.Vibration;

Left = zeros(100,1);
Right = zeros(100,1);
Time = zeros(100,1);

for i = 1:1000
    State = myController.GetState();
    ButtonStates = ButtonStateParser(State.Gamepad.Buttons); % Put this into a structure
    disp(State.Gamepad);
    disp(ButtonStates);
    VibrationLevel.LeftMotorSpeed = double(State.Gamepad.LeftTrigger) * 255;
    VibrationLevel.RightMotorSpeed = double(State.Gamepad.RightTrigger) * 255;
    Left(i) = double(State.Gamepad.LeftTrigger);
    Right(i) = double(State.Gamepad.RightTrigger);
    Time(i) = i;
    myController.SetVibration(VibrationLevel); % If your controller supports vibration
    clf
    plot(Time, Left, 'r');
    hold on
    plot(Time, Right, 'b');
    pause(.001);
end    

VibrationLevel.LeftMotorSpeed = 0;
VibrationLevel.RightMotorSpeed = 0;
myController.SetVibration(VibrationLevel); % If your controller supports vibration

