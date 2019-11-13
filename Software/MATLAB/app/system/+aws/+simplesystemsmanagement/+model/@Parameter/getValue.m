function value = getValue(obj)
% GETVALUE Returns the value of a parameter as a character vector

% Copyright 2019 The MathWorks, Inc.

value = char(obj.Handle.getValue());

end
