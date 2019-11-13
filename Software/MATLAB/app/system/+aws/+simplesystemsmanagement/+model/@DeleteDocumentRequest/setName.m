function setName(obj, name)
% SETNAME Sets the name of a document
% name should be of type character vector.

% Copyright 2019 The MathWorks, Inc.

if ~ischar(name)
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected name of type character vector');
end

obj.Handle.setName(name);

end
