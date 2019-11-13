function result = createDocument(obj, request)
% CREATEDOCUMENT Creates a document

% Copyright 2019 The MathWorks, Inc.

if ~isa(request, 'aws.simplesystemsmanagement.model.CreateDocumentRequest')
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected request of type aws.simplesystemsmanagement.model.CreateDocumentRequest');
end

resultJ = obj.Handle.createDocument(request.Handle);
result = aws.simplesystemsmanagement.model.CreateDocumentResult(resultJ);

end
