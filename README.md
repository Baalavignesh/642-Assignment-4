# SWE 642 Assignment 4 - Student Survey System

## Team Members

- **Baalavignesh Arunachalam** - G01486574 - barunac@gmu.edu
- **Pranav Arya** - G01513979 - paryasom@gmu.edu

## Project Overview

This is a full-stack web application for managing student campus visit surveys. The application allows prospective students to fill out survey forms, view all submitted surveys, update existing surveys, and delete surveys.

## Technology Stack

### Frontend
- **Vue.js 3** - Progressive JavaScript framework
- **Bootstrap 5.3** - CSS framework for responsive design
- **Vue Router** - For client-side routing
- **Axios** - HTTP client for API communication
- **Vite** - Build tool and development server

### Backend
- **Spring Boot 3.2.0** - Java framework for building REST APIs
- **Spring Data JPA** - For database operations
- **Hibernate** - ORM framework
- **MySQL** - Relational database
- **Maven** - Build and dependency management

## Project Structure

```
642 Assignment 4/
├── backend/
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/com/swe642/studentsurvey/
│   │   │   │   ├── config/
│   │   │   │   │   └── CorsConfig.java
│   │   │   │   ├── controller/
│   │   │   │   │   └── SurveyController.java
│   │   │   │   ├── model/
│   │   │   │   │   └── Survey.java
│   │   │   │   ├── repository/
│   │   │   │   │   └── SurveyRepository.java
│   │   │   │   └── StudentSurveyApplication.java
│   │   │   └── resources/
│   │   │       └── application.properties
│   └── pom.xml
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── router/
│   │   │   └── index.js
│   │   ├── services/
│   │   │   └── SurveyService.js
│   │   ├── views/
│   │   │   ├── Home.vue
│   │   │   ├── SurveyForm.vue
│   │   │   └── SurveyList.vue
│   │   ├── App.vue
│   │   └── main.js
│   ├── package.json
│   └── vite.config.js
└── README.md
```

## Features

### 1. Welcome Page
- Landing page with GMU branding (green and gold colors)
- Two navigation cards for "Take Survey" and "View All Surveys"
- Clean, modern Bootstrap-based design

### 2. Student Survey Form
- Personal information fields (all required):
  - First Name, Last Name
  - Street Address, City, State, Zip
  - Telephone, Email
  - Date of Survey
- What they liked most about campus (checkboxes):
  - Students, Location, Campus, Atmosphere, Dorm Rooms, Sports
- How they became interested (radio buttons):
  - Friends, Television, Internet, Other
- Likelihood of recommending (dropdown):
  - Very Likely, Likely, Unlikely
- Additional comments (text area)
- Submit and Cancel buttons

### 3. Survey List Page
- Displays all surveys in a Bootstrap table with GMU colors
- Striped rows with hover effects
- Edit button to update survey (uses same form component)
- Delete button to remove survey with confirmation
- Shows total number of surveys
- Responsive design for mobile and desktop

## Prerequisites

Before running this application, ensure you have the following installed:

1. **Java 17 or higher**
   ```bash
   java -version
   ```

2. **Maven 3.6 or higher**
   ```bash
   mvn -version
   ```

3. **MySQL 8.0 or higher**
   - Install MySQL and ensure it's running
   - Default credentials: username: `root`, password: `root`

4. **Node.js 18 or higher**
   ```bash
   node -v
   ```

5. **npm 9 or higher**
   ```bash
   npm -v
   ```

## Database Setup

1. Start MySQL server

2. The database `student_survey_db` will be created automatically when the Spring Boot application starts (configured in `application.properties`)

3. If you need to manually create the database:
   ```sql
   CREATE DATABASE student_survey_db;
   ```

4. Update database credentials in `backend/src/main/resources/application.properties` if needed:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/student_survey_db
   spring.datasource.username=root
   spring.datasource.password=root
   ```

## Installation & Running Instructions

### Quick Start (Using Initialization Script)

The easiest way to set up and run the project is using the provided initialization scripts:

1. **Initialize the project** (first time setup):
   ```bash
   cd "642 Assignment 4"
   ./init.sh
   ```
   This script will:
   - Check all prerequisites (Java, Maven, Node.js, npm, MySQL)
   - Build the backend
   - Install frontend dependencies

2. **Run the application**:
   ```bash
   ./run.sh
   ```
   This script will:
   - Start both backend and frontend servers
   - Backend will run on http://localhost:8080
   - Frontend will run on http://localhost:5173

### Manual Setup

If you prefer to set up and run the components manually:

### Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd "642 Assignment 4/backend"
   ```

2. Build the project:
   ```bash
   mvn clean install
   ```

3. Run the Spring Boot application:
   ```bash
   mvn spring-boot:run
   ```

   Or run the JAR file:
   ```bash
   java -jar target/student-survey-1.0.0.jar
   ```

4. The backend server will start on `http://localhost:8080`

### Frontend Setup

1. Navigate to the frontend directory:
   ```bash
   cd "642 Assignment 4/frontend"
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Run the development server:
   ```bash
   npm run dev
   ```

4. The frontend application will start on `http://localhost:5173`

5. Open your browser and navigate to `http://localhost:5173`

## API Endpoints

The backend provides the following REST API endpoints:

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/surveys` | Get all surveys |
| GET | `/api/surveys/{id}` | Get survey by ID |
| POST | `/api/surveys` | Create new survey |
| PUT | `/api/surveys/{id}` | Update survey |
| DELETE | `/api/surveys/{id}` | Delete survey |
| DELETE | `/api/surveys` | Delete all surveys |

## Testing the Application

1. Ensure MySQL is running and the database is set up
2. Start the backend server (should be running on port 8080)
3. Start the frontend development server (should be running on port 5173)
4. Open `http://localhost:5173` in your browser
5. Test the following workflows:
   - Fill out and submit a new survey
   - View all surveys in the list
   - Click "View" to see survey details
   - Click "Edit" to update a survey
   - Click "Delete" to remove a survey



