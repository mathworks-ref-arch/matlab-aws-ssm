function setAllowedPattern(obj, allowedPattern)
% SETALLOWEDPATTERN Sets a regular expression used to validate the parameter value

% Copyright 2019 The MathWorks, Inc.

if ~ischar(allowedPattern)
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected allowedPattern of type character vector');
end

obj.Handle.setAllowedPattern(allowedPattern);

end
