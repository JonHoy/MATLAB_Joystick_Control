function ButtonState = ButtonStateParser(GamepadButtonFlags)

GamepadButtonFlags = double(GamepadButtonFlags);

fields = {
    'DPadUp'
    'DPadDown'
    'DPadLeft'
    'DpadRight'
    'Start'
    'Back'
    'LeftStick'
    'RightStick'
    'LeftBumper'
    'RightBumper'
    'A'
    'B'
    'X'
    'Y'
    };
masks = [
    1
    2
    4
    8
    16
    32
    64
    128
    256
    512
    4096
    8192
    16384
    32768
];

try
for i = 1:numel(fields)
    ButtonState.(fields{i}) = logical(bitand(GamepadButtonFlags,masks(i),'int32'));
end

catch ex
    disp(ex)
end

end

