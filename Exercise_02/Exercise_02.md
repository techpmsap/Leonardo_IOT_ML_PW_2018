<table width=100% border=>
<tr><td colspan=2><h1>EXERCISE 02 - IoT : Installing and configuring Gateway Edge for MQTT protocol</h1></td></tr>
<tr><td><h3>SAP Partner Workshop</h3></td><td><h1><img src="images/clock.png"> &nbsp;60 mins</h1></td></tr>
</table>


## Description
This document provides you with the exercises for the hands-on session on SAP Cloud Platform, Internet of Things. This scenario will help you to go through the following activities:
* IoT Gateway Edge provisioning with MQTT protocol
* Automatic device and sensor on boarding with Gateway Edge using MQTT protocol
* Sending Data with PAHO MQTT Client
* Consume Data via IoT Services Cockpit and APIs

>NOTE: Use Google Chrome browser. 


## Target group

* Developers
* People interested in SAP Leonardo and Machine Learning 


## Goal

The goal of this exercise is to unserstand how IoT Gateway Edge works, how to onboard a new device with Gateway Edge using MQTT protocol, how to send data with PAHO MQTT Client and finally how to consume them via IoT Services Cockpit and APIs



## Prerequisites
  
Here below are prerequisites for this exercise.

* An SAP IoT Service system. It will be provided by your instructor
* A remote desktop connection app to access the remote system


## Steps


