# Ticketing API

## A preview of the Ticketing API using .Net Core connected with Microsoft SQL Server in AWS and Swagger UI as the front-end.

This Web API is created to represent a ticket system that uses a SQL server and users can connect to add, remove and display a comprehensive list of tickets, based on row, section venue, etc.

Main functions:
* Display a main page using Swagger UI
* Ability to select different Get, Delete, Post methods with different parameters
* Display and return a response body as json for the user
* Using XML documentation as suggested by the guidelines to make the user experience more desirable and give useful feedback.

### Note the following for testing purposes:

Event 1:  
Entire Row Sold Seat IDs: 31, 32, 33, 34, 35  
Additional Seat IDs: 2, 3  
  
    
Event 2:  
Entire Row Sold Seat IDs: 256, 257, 258, 259, 260  
Additional Seat IDs: 316, 291,   
  
    
Event 3:  
Entire Row Sold Seat IDs: 501, 502, 503, 504, 505  
Additional Seat IDs: 363, 391, 389  
  
    

Event 4:  
Entire Row Sold Seat IDs: 666, 667, 668, 669, 670  
Additional Seat IDs: 526, 640, 534  
  
    

Event 5:  
Entire Row Sold Seat IDs: 756, 757, 758, 759, 760  
Additional Seat IDs: 874, 869, 789, 735, 731  
  
    
      


## Homepage:

![Homepage](/imageAssets/1.png)

## Get All Event:

![Homepage](/imageAssets/2.png)

## Get All Event Response:

![Homepage](/imageAssets/3.png)

## Response Body:

![Homepage](/imageAssets/4.png)

## Get Event by Id:

![Homepage](/imageAssets/5.png)

## Get Event by Id Error 404:

![Homepage](/imageAssets/6.png)

### Collaborators: 
Kasra-N, TonyKoo
