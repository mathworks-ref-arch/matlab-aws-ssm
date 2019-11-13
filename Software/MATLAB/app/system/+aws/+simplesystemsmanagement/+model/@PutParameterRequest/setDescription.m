function setDescription(obj, description)
% SETDESCRIPTION Sets information about the parameter
% description should be of type character vector.

% Copyright 2019 The MathWorks, Inc.

if ~ischar(description)
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected description of type character vector');
end

obj.Handle.setDescription(description);

end
