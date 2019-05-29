import { useState, useEffect } from 'react';
import * as Api from './Api';

const CreditingData = (id) => {
  const [data, setData] = useState();
  const [isLoading, setIsLoading] = useState(true);
  const [isError, setIsError] = useState(false);

  useEffect(() => {
    const fetchData = async () => {
      setIsError(false);
      setIsLoading(true);

      try {
        const creditData = await Api.getCompetenceDegreeLink(id);
        
        setData(creditData[0]);

        setIsLoading(false);
      } catch (error) {
        console.error(error);
        setIsError(true);
      }
    };

    fetchData();
  }, [id]);

  return { data, isLoading, isError };
}

export default CreditingData;
