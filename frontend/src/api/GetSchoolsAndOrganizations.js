import { useState, useEffect } from 'react';
import * as Api from './Api';

const GetSchoolsAndOrganizations = () => {
  const [data, setData] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [isError, setIsError] = useState(false);

  useEffect(() => {
    const fetchData = async () => {
      setIsError(false);
      setIsLoading(true);

      try {
        const schools = await Api.getSchools();
        const organizations = await Api.getOrganizations();
        setData([...schools, ...organizations]);
      } catch (error) {
        console.error(error);
        setIsError(true);
      }
      setIsLoading(false);
    };
    fetchData();
  }, []);

  return { data, isLoading, isError };
}

export default GetSchoolsAndOrganizations;
