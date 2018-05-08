<table width=100% border=>
<tr><td colspan=2><h1>EXERCISE 07 - ML Foundation in SAP Cloud Foundry - Preparation</h1></td></tr>
<tr><td><h3>SAP Partner Workshop</h3></td><td><h1><img src="images/clock.png"> &nbsp;60 min</h1></td></tr>
</table>


## Description
In this exercise, you’ll learn how 

* access SAP Cloud Foundry Org and Space via SAP CP Cockpit
* create Service Instance and Service Key for ML Foundation
* generate an access token with the Generate Token tool

## Target group

* Developers
* People interested in SAP Leonardo and Machine Learning 


## Goal

The goal of this exercise is to understand how to access SAP Cloud Foundry cockpit, how to setup the ML Foundation service and how to generate a service key for accessing it from an external application.


## Prerequisites
  
Here below are prerequisites for this exercise.

* A trial account on the SAP Cloud Platform. You can get one by registering here <https://account.hanatrial.ondemand.com>


## Steps

1. [SAP Cloud Foundry Org and Space via SAP CP Cockpit](#cf-org-space)
1. [Create Service Instance and Service Key for ML Foundation](#service-instance-key)
1. [Generate Access Token](#access-token)



### <a name="cf-org-space"></a> SAP Cloud Foundry Org and Space via SAP CP Cockpit
You used the Cloud Foundry user to access the SAP API Business Hub and the SAP Cloud Platform - Neo environment. Now you will learn how to work with ML Foundation Services that are available within your SAP Cloud Platform Global Account. Please, make sure that you work with the correct username to avoid conflicts with other participants. Take note of the following Cloud foundry credential, you will be using it in the following steps.
Organization and space will be automatically configured and made available during the login process as there is just one space and org for each user.


|Parameter   |Value                                                |
|------------|-----------------------------------------------------|
|Username    |ml-train+XX@sap.com                                  |
|Password    |\<specific to your username\> provided by the trainer|
|API endpoint|api.cf.eu10.hana.ondemand.com                        |
|Organization|ml-trainXX (same as your user name without the +)    |
|Space       |ml-trainXX (same as your user name without the +)    |


1. Open Firefox as Chrome will use SSO for SAP Employees. Login to SAP Cloud Platform Cockpit via <https://account.hanatrial.ondemand.com/cockpit>. Login with your given e-Mail 
**ml-train+XX@sap.com**, where **XX** must be replaced by your workstation ID, and the password provided by the trainer  
	![](images/01.png)

1.	Navigate to **Regions -> Cloud Foundry Environment > Europe (Frankfurt)**  
	![](images/02.png)

1.	Click on your global account **SAP\_ML\_Demo**  	![](images/03.png)

1.	Click on the Subaccount/Organisation **ml-trainxx** where XX is your workstation ID  
	![](images/04.png)

1.	Here you can see some your Cloud Foundry details like the name of your Organization, the number of Spaces and the API endpoint. Click on the **number of Spaces**  	![](images/05.png)

1. Click on the tile named "training" which is the one related to your space  
	![](images/06.png)

1. You have reached your Cloud Foundry cockpit. At moment there should be no applications available  
	![](images/07.png)

1. You have finished with the preparation of your Cloud Foundry environment.



### <a name="service-instance-key"></a> Create Service Instance and Service Key for ML Foundation
Before we continue we need to get a service key from the ML Foundation service. A service key enables the ML Foundation Service to be used outside the CF environment. In this exercise, you need to create such a key to be used by an external applications like Swagger UI or Postman. The service key contains all the URLs and credentials (clientid and clientsecret) required for you to access the ML Foundation service running for your productive account. Please keep this browser window open, since you will need it in the next section.

1.	Within your space navigate to **Services -> Service Marketplace**, then click on the **ml-foundation** tile  
	![](images/08.png)

1.	Select Instances on the left menu bar and click on **New Instance**  
	![](images/09.png)

1.	Select the Plan **standard** and click **Next**  
	![](images/10.png)

1.	Click **Next**  
	![](images/11.png)

1.	Click **Next**  
	![](images/12.png)

1.	Enter a name for the new instace, like **ml\_instance\_XX** where XX is your workstation ID and click **Finish**  
	![](images/13.png)

1.	Click on the newly created instance  
	![](images/14.png)

1.	Select **Service Keys** in the left menu bar and click the **Create Service Key** button to create a new service key for your instance  
	![](images/15.png)

1.	 Enter a name for this service key like **ml\_servicekey\_XX** where XX is your workstation ID; then click **Save** to save the service key  
	![](images/16.png)

1.	You get a screen like this. Please keep this page open or copy the service key somewhere because you'll need it in the next exercises  
	![](images/17.png)

1. You have successfully generated a service key for the ML Foundation service.




### <a name="access-token"></a> Generate Access Token
For the next exercises you will need an **OAuth2** token to access the ML Foundation services in your Cloud Foundry environment. We prepared a small helper application to facilitate you to retrieve this token. Please use the URL <https://get_token.cfapps.eu10.hana.ondemand.com/> to access this token generation application: you need to be logged in to your SAP Cloud Foundry account, to access it. This application is a tool that we provide during this workshop, but it is not part of our standard ML Foundation service offering. 

>NOTE: You do not need to do this step now! You'll need it several times in the next exercises and we will reference this chapter when needed.

1. With your Firefox browser, navigate to the URL <https://get_token.cfapps.eu10.hana.ondemand.com/> 

1. A new window comes up where you need to enter 

	- Authentication URL
	- Client-ID
	- Client-Secret  

	![](images/18.png)

1.	Go back to your service key and copy the required information from there. Paste all the needed parameters in the Token Generator app  
	![](images/19.png)

1.	A token with the prefix **Bearer** is generated. Use the **Copy To Clipboard!** button to copy the key in the clipboard when needed 
	>NOTE: Actually, you do not need to copy the token now, but we will reference this section when you need the token to access the ML foundation services  

	![](images/20.png)

1.	For your convenience, this application is also linked in the project you imported into SAP Web IDE Full-Stack. There you will find a button in the bar at the bottom of the screen, that will bring you directly to this Generate Token tool  
	![](images/21.png)



## Summary
This concludes the exercise. You should have learned how to 

* access SAP Cloud Foundry Org and Space via SAP CP Cockpit
* create Service Instance and Service Key for ML Foundation
* generate an access token with the Generate Token tool

Please proceed with next exercise.