1. [Introduction](#introduction)
1. [Setup of IoT Gateway Edge for MQTT Protocol](#edge-setup)
1. [Automatic Device onboarding](#device-onboarding)
1. [Sending messages via MQTT using PAHO client](#mqtt-paho)



### <a name="introduction"></a> Introduction
The SAP Cloud Platform Internet of Things (IoT) services offer a feature rich cloud enablement & generic data treatment services, which can be used to develop end-to-end IoT applications. The SAP Cloud Platform Internet of Things enables customers and partners to develop, customize, and operate IoT business applications in the cloud. This platform provides lifecycle management at scale for IoT devices from onboarding to decommissioning. It also provides a way to securely connect to remote devices over a broad variety of IoT protocols. It provides gateway Edge which provides one-premise IoT edge processing and also gateway cloud which does centralized cloud based processing.  

Key strength of SAP Cloud Platform Internet of Things (IoT) includes

* Scalable ingestion of IoT data and broad device connectivity
* Large scale device management

The Internet of Things service cockpit is the user interface of the Internet of Things service and provides access to various functions. It is the main interface for users to interact with the Internet of Things core service. It can be used creating user & tenants. Creating device data model, Device Onboarding and adding new networks etc. it can also be used to deploy interceptors, retrieve network logs, visualize the data which is being ingested via IoT devices/sensors.
	![](images/01.png)
	

### <a name="edge-setup"></a> Setup of IoT Gateway Edge for MQTT Protocol
1.	Open a terminal window and go to the folder where your IoT Gateway Edge application is located. In your case it should be under *C:\student\IoTGateway*  
	![](images/02.png)
	
1. Run the command

	```sh
	build.bat MQTT
	```
	![](images/03.png)

1.	The script should run successfully and you should see the results as shown in the picture  
	![](images/04.png)

1.	Please Log on to the IoT Cockpit of SAP Cloud Platform Internet of Thing with the tenant user credentials provided by your instructor  
	![](images/05.png)

1.	Click on your **username** at the top right corner of the page  
	![](images/06.png)

1.	Click on the **Download** link to download the certificate for connecting the Gateway Edge to the IoT Service. Pay attention to the place where this file is downloaded  
	![](images/07.png)
1. A certificate is downloaded in the Download folder: you can reach it also from the browser's footer bar
	![](images/08.png)

1.	Go to the *config* folder inside your IoTGateway installation and create a new subfolder  
	![](images/09.png)

1.	Name this new folder as *certificates*  
	![](images/10.png)

1.	Go to the *Downloads* folder, select the certificate zip file you have just downloaded, right click on it and choose **7-Zip -> Extract files...**   
	![](images/11.png)

1.	Extract to *C:\Student\IoTGateway\config\certificates* and deselect the checkbox to extract to a subfolder of this path; then click **OK**  
	![](images/12.png)

1.	The required files are extracted in the proper folder  
	![](images/13.png)

1.	Right click on the *pswd.properties* file and choose **Edit with Notepad++**  
	![](images/14.png)

1.	Enter the **password** for your IoT user and save the file  
	![](images/15.png)

1.	Right click on the *config\_gateway\_mqtt.xml* file in the *config* folder of your Gateway Edge installation and choose **Edit with Notepad++**  
	![](images/16.png)

1.	Just for the two tags **amq** and **coreBundles** replace all the occurrences of the IP string **127.0.0.1** with the **\<HOST\_NAME\>** of your IoT Service (you should have just 3 occurrences)  
	![](images/17.png)

1.	You should get something like this. Remember to **save** the file  
	![](images/18.png)

1. Go to the URL <https://www.random.org/bytes> and generate a hexadecimal random code with length 8. 
	![](images/19.png)

1. Copy the generated code in the clipboard  
	![](images/20.png)

1. Search for the tag `<cnf:gateway>` in the *config\_gateway\_mqtt.xml* file and change it to
`<cnf:gateway gatewayAlternateId="<<< generated code>>> ">` where **<<< generated code >>>** must be replaced with the code you copied in the clipboard removing all the included space characters: you need to keep just the letters and numbers. Then **save** the file  
	![](images/21.png)

1.	Go back to the terminal window and execute the command `gateway.bat` to start the Gateway Edge onboarding process  
	![](images/22.png)

1. The Gateway Edge starts  
	![](images/23.png)

1.	In the IoT Service cockpit, go to the **Gateways** menu. You should see the started gateway successfully running  
	![](images/24.png)

1. Click on the **Capabilites** tab and then on the **+** sign to create a new capability
	![](images/25.png)

1. Enter "CO2" as the Capability name and after adding the following property click on **Create**  

	| Parameter | Value |
	| --------- | ----- |
	| Name | CO2 |
	| Data Type| integer |
	| Unit of Measure| ppm |
	 
	![](images/26.png)

1. Copy this line and paste it in your editor (Notepad++ is recommended)

	```json
	{"capabilityAlternateId":[""],"measures":[300],"sensorTypeAlternateId":""}
	```

	![](images/27.png)

1. Copy and paste the alternate ID of the new capability between the two double quotes of the **capabilityAlternateID** parameter in the json string you have in the text editor  
	![](images/28.png)

1. Click on the **Sensor Types** tab and create a new sensor type by pressing on the **+** sign  
	![](images/29.png)

1. Name this sensor type as *gh\_pollution\_sensor\_type\_xx* (where **xx** must be replaced by your workstation ID) and add the capability you have created earlier by choosing **measure** as **Type**. Then click **Create**  
	![](images/30.png)

1. Even in this case, copy the alternate ID of this sensor type in the Json file  
	![](images/31.png)

1.	Go to the folder where your Paho Client is installed and launch it  	![](images/32.png)
	   
1.	Click **Run** if you get this Security Warning  
	![](images/33.png)

1.	Click on the "**+**" sign to crate a new connection  
	![](images/34.png)

1. Rename this new connection as "connection2", enter the server URI `tcp://localhost:61618` and click on **Connect**  
	![](images/35.png)

1.	You should be able to see that the status now is **Connected**  
	![](images/36.png)

1. Congratulations! You have successfully setup your Gateway Edge.



### <a name="device-onboarding"></a> Automatic device onboarding
Each device exchanges data with a specific protocol (for example: MQTT in this exercise).  Each device corresponds to 1 unique physical node. We need to create physical node that corresponds to a physical device. In this section, it is described how to automatically provision a device for the MQTT network and how to automatically onboard sensors for the device.

1. Go to the URL <https://www.random.org/bytes> and generate a hexadecimal random code with length 4  
	![](images/37.png)

1. Copy this code in the clipboard  
	![](images/38.png)

1.	Go to connection2 in your Paho Client and enter the string `measures/<MAC_ADDRESS>` in the **Publication -> Topic** textbox. Replace the **<MAC_ADDRESS**> with the code you copied in the clipboard, replacing all the spaces with colon (":"). Use default setting for QoS and enter the JSON script you composed in the editor in the **Message** text area. When finished click on **Publish** 

	![](images/39.png)

1. In the Paho Client's history tab you should be able to see the event "**Published**"  
	![](images/40.png)
	
1.	Go to IoT Cockpit and select the **Devices** menu: you can see the new device automatically onboarded with the CO2 sensor. Click on the device name   
	![](images/41.png)

1. Click on the **Edit** button on the top right corner to change the name of this device
	![](images/42.png)

1. Enter the name **gh\_pollution\_device\_xx**, where **xx** must be replaced by your workstation ID, and click **Confirm**  
	![](images/43.png)

1. Now click on the sensor name
	![](images/44.png)

1. Change the sensor name by naming it as **gh\_pollution\_sensor\_xx**, where **xx** must be replaced by your workstation ID, and click **Update**  
	![](images/45.png)

1. This is what you should see at the end of this process
	![](images/46.png)

1.	Click on the **Data Visualization** tab, choose the new sensor, the new capability and the new measure and you should see the only measure of 300 we have sent to the console  
	![](images/47.png)

1. Congratulations! You have successfully onboarded a new device and a new sensor.


### <a name="mqtt-paho"></a> Sending messages via MQTT using PAHO client
In this step, we will send the data from Device Simulator that supports MQTT protocol. We have already on-boarded this simulator device during previous steps. Once we send the data, it would be received by Internet of Things Gateway Edge, which will send the data to IoT Core Services and data would be visible  in the IoT services cockpit and vis APIs.

1.	Go to your MQTT PAHO Client and modify the Message options under Publication section by changing the temperature value. For example, since you set it to 300 with the first message, you can think to increase it to 350. Once done click on the **Publish** button  

1. Do this several times so that you have several messages with different temperature values. Once done you should see different messages in the History tab of Paho Client  
	![](images/48.png)

1. Go back to the Data Visualization page and refresh the graph. You should see the new measures successfully registered
	![](images/49.png)

1. Congratulations! You have successfully sent some data via MQTT using the Paho Client.


## Summary
You have completed the exercise!
 
You are now able to: 

* use IoT Gateway Edge provisioning with MQTT protocol
* automatic onboard device and sensor with Gateway Edge using MQTT protocol
* send Data with PAHO MQTT Client
* consume data via IoT Services Cockpit and APIs


Please proceed with next exercise.
