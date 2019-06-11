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
        setIsLoading(false);
        if (typeof page === 'undefined') {
          throw 404;
        }
        setStatus(200);
      } catch (error) {
        setIsLoading(false);
        console.error(error);
        setStatus(error);
      }
    };

    fetchData();
  }, [name]);
  return { data, isLoading, status };
}

export default MarkdownData;