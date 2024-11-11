import { defineStore } from "pinia";
import { degreeInterface } from "../interfaces/degreeInterface";
import { ref, Ref, computed } from "vue";
import useApiStore from "../store/api";
import { skillInterface } from "@/interfaces/skillInterface";

/**
 * SEARCH store
 */

export default defineStore('searchStore', () => {
  const apiStore = useApiStore();

  // Cookie consent / Google analytics methods
  interface ConsentInterface {
    consent: boolean;
    expires: string;
  }

  const storedConsent: string | null = localStorage.getItem('cookieConsent');
  let initialConsentValue = false;

  if (storedConsent) {
    try {
      const parsedConsent: ConsentInterface = JSON.parse(storedConsent);
      initialConsentValue = parsedConsent.consent;
    } catch (error) {
      console.error('Failed to parse stored consent preference:', error);
    }
  }

  const cookieConsent = ref<boolean>(initialConsentValue);

  const setCookieConsent = (value: boolean) => {
    const expirationDate = new Date();
    expirationDate.setDate(expirationDate.getDate() + 30);
    const consentPreference: ConsentInterface = {
      consent: value,
      expires: expirationDate.toISOString()
    };

    try {
      localStorage.setItem('cookieConsent', JSON.stringify(consentPreference));
      cookieConsent.value = value;
    } catch (error) {
      console.error('Failed to save consent preference:', error);
    }
  };

  const isConsentStored = () => {
    const storedConsent: string | null = localStorage.getItem('cookieConsent');
    return storedConsent !== null;
  };


  // Search related methods

  const searchQueryDegree: Ref<string> = ref("");
  const searchQuerySkill: Ref<string> = ref("");

  const degreeLevels: string[] = ['AMK', 'Ylempi AMK', 'Ammatillinen perustutkinto', 'Erikoisammattitutkinto', 'Ammattitutkinto', 'Lukio'];
  const degreeFields: string[] = 
  [
    'Humanistinen, kulttuuri ja kasvatus',
    'Liiketalous, hallinto ja yhteiskunta',
    'Maatalous, luonto ja ympäristö',
    'Matkailu, ravitsemus ja talous',
    'Palo, pelastus ja turvallisuus',
    'Sosiaali, terveys ja liikunta',
    'Tekniikka ja liikenne',
    'Täydentävän osaamisen opinnot',
    'Yleissivistävä'
  ];

  const degreeLevelSelections: Ref<string[]> = ref([])
  const degreeFieldSelections: Ref<string[]> = ref([])


  // Filter degrees by search term and dropdown selections
  const filteredDegrees = computed(() => {
    // Get the search term and remove whitespace and convert to lowercase
    const searchTerm = searchQueryDegree.value.toLowerCase().trim();
    
    // Filter degrees by search term (ORGANIZATION, ORGANIZATION_ALIASES, NAME, LEVEL)
    let filteredList = apiStore.degrees?.filter(degree => {
      const orgNames = degree.organizations.map(org => org.toLowerCase()).concat(degree.organization_aliases.map(org => org.toLowerCase()));
      const degreeNames = degree.degrees.fi.map(org => org.toLowerCase());
      return degree.name.fi.toLowerCase().includes(searchTerm)
      || orgNames.some(org => org.includes(searchTerm)) 
      || degreeNames.some(degree => degree.includes(searchTerm));
    }) ?? [];
    
    // Filter degrees by level selections
    if (degreeLevelSelections.value.length > 0) {
      filteredList = filteredList.filter(degree => degreeLevelSelections.value.includes(degree.level.fi));
    }
    
    // Filter degrees by field selections
    if (degreeFieldSelections.value.length > 0) {
      filteredList = filteredList.filter(degree => degreeFieldSelections.value.includes(degree.field.fi));
    }

    return filteredList;
  });

  
  // Filter skills by search term
  const filteredSkills = computed(() => {
    // Get the search term and remove whitespace and convert to lowercase
    const searchTerm = searchQuerySkill.value.toLowerCase().trim();

    // Filter skills by search term
    const filteredList = apiStore.skills?.filter(skill =>
      skill.name.fi.toLowerCase().includes(searchTerm) || skill.organization.toLowerCase().includes(searchTerm)
    ) ?? null;

    return filteredList;
  });


  // Clear degree filters
  const clearFiltersDegree = () => {
    searchQueryDegree.value = ""
    degreeLevelSelections.value = []
    degreeFieldSelections.value = []
  }

  // Clear skill filters
  const clearFiltersSkill = () => {
    searchQuerySkill.value = ""
  }

  // Check if degree search is active
  const searchIsActiveDegree = computed(() => !!searchQueryDegree.value || degreeLevelSelections.value.length > 0 || degreeFieldSelections.value.length > 0);

  // Check if skill search is active
  const searchIsActiveSkill = computed(() => !!searchQuerySkill.value);

  return {cookieConsent, setCookieConsent, isConsentStored, degreeFields, degreeFieldSelections, degreeLevels, degreeLevelSelections, clearFiltersSkill, clearFiltersDegree, filteredDegrees, searchQueryDegree, searchIsActiveDegree, searchQuerySkill, filteredSkills, searchIsActiveSkill };
});
