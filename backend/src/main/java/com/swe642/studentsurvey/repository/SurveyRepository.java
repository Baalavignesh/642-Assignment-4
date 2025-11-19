package com.swe642.studentsurvey.repository;

import com.swe642.studentsurvey.model.Survey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Repository interface for Survey entity.
 * Provides CRUD operations for Survey data using Spring Data JPA.
 */
@Repository
public interface SurveyRepository extends JpaRepository<Survey, Long> {
}
