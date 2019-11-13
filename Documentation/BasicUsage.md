# Basic Usage

## Creating a client
The first step is to create a client to connect to the service. The client should then be initialized in order to authenticate it. See [Authentication](Authentication.m) for details on providing authentication credentials.

```matlab
ssm = aws.simplesystemsmanagement.AWSSimpleSystemsManagementClient();
% Read credentials from a JSON file rather than the AWS provider chain
ssm.useCredentialsProviderChain = false;
ssm.initialize();
```
Shutdown a client that is no longer needed using: ```ssm.shutdown();```

## Working with Parameter Store
This package currently supports only the Parameter Store features of Systems Manager. If other SSM™ functionality is of interest see the contact details in the package README. This packages uses the AWS™ Java SDK for SSM, in many error cases an exception will be thrown by this SDK, in general this package does not attempt to catch such errors and they will propagate up.

### Setting a parameter
First  create a request object, configure the necessary name, value and type properties of the parameter and then *put* the parameter into the store.

```matlab
putParameterRequest = aws.simplesystemsmanagement.model.PutParameterRequest();
putParameterRequest.setName('myParameterName');
putParameterRequest.setValue('myParameterValue');
putParameterRequest.setType('String');
putParameterResult = ssm.putParameter(putParameterRequest);
```

An enumeration for parameter types is also supported, e.g. for an encrypted string use: ```aws.simplesystemsmanagement.model.ParameterType.SecureString```. If a parameter is set to be secure by default it will use the default KMS key, however a specific key can be used using the ```setKeyId()``` method.

String lists are also supported in which case the parameter value is a comma separated character vector.

A parameter description can be set:
```matlab
putParameterRequest.setDescription('This is a parameter description');
```

By default parameters cannot be over written however using the ```setOverwrite(true)``` method this can be enabled.

To enforce a specific pattern on parameter values use ```setAllowedPattern()``` along with a regular expression, for example this can be used to permit only a numbers to be used in a parameter value:
```matlab
putParameterRequest.setAllowedPattern('^\d+$');
```


### Getting a parameter
This is very similar to putting a parameter, a request object is used and ultimately a ```Parameter``` object is returned the value of which can be returned as a character vector.

```matlab
getParameterRequest = aws.simplesystemsmanagement.model.GetParameterRequest();
getParameterRequest.setName('myParameterName');
getParameterResult = ssm.getParameter(getParameterRequest);
parameter = getParameterResult.getParameter();
resultValue = parameter.getValue();
```

If a parameter is encrypted then it should be decrypted by setting: ```            getParameterRequest.setWithDecryption(true);```



### Deleting a parameter
To delete a parameter again use a request object with the parameter name set.

```matlab
deleteParameterRequest = aws.simplesystemsmanagement.model.DeleteParameterRequest();
deleteParameterRequest.setName('myParameterName');
deleteParameterResult = ssm.deleteParameter(deleteParameterRequest);
```


### Tiers
Standard tier parameters are supported. Advanced tier parameters are not currently supported.


## References
Full details of the supported API can be found in the [API Documentation](SSMApiDoc.md). The following documents are also helpful:
* [AWS API Reference](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/index.html?com/amazonaws/services/simplesystemsmanagement/AWSSimpleSystemsManagementClient.html)
* [AWS What is System Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html)


 [//]: #  (Copyright 2019 The MathWorks, Inc.)
