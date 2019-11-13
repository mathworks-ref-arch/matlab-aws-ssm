function setDocumentType(obj, type)
% SETDOCUMENTTYPE Sets the type of a document
% type should be of type character vector.
% Valid values are:
%   Automation 
%   Command 
%   Package 
%   Policy 
%   Session 

% Copyright 2019 The MathWorks, Inc.

if ~ischar(type)
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected name of type character vector');
end

obj.Handle.setDocumentType(type);

end
