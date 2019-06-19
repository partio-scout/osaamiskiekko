import React, { useState } from 'react';
import Header from '../components/Header.js';
import styled from 'styled-components';
import * as Api from '../api/Api';
import SearchBox from '../components/search/SearchBox';
import ResultsCarousel from '../components/search/ResultsCarousel';
import SchoolList from '../components/search/SchoolList';
import OrganizationList from '../components/search/OrganizationList';
import { orderBy } from 'lodash';
import { useGlobalStateContext } from '../utils/GlobalStateContext';
import { fillData, transformToByOrganization } from '../api/CreditingData';
import ExaminationNumber from '../components/ExaminationNumber';

const S = {};
S.Home = styled.div`
  max-width: 1440px;
  margin: auto;

  .invisible-block {
    height: 400px;
  }

  @media only screen and (max-width: 767px) {
    padding: 0px;
  } 
`;

const Home = () => {
  const [creditingInfoForCompetence, setCreditingInfoForCompetence] = useState([]);
  const [sortedCarouselFields, setSortedCarouselFields] = useState([]);
  const [sortedSchoolList, setSortedSchoolList] = useState([]);

  const [creditingInfoForDegree, setCreditingInfoForDegree] = useState([]);
  const [creditingInfoForDegreeByOrganization, setCreditingInfoForDegreeByOrganization] = useState([]);

  const globalState = useGlobalStateContext();
  const { isLoading, schools, organizations } = globalState;

  const data = (schools && organizations ? [...schools, ...organizations] : []);

  const sortSchools = selectedCarouselField => {
    const schoolList = globalState.nqfLevels.map(nqf => {
      return {
        ...nqf,
        creditingInfos: selectedCarouselField.creditingInfos.filter(creditingInfo => creditingInfo.academicdegree.nqf === nqf.id)
      }
     });
    const sortedSchoolList = orderBy(schoolList, [(item) => item.creditingInfos.length], ['desc'])

    const sortedAndImportedSchoolNames = sortedSchoolList.map(school => ({
      ...school,
      creditingInfos: school.creditingInfos.map(creditingInfo => fillData(creditingInfo, globalState))
    }))
    setSortedSchoolList(sortedAndImportedSchoolNames);
  } 

  const setSelectedCarouselField = field => sortSchools(field);

  const sortCarouselItems = (carouselFields) => {
    const sortedFields = orderBy(carouselFields, [(item) => item.creditingInfos.length], ['desc'])
    setSortedCarouselFields(sortedFields);
    sortSchools(sortedFields[0]);
  }

  const initializeMatchingDegrees = async (competence) => {
    const links = await Api.getCreditingInfosForCompetence(competence.id);
    setCreditingInfoForCompetence(links);

    const carouselFields = globalState.fieldOfStudies.map(field => ({
      ...field, 
      creditingInfos: links.filter(link => link.academicdegree.fieldofstudy === field.id)
    }));
    sortCarouselItems(carouselFields);
  }

  const getCreditingInfoForDegree = async (degree) => {
    const links = await Api.getCreditingInfosForDegree(degree.id);
    const deep = links.map(link => fillData(link, globalState));

    return deep;
  }

  const showResults = async (institution, competenceOrDegreeSelection) => {
    if (institution && competenceOrDegreeSelection) {
      if (institution.type_en === 'Organization') {
        // Clear degree-specific data before displaying links for competence
        setCreditingInfoForDegree([]);
        setCreditingInfoForDegreeByOrganization([]);

        initializeMatchingDegrees(competenceOrDegreeSelection);
      } else {
        // Clear competence-specific data before displaying links for degree
        setCreditingInfoForCompetence([]);
        setSortedSchoolList([]);
        setSortedCarouselFields([]);

        const creditingInfo = await getCreditingInfoForDegree(competenceOrDegreeSelection);
        const transformed = transformToByOrganization(creditingInfo);

        setCreditingInfoForDegree(creditingInfo);
        setCreditingInfoForDegreeByOrganization(transformed);
      }
    }

  }

  const testForInvisibleBLock = () => sortedSchoolList.length === 0 && creditingInfoForDegreeByOrganization.length === 0;

  return (
    <S.Home>
      <Header />

      <SearchBox showResults={showResults} data={data} isLoading={isLoading} />
      { creditingInfoForCompetence.length > 0 &&
        <ExaminationNumber creditingAmountForCompetence={creditingInfoForCompetence.length} />
      }
      { creditingInfoForDegree.length > 0 &&
        <ExaminationNumber creditingAmountForDegree={creditingInfoForDegree.length}/>
      }
      { sortedCarouselFields && sortedCarouselFields.length > 0 &&
        <ResultsCarousel sortedCarouselFields={sortedCarouselFields} setSelectedCarouselField={setSelectedCarouselField}/>
      }
      
      { (sortedSchoolList && sortedSchoolList.length > 0) 
        && <SchoolList sortedSchoolList={sortedSchoolList} /> }
      
      { (creditingInfoForDegreeByOrganization && creditingInfoForDegreeByOrganization.length > 0) 
        && <OrganizationList creditingInfoByOrganization={creditingInfoForDegreeByOrganization} /> }
      
      {testForInvisibleBLock() && <div className="invisible-block"></div>}
    </S.Home>
  );
}

export default Home;
