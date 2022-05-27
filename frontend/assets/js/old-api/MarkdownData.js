import { useState, useEffect } from 'react';
import * as Api from './Api';

const MarkdownData = (name) => {
  const [data, setData] = useState();
  const [isLoading, setIsLoading] = useState(true);
  const [status, setStatus] = useState(undefined);

  useEffect(() => {
    const fetchData = async () => {
      setStatus(undefined);
      setIsLoading(true);

      try {
        const mdData = await Api.getMarkdownPages(name);
        const page = mdData.data.filter(function(item) { return item.path_identifier === name; })[0];
        setData(page);
        if (typeof page === 'undefined') {
          throw new Error(404);
        }
        setIsLoading(false);
        setStatus(200);
      } catch (error) {
        console.error(error);
        setStatus(error);
        setIsLoading(false);
      }
    };

    fetchData();
  }, [name]);
  return { data, isLoading, status };
}

export default MarkdownData;