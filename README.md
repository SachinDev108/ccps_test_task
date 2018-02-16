# INTRODUCTION

This repository consisting of the api to push data into central database from different sources. It pushes the sales data from E-commerce website, a POS system or a store. Swagger docs and rspecs are added into the repo to play with the API's

# INSTALLATION
To setup this project, please open the source folder in command prompt and run the following commands sequentially.
* Clone the source code
* bundle install
* rake db:create
* rake db:migrate
* rake rswag:specs:swaggerize (To generate swagger docs they will be served from the path  /api-docs)

# Technologies used
* Language: Ruby 2.4.2 
* Framework: Rails 5.1
* Some major Ruby Gems/Packages: rswag, rspec, factory-girls
* CSS3/HTML5

# FEATURES
* This source code exposes JSON base API to register sales from various sources.
* Central database to record sales/customer data
* Dashboard to select source and generate request at the path PATH='/'
* Customer and their sals list in JSON view at the path '/customers'
* TDD approach: rspecs on models and controllers
* Rubocop: High level Ruby syntax correction bot (Please run rubocop in th command line)
* Swagger: Documentation of the source code at the PATH = '/api-docs'
* Sales/Customer registratio is properly validated in Models, Controllers are tried to keep thin.
* Followin api urls are available:

Crate Sales: 
POST: api/v1/sales 

Display customer with their sales:
GET: 'api/v1/customers' 
Type: GET 

Dashboard to fire and play with requests
GET: /
