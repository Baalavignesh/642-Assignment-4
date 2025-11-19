package com.swe642.studentsurvey;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Main Spring Boot application class for Student Survey System.
 * This application provides REST APIs for managing student survey data.
 */
@SpringBootApplication
public class StudentSurveyApplication {

    public static void main(String[] args) {
        SpringApplication.run(StudentSurveyApplication.class, args);
    }
}
