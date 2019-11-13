function setOverwrite(obj, overwrite)
% OVERWRITE Overwrite an existing parameter
% If not specified, will default to false.

% Copyright 2019 The MathWorks, Inc.

if ~islogical(overwrite)
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected overwrite of type logical');
end

obj.Handle.setOverwrite(java.lang.Boolean(overwrite));

end
