/**
 * Vue Router configuration for the Student Survey application.
 * Defines routes for Home, Survey Form, and Survey List pages.
 */
import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';
import SurveyForm from '../views/SurveyForm.vue';
import SurveyList from '../views/SurveyList.vue';

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/survey',
    name: 'SurveyForm',
    component: SurveyForm
  },
  {
    path: '/surveys',
    name: 'SurveyList',
    component: SurveyList
  },
  {
    path: '/edit/:id',
    name: 'EditSurvey',
    component: SurveyForm
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
