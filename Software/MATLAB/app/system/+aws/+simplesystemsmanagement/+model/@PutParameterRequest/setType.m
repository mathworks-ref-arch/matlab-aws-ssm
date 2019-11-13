function setType(obj, type)
% SETTYPE Sets the type of a parameter
% type should be of type character vector or
% aws.simplesystemsmanagement.model.ParameterType
% Items in a StringList must be separated by a comma. Do not use other
% punctuation or special character to escape items in the list.
% If a parameter value requires a comma, then use the String parameter type.
%
% Valid values are:
%   SecureString
%   String
%   StringList

% Copyright 2019 The MathWorks, Inc.

if ischar(type)
    obj.Handle.setType(type);
elseif isa(type, 'aws.simplesystemsmanagement.model.ParameterType')
    obj.Handle.setType(type.toJava());
else
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected name of type character vector or aws.simplesystemsmanagement.model.ParameterType');
end

end
