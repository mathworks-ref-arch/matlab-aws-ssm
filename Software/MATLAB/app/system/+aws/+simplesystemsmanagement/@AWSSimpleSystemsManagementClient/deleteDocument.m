function result = deleteDocument(obj, request)
% DELETEDOCUMENT Delete a document from the system

% Copyright 2019 The MathWorks, Inc.

if ~isa(request, 'aws.simplesystemsmanagement.model.DeleteDocumentRequest')
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected request of type aws.simplesystemsmanagement.model.DeleteDocumentRequest');
end

resultJ = obj.Handle.deleteDocument(request.Handle);
result = aws.simplesystemsmanagement.model.DeleteDocumentResult(resultJ);

end
