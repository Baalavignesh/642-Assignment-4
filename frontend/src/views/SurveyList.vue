<!-- Survey List component for displaying all surveys with update and delete functionality -->
<template>
  <div class="container mt-4">
    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h2>All Surveys</h2>
      <router-link to="/survey" class="btn btn-primary">New Survey</router-link>
    </div>

    <!-- Loading Spinner -->
    <div v-if="loading" class="text-center my-5">
      <div class="spinner-border text-primary" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>

    <!-- No Surveys Message -->
    <div v-if="!loading && surveys.length === 0" class="alert alert-info" role="alert">
      No surveys found. <router-link to="/survey" class="alert-link">Create your first survey</router-link>
    </div>

    <!-- Surveys Table -->
    <div v-if="!loading && surveys.length > 0" class="card">
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Date</th>
                <th>Liked Most</th>
                <th>Interest Source</th>
                <th>Recommendation</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="survey in surveys" :key="survey.id">
                <td>{{ survey.id }}</td>
                <td>{{ survey.firstName }} {{ survey.lastName }}</td>
                <td>{{ survey.email }}</td>
                <td>{{ formatDate(survey.dateOfSurvey) }}</td>
                <td>{{ getLikedItems(survey) }}</td>
                <td>{{ survey.interestSource }}</td>
                <td>{{ survey.recommendationLikelihood }}</td>
                <td>
                  <div class="btn-group btn-group-sm" role="group">
                    <button
                      type="button"
                      class="btn btn-outline-primary"
                      @click="editSurvey(survey.id)"
                      title="Edit"
                    >
                      Edit
                    </button>
                    <button
                      type="button"
                      class="btn btn-outline-danger"
                      @click="deleteSurvey(survey.id)"
                      title="Delete"
                    >
                      Delete
                    </button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="mt-3 text-muted">
          Total Surveys: {{ surveys.length }}
        </div>
      </div>
    </div>

    <!-- Back to Home Link -->
    <div class="text-center mt-4 mb-5">
      <router-link to="/" class="text-muted">Back to Home</router-link>
    </div>
  </div>
</template>

<script>
import SurveyService from '../services/SurveyService';

export default {
  name: 'SurveyList',
  data() {
    return {
      surveys: [],
      loading: true
    };
  },
  mounted() {
    this.loadSurveys();
  },
  methods: {
    async loadSurveys() {
      try {
        this.loading = true;
        const response = await SurveyService.getAllSurveys();
        this.surveys = response.data;
      } catch (error) {
        console.error('Error loading surveys:', error);
        alert('Error loading surveys. Please try again.');
      } finally {
        this.loading = false;
      }
    },
    editSurvey(id) {
      this.$router.push(`/edit/${id}`);
    },
    async deleteSurvey(id) {
      if (confirm('Are you sure you want to delete this survey?')) {
        try {
          await SurveyService.deleteSurvey(id);
          this.loadSurveys();
        } catch (error) {
          console.error('Error deleting survey:', error);
          alert('Error deleting survey. Please try again.');
        }
      }
    },
    formatDate(dateString) {
      const date = new Date(dateString);
      const month = String(date.getMonth() + 1).padStart(2, '0');
      const day = String(date.getDate()).padStart(2, '0');
      const year = date.getFullYear();
      return `${month}/${day}/${year}`;
    },
    getLikedItems(survey) {
      const liked = [];
      if (survey.likedStudents) liked.push('Students');
      if (survey.likedLocation) liked.push('Location');
      if (survey.likedCampus) liked.push('Campus');
      if (survey.likedAtmosphere) liked.push('Atmosphere');
      if (survey.likedDormRooms) liked.push('Dorm Rooms');
      if (survey.likedSports) liked.push('Sports');
      return liked.length > 0 ? liked.join(', ') : 'None';
    }
  }
};
</script>

<style scoped>
/* Component-specific styles if needed */
</style>
