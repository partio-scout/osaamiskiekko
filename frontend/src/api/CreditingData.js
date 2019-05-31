import { useState, useEffect } from 'react';
import * as Api from './Api';

const fillData = (creditingData, globalState) => {
  if (!globalState) return creditingData;

  const degreeNqf = (creditingData && creditingData.academicdegree && globalState.nqfLevels 
    ? globalState.nqfLevels.find(level => level.id === creditingData.academicdegree.nqf) 
    : undefined);
  const competenceNqf = (creditingData && creditingData.competence && globalState.nqfLevels
    ? globalState.nqfLevels.find(level => level.id === creditingData.competence.nqf) 
    : undefined);
  const school = (creditingData && creditingData.academicdegree && globalState.schools
    ? globalState.schools.find(school => school.id === creditingData.academicdegree.school)
    : undefined);
  const organization = (creditingData && creditingData.competence && globalState.organizations
    ? globalState.organizations.find(organization => organization.id === creditingData.competence.organization)
    : undefined);

    return {
      ...creditingData, 
      academicdegree: {
        ...creditingData.academicdegree, 
        school: {...school, academicdegrees: []},
        nqf: degreeNqf,
      },
      competence: {
        ...creditingData.competence, 
        organization: {...organization, competences: []},
        nqf: competenceNqf,
      }
    };
}

const CreditingData = (id, globalState) => {
  const [data, setData] = useState();
  const [isLoading, setIsLoading] = useState(true);
  const [isError, setIsError] = useState(false);

  useEffect(() => {
    const fetchData = async () => {
      setIsError(false);
      setIsLoading(true);

      try {
        const creditData = await Api.getCompetenceDegreeLink(id);
        
        setData(fillData(creditData[0], globalState));

        setIsLoading(false);
      } catch (error) {
        console.error(error);
        setIsError(true);
      }
    };

    fetchData();
  }, [id, globalState]);

  return { data, isLoading, isError };
}

export default CreditingData;

export { fillData };
