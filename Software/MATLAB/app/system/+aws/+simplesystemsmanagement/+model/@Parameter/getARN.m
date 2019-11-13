function arn = getARN(obj)
% GETARN Returns the ARN of a parameter as a character vector

% Copyright 2019 The MathWorks, Inc.

arn = char(obj.Handle.getARN());

end
