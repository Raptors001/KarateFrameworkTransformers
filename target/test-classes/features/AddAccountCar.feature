Feature: TEK Insurance API Post Service

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenValue = callonce read("GenerateToken.feature")
    * def token = tokenValue.response.token
    * header Authorization = "Bearer " + token
    * def primaryPerson = callonce read("PostAccount.feature")
    * def id = primaryPerson.response.id

  @addCar
  Scenario: Add car Service Test
    * param primaryPersonId = id
    * path "/api/accounts/add-account-car"
    * request
      """
        {
        "make": "Toyota",
        "model": "corrolla",
        "year": "1997",
        "licensePlate": "TEK1122"
        }
      """
    * method post
    * status 201
    * print response
    
      @addCar
  Scenario: Add car Service Test two
    * param primaryPersonId = id
    * path "/api/accounts/add-account-car"
    * request
      """
        {
        "make": "Lexus",
        "model": "LX500",
        "year": "2023",
        "licensePlate": "TEK11"
        }
      """
    * method post
    * status 201
    * print response
