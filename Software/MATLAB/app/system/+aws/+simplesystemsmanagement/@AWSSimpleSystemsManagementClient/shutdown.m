function shutdown(obj)
% SHUTDOWN Method to shutdown a client and release resources
% This method should be called to cleanup a client which is no longer
% required.

% Copyright 2019 The MathWorks, Inc.

obj.Handle.shutdown();

end
