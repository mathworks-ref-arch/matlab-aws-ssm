function setName(obj, name)
% SETNAME Sets the name of a parameter
% name should be of type character vector.
% The fully qualified name includes the complete hierarchy of the parameter path
% and name, e.g.: /Dev/DBServer/MySQL/db-string13
% Naming Constraints:
%   Parameter names are case sensitive.
%   A parameter name must be unique within an AWS Region
%   A parameter name can't be prefixed with "aws" or "ssm" (case-insensitive).
%   Parameter names can include only the following symbols and letters: a-zA-Z0-9_.-/
%   A parameter name can't include spaces.
%   Parameter hierarchies are limited to a maximum depth of fifteen levels.
%   The maximum length for the fully qualified parameter name is 1011 characters.


% Copyright 2019 The MathWorks, Inc.

if ~ischar(name)
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected name of type character vector');
end

obj.Handle.setName(name);

end
