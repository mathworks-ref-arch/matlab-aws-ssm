function type = getType(obj)
% GETTYPE Returns the type of a parameter as a character vector

% Copyright 2019 The MathWorks, Inc.

type = char(obj.Handle.getType());

end
