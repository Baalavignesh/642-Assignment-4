/**
 * Survey Service for communicating with the backend REST API.
 * Provides methods for CRUD operations on survey data.
 */
import axios from 'axios';

const API_BASE_URL = 'http://localhost:8080/api/surveys';

class SurveyService {
  /**
   * Get all surveys
   */
  getAllSurveys() {
    return axios.get(API_BASE_URL);
  }

  /**
   * Get a survey by ID
   */
  getSurveyById(id) {
    return axios.get(`${API_BASE_URL}/${id}`);
  }

  /**
   * Create a new survey
   */
  createSurvey(survey) {
    return axios.post(API_BASE_URL, survey);
  }

  /**
   * Update an existing survey
   */
  updateSurvey(id, survey) {
    return axios.put(`${API_BASE_URL}/${id}`, survey);
  }

  /**
   * Delete a survey
   */
  deleteSurvey(id) {
    return axios.delete(`${API_BASE_URL}/${id}`);
  }
}

export default new SurveyService();
