# Backend API for Nested Resources

This repository contains the implementation of a backend API for managing nested resources, including Verticals, Categories, and Courses. The API is designed to serve the frontend application and includes Elastic Search integration for listing items on the records collection page.

## Table of Contents

-   [Requirements](#Requirements)
-   [Installation](#Installation)
-   [Models](#Models)
-   [Controllers](#Controllers)
-   [API Endpoints](#API-Endpoints)
-   [Elastic Search](#Elastic-Search)
-   [Database Setup](#Database-Setup)
-   [Testing](#Testing)
-   [Future Improvements](#Future-Improvements)
-   [Questions for Future Implementation](#Questions-for-Future-Implementation)

## Requirements

The implementation meets the following requirements:

-   Models, Controllers, and API for managing Verticals, Categories, and Courses.
-   Ability to update and create nested resources when updating the parent object.
-   Use of Elastic Search for listing items on the records collection page.
-   Database: Postgres with a provided seed file.
-   Validation of uniqueness of `Name` of `category` and `vertical` across both models.
-   OAuth provider to protect the API.

## Installation

The setup can be done using Docker. Follow the steps below:

1.  Install [Docker](https://www.docker.com/get-started) on your machine.
    
2.  Clone this repository:
    
    `git clone git@github.com:mcmuralishclint/myProject.git` 
    
3.  Change into the project directory:
    
    `cd myProject`
    
4.  Build and run the Docker containers:
    
    `docker-compose up` 
    
    This command will set up the necessary services, including the database, Elastic Search, and the OAuth provider.
    
5.  Once the containers are running, you can access the API at [http://localhost:3000](http://localhost:3000/).
    

## Models

### Vertical

-   Attributes:
    -   `Name` (String, unique)

### Category

-   Attributes:
    -   `Name` (String, unique)
    -   `vertical_id` (Integer, foreign key)
    -   `State` (String) 

### Course

-   Attributes:
    -   `Name` (String)
    -   `Title` (String)
    -   `State` (String) 
    -   `category_id` (Integer, foreign key)

## Controllers

-   VerticalsController
-   CategoriesController
-   CoursesController
-   SearchController

## API-Endpoints
A JWT Token is set up to protect the API. JWT ensures secure and authenticated access to the API endpoints.
visit `localhost:3000/login` to get your unique login token and pass this token in the request header with the key: **x-auth**

### Verticals

-   `GET /verticals`: List all verticals
-   `GET /verticals/:id`: Show details of a specific vertical

### Categories

-   `GET /verticals/:id/categories`: List all categories belonging to a vertical
-   `GET /verticals/:id/categories/:id`: Show details of a specific category

### Courses

-   `GET /verticals/:id/categories/:id/courses`: List all courses
-   `GET /verticals/:id/categories/:id/courses/:id`: Show details of a specific course

### Search

-   `GET /api/v1/search?q=`: Search reources by name

## Elastic-Search

Elastic Search is used to list items on the records collection page. The integration ensures efficient and scalable search functionality.

## Database-Setup

Postgres is used as the database for this project. The initial setup is handled by Docker, and a seed file is provided to populate the database with sample data. The seed file will be executed as part of the docker-compose up command.

## Testing

The API includes comprehensive testing to ensure functionality and reliability. You can run the tests using:
`docker-compose run test`

## Future-Improvements

Some potential improvements for the future include:

-   Elastic search
    - I was not clear on the acceptence criteria hence implemented a generic functionality using elastic search such that, provide a name in the query name, the application should return all the instances of the available models with matching names.
-   Auth
    - A generic authentication/authorizaton have been implemented with the help of jwt tokens. We can enahance this further with expiry, user scopes, etc
-   Adding more comprehensive error handling and logging.
    - The error messages are generic right now and we can improve this further such that each scenario can have specific error messages/codes
-   Improve API structuring
    - 
-   Including swagger documentation
-   Move the authentication to a middleware

## Questions-for-Future-Implementation

-   How does the solution perform?
	- TBA
-   How does the solution scale?
	- TBA
-   What would you improve next?
	- TBA
