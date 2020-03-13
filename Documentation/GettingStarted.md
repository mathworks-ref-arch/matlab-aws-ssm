# Getting Started

Once this package is installed and authentication is in place one can begin working with SSM™ and looking at simple workflows. The [Basic Usage](BasicUsage.md) and [API Reference](SSMApiDoc.md) documents provides greater details on the classes and methods being used along with information on error checking.

## Write and Read a Parameter
```matlab
% Create client
ssm = aws.simplesystemsmanagement.AWSSimpleSystemsManagementClient();
% Use local static credentials rather than the provider chain in this case
ssm.useCredentialsProviderChain = true;
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

## Logging
When getting started or debugging it can be helpful to get more feedback. Once the Client has been created one can set the logging level to verbose as follows:
```
logObj = Logger.getLogger();
logObj.DisplayLevel = 'verbose';
```
See: [Logging](Logging.md) for more details.


## Network proxy configuration

Many corporate networks require Internet access to take place via a proxy server. This includes the traffic between a MATLAB® session and Amazon.

Within the MATLAB environment it is possible to specify the proxy settings using the web section of the preferences panel as shown:   
![Preferences_Panel](Images/prefspanel.png)   
Often a username and password are not required.

In Windows it is also possible to specify the proxy settings in Control Panel / Internet Options / Connections tab.

Other operating systems have similar network preference controls. Depending on the network environment the proxy settings may also be configured automatically. However, by default the Client will only use a proxy server once configured to do so. Furthermore a complex proxy environment may use different proxies for different traffic types and destinations.

A proxy is configured using the a ClientConfiguration object which is a property of the client. When the client is create if a proxy is configured in the MATLAB proxy configuration preferences then these values will be used and applied when the client is initialized. On Windows, were these not provided in the MATLAB preferences the Windows proxy settings would be used instead. Thus no intervention is required. However it is possible to override the preferences and set proxy related values or reload values based on updated preferences to use a specific proxy and port as follows. Note, this does not alter the settings in the MATLAB preferences panel.
```
client.clientConfiguration.setProxyHost('proxyHost','myproxy.example.com');
client.clientConfiguration.setProxyPort(8080);
```
The client is now configured to use the proxy settings given rather than those in the MATLAB preferences panel. In this case a username and password are not provided. They are normally not required for proxy access.

Specify an automatic configuration URL as follows:
```
client.clientConfiguration.setProxyHost('autoURL','https://myexampleurl.amazonaws.com');
client.clientConfiguration.setProxyPort('https://myexampleurl.amazonaws.com');
```
This instructs the client to request a proxy port and host based on traffic to
https://myexampleurl.amazonaws.com. Note, this is not the URL of the proxy itself. Different proxies may be in place to cover traffic to different addresses, so it should be a valid Amazon URL and may need to correspond to the service being used. By default https://s3.amazonaws.com is used.

To use the username and password from the MATLAB preferences call:
```
client.clientConfiguration.setProxyUsername();
client.clientConfiguration.setProxyPassword();
```
Or to specify a username and password directly call:
```
client.clientConfiguration.setProxyUsername('myProxyUsername');
client.clientConfiguration.setProxyPassword('myProxyPassword');
```

If a proxy server is being used, then the proxy values need to be configured as shown, this should be done before the client is initialized.

[//]: #  (Copyright 2019 The MathWorks, Inc.)
