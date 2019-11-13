function setContent(obj, content)
% SETCONTENT Sets the content of a document
% content should be a valid JSON or YAML string.

% Copyright 2019 The MathWorks, Inc.

if ~ischar(content)
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected content of type character vector');
end

obj.Handle.setContent(content);

end
