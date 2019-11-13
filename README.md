# MATLAB Interface *for AWS Systems Manager*

MATLAB® interface for the Amazon Web Services Systems Manager™. Systems Manager (formerly Simple Systems Management (SSM)) provides a collection of capabilities for configuring and managing Amazon EC2 instances, on-premises servers and virtual machines (VMs), and certain other AWS resources.

The complete Systems Manager is API very large. This package implements limited Parameter Store support. If additional features and methods would be helpful to you please submit an enhancement request as detailed below.

## Requirements
### MathWorks products
* Requires MATLAB release R2017a or later.
* AWS Common utilities found at https://github.com/mathworks-ref-arch/matlab-aws-common

### 3rd party products
* Amazon Web Services account   

To build a required JAR file:   
* [Maven](https://maven.apache.org/)
* JDK 7
* [AWS SDK for Java](https://aws.amazon.com/sdk-for-java/) (version 1.11.567 or later)

## Getting Started
Please refer to the [Documentation](Documentation/README.md) to get started.
The [Installation Instructions](Documentation/Installation.md) and [Getting Started](Documentation/GettingStarted.md) documents provide detailed instructions on setting up and using the interface. The easiest way to
fetch this repository and all required dependencies is to clone the top-level repository using:

```bash
git clone --recursive https://github.com/mathworks-ref-arch/mathworks-aws-support.git
```

### Build the AWS SDK for Java components
The MATLAB code uses the AWS SDK for Java and can be built using:
```bash
cd Software/Java
mvn clean package
```

Once built, use the ```/Software/MATLAB/startup.m``` function to initialize the interface which will use the AWS Credentials Provider Chain to authenticate. Please see the [relevant documentation](Documentation/Authentication.md) on how to specify the credentials.

### Write and read a parameter
```matlab
% Create client
ssm = aws.simplesystemsmanagement.AWSSimpleSystemsManagementClient();
% Use local static credentials rather than the provider chain in this case
ssm.useCredentialsProviderChain = false;
% Initialize the client
ssm.initialize();
% Now use the client to carry out actions

% Set some values
myParameterName = 'mytestparamname12345678';
myParameterValue = 'mytestparamvalue12345678';

% Build a put parameter request
putParameterRequest = aws.simplesystemsmanagement.model.PutParameterRequest();
putParameterRequest.setName(myParameterName);
putParameterRequest.setValue(myParameterValue);
putParameterRequest.setType('String');

% Use the request to put the parameter
putParameterResult = ssm.putParameter(putParameterRequest);

% Build a get parameter request
getParameterRequest = aws.simplesystemsmanagement.model.GetParameterRequest();
getParameterRequest.setName(myParameterName);
getParameterResult = ssm.getParameter(getParameterRequest);

% Use the request to get the parameter set above
parameter = getParameterResult.getParameter();

% The returned value should equal the previously set value
returnedValue = parameter.getValue();

% Delete the parameter when no longer needed
deleteParameterRequest = aws.simplesystemsmanagement.model.DeleteParameterRequest();
deleteParameterRequest.setName(myParameterName);
deleteParameterResult = ssm.deleteParameter(deleteParameterRequest);

% Shutdown the client when no longer needed
ssm.shutdown();
```

## Supported Products:
1. [MATLAB](https://www.mathworks.com/products/matlab.html) (R2017a or later)
2. [MATLAB Compiler™](https://www.mathworks.com/products/compiler.html) and [MATLAB Compiler SDK™](https://www.mathworks.com/products/matlab-compiler-sdk.html) (R2017a or later)
3. [MATLAB Production Server™](https://www.mathworks.com/products/matlab-production-server.html) (R2017a or later)
4. [MATLAB Parallel Server™](https://www.mathworks.com/products/distriben.html) (R2017a or later)

## License
The license for the MATLAB Interface *for AWS Systems Manager* is available in the [LICENSE.TXT](LICENSE.TXT) file in this GitHub repository. This package uses certain third-party content which is licensed under separate license agreements. See the [pom.xml](Software/Java/pom.xml) file for third-party software downloaded at build time.

## Enhancement Request
Provide suggestions for additional features or capabilities using the following link:   
https://www.mathworks.com/products/reference-architectures/request-new-reference-architectures.html

## Support
Email: `mwlab@mathworks.com` or please log an issue.    

[//]: #  (Copyright 2019 The MathWorks, Inc.)
