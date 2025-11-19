<!-- Student Survey Form component for collecting campus visit feedback -->
<template>
  <div class="container mt-4">
    <div class="row justify-content-center">
      <div class="col-lg-10">
        <!-- Header -->
        <div class="mb-4">
          <h2 class="text-center">{{ isEditMode ? 'Update Survey' : 'Student Survey Form' }}</h2>
          <p class="text-center text-muted">Please fill out all required fields</p>
        </div>

        <!-- Success Message -->
        <div v-if="showSuccessMessage" class="alert alert-success" role="alert">
          Survey {{ isEditMode ? 'updated' : 'submitted' }} successfully!
        </div>

        <!-- Survey Form -->
        <div class="card">
          <div class="card-header">
            <h5 class="mb-0">Campus Visit Feedback</h5>
          </div>
          <div class="card-body">
            <form @submit.prevent="onSubmit">

              <!-- Personal Information Section -->
              <h6 class="border-bottom pb-2 mb-3">Personal Information</h6>

              <div class="row mb-3">
                <div class="col-md-6">
                  <label for="firstName" class="form-label">First Name *</label>
                  <input
                    type="text"
                    class="form-control"
                    id="firstName"
                    v-model="surveyForm.firstName"
                    :class="{ 'is-invalid': submitted && !surveyForm.firstName }"
                  />
                  <div class="invalid-feedback" v-if="submitted && !surveyForm.firstName">
                    First name is required
                  </div>
                </div>
                <div class="col-md-6">
                  <label for="lastName" class="form-label">Last Name *</label>
                  <input
                    type="text"
                    class="form-control"
                    id="lastName"
                    v-model="surveyForm.lastName"
                    :class="{ 'is-invalid': submitted && !surveyForm.lastName }"
                  />
                  <div class="invalid-feedback" v-if="submitted && !surveyForm.lastName">
                    Last name is required
                  </div>
                </div>
              </div>

              <div class="mb-3">
                <label for="streetAddress" class="form-label">Street Address *</label>
                <input
                  type="text"
                  class="form-control"
                  id="streetAddress"
                  v-model="surveyForm.streetAddress"
                  :class="{ 'is-invalid': submitted && !surveyForm.streetAddress }"
                />
                <div class="invalid-feedback" v-if="submitted && !surveyForm.streetAddress">
                  Street address is required
                </div>
              </div>

              <div class="row mb-3">
                <div class="col-md-5">
                  <label for="city" class="form-label">City *</label>
                  <input
                    type="text"
                    class="form-control"
                    id="city"
                    v-model="surveyForm.city"
                    :class="{ 'is-invalid': submitted && !surveyForm.city }"
                  />
                  <div class="invalid-feedback" v-if="submitted && !surveyForm.city">
                    City is required
                  </div>
                </div>
                <div class="col-md-4">
                  <label for="state" class="form-label">State *</label>
                  <input
                    type="text"
                    class="form-control"
                    id="state"
                    v-model="surveyForm.state"
                    :class="{ 'is-invalid': submitted && !surveyForm.state }"
                  />
                  <div class="invalid-feedback" v-if="submitted && !surveyForm.state">
                    State is required
                  </div>
                </div>
                <div class="col-md-3">
                  <label for="zip" class="form-label">Zip Code *</label>
                  <input
                    type="text"
                    class="form-control"
                    id="zip"
                    v-model="surveyForm.zip"
                    :class="{ 'is-invalid': submitted && !surveyForm.zip }"
                  />
                  <div class="invalid-feedback" v-if="submitted && !surveyForm.zip">
                    Valid 5-digit zip required
                  </div>
                </div>
              </div>

              <div class="row mb-3">
                <div class="col-md-6">
                  <label for="telephone" class="form-label">Telephone Number *</label>
                  <input
                    type="tel"
                    class="form-control"
                    id="telephone"
                    v-model="surveyForm.telephone"
                    placeholder="1234567890"
                    :class="{ 'is-invalid': submitted && !surveyForm.telephone }"
                  />
                  <div class="invalid-feedback" v-if="submitted && !surveyForm.telephone">
                    Valid 10-digit phone number required
                  </div>
                </div>
                <div class="col-md-6">
                  <label for="email" class="form-label">Email *</label>
                  <input
                    type="email"
                    class="form-control"
                    id="email"
                    v-model="surveyForm.email"
                    :class="{ 'is-invalid': submitted && !surveyForm.email }"
                  />
                  <div class="invalid-feedback" v-if="submitted && !surveyForm.email">
                    Valid email is required
                  </div>
                </div>
              </div>

              <div class="mb-3">
                <label for="dateOfSurvey" class="form-label">Date of Survey *</label>
                <input
                  type="date"
                  class="form-control"
                  id="dateOfSurvey"
                  v-model="surveyForm.dateOfSurvey"
                  :class="{ 'is-invalid': submitted && !surveyForm.dateOfSurvey }"
                />
                <div class="invalid-feedback" v-if="submitted && !surveyForm.dateOfSurvey">
                  Date of survey is required
                </div>
              </div>

              <!-- Campus Feedback Section -->
              <h6 class="border-bottom pb-2 mb-3 mt-4">Campus Feedback</h6>

              <div class="mb-3">
                <label class="form-label d-block">What did you like most about the campus?</label>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="likedStudents" v-model="surveyForm.likedStudents">
                  <label class="form-check-label" for="likedStudents">Students</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="likedLocation" v-model="surveyForm.likedLocation">
                  <label class="form-check-label" for="likedLocation">Location</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="likedCampus" v-model="surveyForm.likedCampus">
                  <label class="form-check-label" for="likedCampus">Campus</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="likedAtmosphere" v-model="surveyForm.likedAtmosphere">
                  <label class="form-check-label" for="likedAtmosphere">Atmosphere</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="likedDormRooms" v-model="surveyForm.likedDormRooms">
                  <label class="form-check-label" for="likedDormRooms">Dorm Rooms</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="likedSports" v-model="surveyForm.likedSports">
                  <label class="form-check-label" for="likedSports">Sports</label>
                </div>
              </div>

              <div class="mb-3">
                <label class="form-label d-block">How did you become interested in the university? *</label>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="radio"
                    id="interestFriends"
                    value="friends"
                    v-model="surveyForm.interestSource"
                    :class="{ 'is-invalid': submitted && !surveyForm.interestSource }"
                  />
                  <label class="form-check-label" for="interestFriends">Friends</label>
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="radio"
                    id="interestTelevision"
                    value="television"
                    v-model="surveyForm.interestSource"
                  />
                  <label class="form-check-label" for="interestTelevision">Television</label>
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="radio"
                    id="interestInternet"
                    value="internet"
                    v-model="surveyForm.interestSource"
                  />
                  <label class="form-check-label" for="interestInternet">Internet</label>
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="radio"
                    id="interestOther"
                    value="other"
                    v-model="surveyForm.interestSource"
                  />
                  <label class="form-check-label" for="interestOther">Other</label>
                </div>
                <div class="invalid-feedback d-block" v-if="submitted && !surveyForm.interestSource">
                  Please select how you became interested
                </div>
              </div>

              <div class="mb-3">
                <label for="recommendationLikelihood" class="form-label">
                  Likelihood of recommending this school to other students *
                </label>
                <select
                  class="form-select"
                  id="recommendationLikelihood"
                  v-model="surveyForm.recommendationLikelihood"
                  :class="{ 'is-invalid': submitted && !surveyForm.recommendationLikelihood }"
                >
                  <option value="">Select an option</option>
                  <option value="Very Likely">Very Likely</option>
                  <option value="Likely">Likely</option>
                  <option value="Unlikely">Unlikely</option>
                </select>
                <div class="invalid-feedback" v-if="submitted && !surveyForm.recommendationLikelihood">
                  Please select a recommendation likelihood
                </div>
              </div>

              <div class="mb-3">
                <label for="additionalComments" class="form-label">Additional Comments</label>
                <textarea
                  class="form-control"
                  id="additionalComments"
                  rows="4"
                  v-model="surveyForm.additionalComments"
                  placeholder="Please share any additional feedback..."
                ></textarea>
              </div>

              <!-- Form Buttons -->
              <div class="d-flex gap-2 justify-content-end mt-4">
                <button type="button" class="btn btn-secondary" @click="onCancel">Cancel</button>
                <button type="button" class="btn btn-outline-secondary" @click="onReset" v-if="!isEditMode">Reset</button>
                <button type="submit" class="btn btn-primary">{{ isEditMode ? 'Update' : 'Submit' }}</button>
              </div>
            </form>
          </div>
        </div>

        <div class="text-center mt-3 mb-5">
          <router-link to="/" class="text-muted">Back to Home</router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import SurveyService from '../services/SurveyService';

