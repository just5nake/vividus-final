Scenario: Verify that allows creating a User
When I set request headers:
|name			|value							|
|Content-Type	|application/json; charset=UTF-8|
Given request body: {"id": 0, "username": "#{generate(Name.firstName)}", "firstName": "#{generate(Name.username)}", "lastName": "#{generate(Name.lastName)}", "email": "#{generate(Internet.emailAddress 'myemail')}", "password": "${passwordUs1}", "phone": "PhoneNumber.subscriberNumber '10'", "userStatus": 0}
When I execute HTTP POST request for resource with relative URL `/v2/user`
Then response code is equal to `200`

Scenario: Verify that allows login as a User
When I execute HTTP GET request for resource with relative URL `/v2/user/login?username=Chaya&password=123qwe`
Then response code is equal to `200`

Scenario: Verify that allows creating the list of Users
When I set request headers:
|name			|value							|
|Content-Type	|application/json; charset=UTF-8|
Given request body: [{"id": 0, "username": "#{generate(Name.firstName)}", "firstName": "#{generate(Name.username)}", "lastName": "#{generate(Name.lastName)}", "email": "#{generate(Internet.emailAddress 'myemail')}", "password": "${passwordUs1}", "phone": "PhoneNumber.subscriberNumber '10'", "userStatus": 0}, {"id": 0, "username": "#{generate(Name.firstName)}", "firstName": "#{generate(Name.username)}", "lastName": "#{generate(Name.lastName)}", "email": "#{generate(Internet.emailAddress 'myemail')}", "password": "${passwordUs1}", "phone": "PhoneNumber.subscriberNumber '10'", "userStatus": 0}, {"id": 0, "username": "#{generate(Name.firstName)}", "firstName": "#{generate(Name.username)}", "lastName": "#{generate(Name.lastName)}", "email": "#{generate(Internet.emailAddress 'myemail')}", "password": "${passwordUs1}", "phone": "PhoneNumber.subscriberNumber '10'", "userStatus": 0}]
When I execute HTTP POST request for resource with relative URL `/v2/user/createWithArray`
Then response code is equal to `200`

Scenario: Verify that allows Log out User
When I execute HTTP GET request for resource with relative URL `/v2/user/logout`
Then response code is equal to `200`

Scenario: Verify that allows adding a new Pet
When I set request headers:
|name			|value							|
|Content-Type	|application/json; charset=UTF-8|
Given request body: {"id": 11111, "category": {"id": 0, "name": "#{generate(Dog.breed)}"}, "name": "#{generate(Dog.name)}", "photoUrls": ["#{generate(Internet.url)}"], "tags": [{"id": 0, "name": "#{generate(Photography.imageTag)}"}], "status": "available"}
When I execute HTTP POST request for resource with relative URL `/v2/pet`
Then response code is equal to `200`

Scenario: Verify that allows updating Pet’s image
When I set request headers:
|name			|value								|
|Content-Type	|multipart/form-data; charset=UTF-8	|
Given request body: {"file": "src/main/resources/data/puppy.jpg", "type": "image/jpeg"}
When I execute HTTP POST request for resource with relative URL `/v2/pet/11111/uploadImage`
Then response code is equal to `200`

Scenario: Verify that allows updating Pet’s name and status
When I set request headers:
|name			|value							|
|Content-Type	|application/json; charset=UTF-8|
Given request body: {"id": 0, "category": {"id": 0, "name": "#{generate(Dog.breed)}"}, "name": "#{generate(Dog.name)}", "photoUrls": ["#{generate(Internet.url)}"], "tags": [{    "id": 0, "name": "#{generate(Photography.imageTag)}"}], "status": "available"}
When I execute HTTP PUT request for resource with relative URL `/v2/pet`
Then response code is equal to `200`

Scenario: Verify that allows deleting Pet
When I set request headers:
|name			|value							|
|Content-Type	|application/json; charset=UTF-8|
Given request body: {"file": "/resource/puppy.jpg"}
When I execute HTTP DELETE request for resource with relative URL `/v2/pet/11111`
Then response code is equal to `200`
