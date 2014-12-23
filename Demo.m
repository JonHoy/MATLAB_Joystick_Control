%% Sample Code for Xbox 360 Controller for Windows

% Visit http://sharpdx.org/documentation/api for more API details

controllerLibrary = NET.addAssembly([pwd '\SharpDX.XInput.dll']);
myController = SharpDX.XInput.Controller(SharpDX.XInput.UserIndex.One);

VibrationLevel = SharpDX.XInput.Vibration;
i = 1;

% Infinite do-loop 
while true
    State = myController.GetState();
    VibrationLevel.LeftMotorSpeed = State.Gamepad.LeftTrigger;
    VibrationLevel.RightMotorSpeed = State.Gamepad.RightTrigger;
    i = i + 1;
    Left(i) = double(State.Gamepad.LeftTrigger);
    Right(i) = double(State.Gamepad.RightTrigger);
    Time(i) = i;
    myController.SetVibration(VibrationLevel); % If your controller supports vibration
    clf
    plot(Time, Left, 'r');
    hold on
    plot(Time, Right, 'b');
    pause(.1);
end    




