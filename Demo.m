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
    VibrationLevel.LeftMotorSpeed = State.Gamepad.LeftTrigger;
    VibrationLevel.RightMotorSpeed = State.Gamepad.RightTrigger;
    Left(i) = double(State.Gamepad.LeftTrigger);
    Right(i) = double(State.Gamepad.RightTrigger);
    Time(i) = i;
    myController.SetVibration(VibrationLevel); % If your controller supports vibration
    clf
    scatter(Time, Left, 'r');
    hold on
    scatter(Time, Right, 'b');
    pause(.001);
end    