export default {
  name: 'SurveyForm',
  data() {
    return {
      isEditMode: false,
      surveyId: null,
      surveyForm: {
        firstName: '',
        lastName: '',
        streetAddress: '',
        city: '',
        state: '',
        zip: '',
        telephone: '',
        email: '',
        dateOfSurvey: new Date().toISOString().split('T')[0],
        likedStudents: false,
        likedLocation: false,
        likedCampus: false,
        likedAtmosphere: false,
        likedDormRooms: false,
        likedSports: false,
        interestSource: '',
        recommendationLikelihood: '',
        additionalComments: ''
      },
      submitted: false,
      showSuccessMessage: false
    };
  },
  created() {
    // Check if we're editing an existing survey
    this.surveyId = this.$route.params.id;
    if (this.surveyId) {
      this.isEditMode = true;
      this.loadSurvey();
    }
  },
  methods: {
    async loadSurvey() {
      try {
        const response = await SurveyService.getSurveyById(this.surveyId);
        this.surveyForm = response.data;
      } catch (error) {
        console.error('Error loading survey:', error);
        alert('Error loading survey data');
        this.$router.push('/surveys');
      }
    },
    async onSubmit() {
      this.submitted = true;

      // Validate required fields
      if (!this.validateForm()) {
        return;
      }

      try {
        if (this.isEditMode) {
          await SurveyService.updateSurvey(this.surveyId, this.surveyForm);
        } else {
          await SurveyService.createSurvey(this.surveyForm);
        }

        this.showSuccessMessage = true;

        // Redirect after showing success message
        setTimeout(() => {
          this.$router.push('/surveys');
        }, 1500);
      } catch (error) {
        console.error('Error submitting survey:', error);
        alert('Error submitting survey. Please try again.');
      }
    },
    validateForm() {
      return (
        this.surveyForm.firstName &&
        this.surveyForm.lastName &&
        this.surveyForm.streetAddress &&
        this.surveyForm.city &&
        this.surveyForm.state &&
        this.surveyForm.zip &&
        this.surveyForm.telephone &&
        this.surveyForm.email &&
        this.surveyForm.dateOfSurvey &&
        this.surveyForm.interestSource &&
        this.surveyForm.recommendationLikelihood
      );
    },
    onCancel() {
      this.$router.push('/');
    },
    onReset() {
      if (confirm('Are you sure you want to reset the form?')) {
        this.surveyForm = {
          firstName: '',
          lastName: '',
          streetAddress: '',
          city: '',
          state: '',
          zip: '',
          telephone: '',
          email: '',
          dateOfSurvey: new Date().toISOString().split('T')[0],
          likedStudents: false,
          likedLocation: false,
          likedCampus: false,
          likedAtmosphere: false,
          likedDormRooms: false,
          likedSports: false,
          interestSource: '',
          recommendationLikelihood: '',
          additionalComments: ''
        };
        this.submitted = false;
      }
    }
  }
};
</script>

<style scoped>
.form-label {
  font-weight: 500;
  color: var(--text-dark);
}

.form-check-label {
  color: var(--text-dark);
}

h6 {
  color: var(--gmu-green);
  font-weight: 600;
}
</style>
