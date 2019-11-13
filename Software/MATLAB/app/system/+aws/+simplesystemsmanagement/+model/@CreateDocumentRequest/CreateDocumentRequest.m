classdef CreateDocumentRequest < aws.Object
% CREATEDOCUEMTNREQUEST Object to represent a createDocument request

% Copyright 2019 The MathWorks, Inc.

methods
    function obj = CreateDocumentRequest(varargin)

        if nargin == 0
            obj.Handle = com.amazonaws.services.simplesystemsmanagement.model.CreateDocumentRequest();
        elseif nargin == 1
            if ~isa(varargin{1}, 'com.amazonaws.services.simplesystemsmanagement.model.CreateDocumentRequest')
                logObj = Logger.getLogger();
                write(logObj,'error','argument not of type com.amazonaws.services.simplesystemsmanagement.model.CreateDocumentRequest');
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
