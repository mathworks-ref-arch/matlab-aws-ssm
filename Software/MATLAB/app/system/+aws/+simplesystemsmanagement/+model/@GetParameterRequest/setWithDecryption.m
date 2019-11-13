function setWithDecryption(obj, withDecryption)
% SETWITHDECRYPTION Return decrypted values for secure string parameters
% withDecryption should be of type logical.

% Copyright 2019 The MathWorks, Inc.

if ~islogical(withDecryption)
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected withDecryption of type logical');
end

obj.Handle.setWithDecryption(java.lang.Boolean(withDecryption));

end
