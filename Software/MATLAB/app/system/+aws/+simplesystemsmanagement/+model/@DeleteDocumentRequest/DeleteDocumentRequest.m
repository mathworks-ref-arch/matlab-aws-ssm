classdef DeleteDocumentRequest < aws.Object
% DELETEDOCUMENTREQUEST Object to represent a deleteDocument request

% Copyright 2019 The MathWorks, Inc.

methods
    function obj = DeleteDocumentRequest(varargin)

        if nargin == 0
            obj.Handle = com.amazonaws.services.simplesystemsmanagement.model.DeleteDocumentRequest();
        elseif nargin == 1
            if ~isa(varargin{1}, 'com.amazonaws.services.simplesystemsmanagement.model.DeleteDocumentRequest')
                logObj = Logger.getLogger();
                write(logObj,'error','argument not of type com.amazonaws.services.simplesystemsmanagement.model.DeleteDocumentRequest');
            else
                obj.Handle = varargin{1};
            end
        else
            logObj = Logger.getLogger();
            write(logObj,'error','Invalid number of arguments');
        end
    end
end

end
