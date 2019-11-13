function setValue(obj, value)
% SETVALUE Sets the value of a document
% value should be of type character vector.

% Copyright 2019 The MathWorks, Inc.

if ~ischar(value)
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected value of type character vector');
end

obj.Handle.setValue(value);

end
