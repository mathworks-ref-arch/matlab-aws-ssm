function setKeyId(obj, keyId)
% SETKEYID Sets KMS Key ID to use to encrypt a parameter
% keyId should be of type character vector.
% This is a required for parameters that use the SecureString data type.
% If a key ID is not specified, i.e. this function is not called the system uses
% the default key associated with the AWS account.
% To use a custom KMS key, choose the SecureString data type with the Key ID
% parameter.

% Copyright 2019 The MathWorks, Inc.

if ~ischar(keyId)
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected keyId of type character vector');
end

obj.Handle.setKeyId(keyId);

end
