# README

Here we have added a solution of business that want to consolidate all the interactions a customer   has with it into a single profile. This includes many source systems and  then be able to use the profile information in all interactions with the customer to provide a personalised experience. 

# Features: 
* Add Sale 
Here we are adding sale with its customer details.When there is hit of endpoint with valid data in parameters then system will create sale with the sale customer. 
System will also check that if the db has customer with the given details in request then it will not create a new customer instead of this it just add sale for customer. 
If the customer is not present with the given details system will create customer with the sale. 
URL: api/v1/sales 
Type: POST 

* Display customer with the sales 
We felt need to display the customes and their sales, for this there is a end point by hiting it will return a json of customers with their sales. 
URL: 'api/v1/customers' 
Type: GET 

* Dashboard Page 
Additonally there is a dashboard page that will describe what parameters needed to use the endpoints, also it will display the response with the status on the page. 
URL: 'api/v1/customers' 
Type: GET 

# Endpoints: 
This section will describe the endpoints 

* For adding sale we need to use 'api/v1/sales' with the method type post. 

* For getting list of customers and sales we need to use 'api/v1/customers' with the method type get. 

* For dashboard page we need to use root url '/'.

# Additional Features: 

* Here we have used swagger docs for better api documentation.The swagger docs for the endpoints can be view and test on the docs page by hitting url '/api-docs'. 

* Also We have written rspecs for the sale create to ensure the functionaly is as per expected. 

* We have used 'rubocop' libary to ensure and maintain code as per good ruby code specs. 

* Request and response are of as per json-api specs. 

* Added code to ensure the reques type, if it is not code will give error. 
