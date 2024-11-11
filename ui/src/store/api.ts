import { defineStore } from "pinia";
import { degreeInterface } from "../interfaces/degreeInterface";
import { skillInterface } from "../interfaces/skillInterface";
import { ref } from "vue";

/**
 * API store
 */

export default defineStore('apiStore', () => {
  const degrees = ref<degreeInterface[] | null>(null);
  const degree = ref<degreeInterface | null>(null);
  const skillMatches = ref<skillInterface[] | null>(null);
  const skill = ref<skillInterface | null>(null);
  const skills = ref<skillInterface[] | null>(null);
  const degreeMatches = ref<degreeInterface[] | null>(null);
  const degreeMatch = ref<degreeInterface | null>(null);
  const skillMatch = ref<skillInterface | null>(null);

  const API_URL = process.env.API_URL || "";

  const isLoading = ref({
    degrees: false,
    skills: false,
    degree: false,
    skill: false,
    degreeMatches: false,
    skillMatches: false,
    degreeMatch: false,
    skillMatch: false
  })

  // fetch all degrees
  async function getDegrees() {
    try {
      isLoading.value.degrees = true;
      console.log(isLoading.value);

      const res = await fetch(`${API_URL}/api/v1/formal`);
      const data = await res.json();
      degrees.value = data;
      console.log("degrees:", degrees.value);
      isLoading.value.degrees = false;
    } catch (e) {
      console.log(e);
    }
  }

  // fetch all skills
  async function getSkills() {
    try {
      isLoading.value.skills = true;
      const res = await fetch(`${API_URL}/api/v1/vst`);
      const data = await res.json();
      skills.value = data;
      console.log("skills:", skills.value);
      isLoading.value.skills = false;
    } catch (e) {
      console.log(e);
    }
  }

  // fetch degree by id
  async function getDegree(id: string) {
    try {
      isLoading.value.degree = true;
      const res = await fetch(`${API_URL}/api/v1/formal/${id}`);
      const data = await res.json();
      degree.value = data;
      console.log("degree:", degree.value);
      isLoading.value.degree = false;
    } catch (e) {
      console.log(e);
    }
  }

  // fetch skill by id
  async function getSkill(id: string) {
    try {
      isLoading.value.skill = true;
      const res = await fetch(`${API_URL}/api/v1/vst/${id}`);
      const data = await res.json();
      skill.value = data as skillInterface;
      console.log("skill:", skill.value);
      isLoading.value.skill = false;
    } catch (e) {
      console.log(e);
    }
  }

  // fetch matching skills for selected degree
  async function getMatchingSkills(id: string) {
    try {
      isLoading.value.skillMatches = true;
      const res = await fetch(`${API_URL}/api/v1/formal/${id}/matches`);
      const data = await res.json();
      skillMatches.value = data;
      console.log("skills (matches):", skillMatches.value);
      isLoading.value.skillMatches = false;
    } catch (e) {
      console.log(e);
    }
  }

  // fetch matching degrees for selected skill
  async function getMatchingDegrees(id: string) {
    try {
      isLoading.value.degreeMatches = true;
      const res = await fetch(`${API_URL}/api/v1/vst/${id}/matches`);
      const data = await res.json();
      degreeMatches.value = data;
      console.log("degrees (matches):", degreeMatches.value);
      isLoading.value.degreeMatches = false;
    } catch (e) {
      console.log(e);
    }
  }

  // fetch individual match for a degree (for white result card)
  async function getDegreeMatch(degreeId: string, skillId: string) {
    try {
      isLoading.value.degreeMatch = true;
      const res = await fetch(`${API_URL}/api/v1/formal/${degreeId}/matches/${skillId}`);
      const data = await res.json();
      degreeMatch.value = data;
      console.log("degree (match):", degreeMatch.value);
      isLoading.value.degreeMatch = false;
    } catch (e) {
      console.log(e);
    }
  }


  // fetch individual match for a degree (for white result card)
  async function getSkillMatch(skillId: string, degreeId: string) {
    try {
      isLoading.value.skillMatch = true;
      const res = await fetch(`${API_URL}/api/v1/vst/${skillId}/matches/${degreeId}`);
      const data = await res.json();
      skillMatch.value = data;
      console.log("degree (match):", skillMatch.value);
      isLoading.value.skillMatch = false;
    } catch (e) {
      console.log(e);
    }
  }

  // Rate degree-skill match
  async function sendFeedbackDegree(degreeId: string, skillId: string, feedbackValue: number) {
    fetch(`${API_URL}/api/v1/formal/${degreeId}/matches/${skillId}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ feedback: feedbackValue })
    })
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      return response.json();
    })
    .then(data => {
      console.log('POST request successful:', data);
    })
    .catch(error => {
      console.error('Error submitting POST request:', error);
    });
  }

  // Rate skill-degree match
  async function sendFeedbackSkill(degreeId: string, skillId: string, feedbackValue: number) {
    fetch(`${API_URL}/api/v1/vst/${skillId}/matches/${degreeId}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ feedback: feedbackValue })
    })
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      return response.json();
    })
    .then(data => {
      console.log('POST request successful:', data);
    })
    .catch(error => {
      console.error('Error submitting POST request:', error);
    });
  }

  return {
    sendFeedbackSkill,
    sendFeedbackDegree,
    degrees,
    degree,
    skillMatches,
    skill,
    skills,
    getDegrees,
    getDegree,
    getSkills,
    getMatchingSkills,
    getSkill,
    getMatchingDegrees,
    degreeMatches,
    isLoading,
    getDegreeMatch,
    degreeMatch,
    getSkillMatch,
    skillMatch
  }
})
