import { useState, useEffect } from "react";

function useFetch(url) {
  const [Events, setEvents] = useState([]);
  const [haserrors, setErrors] = useState(true);
  
  useEffect(() => {
    async function fetchData() {
      const response = await fetch(url,{method: 'GET',mode: 'cors'}); //awaiting for fetch to retrieve 
      response
        .json() // converting response to json format
        .then(response => setEvents(response["events"])) //sending data to Events variable
        .catch(err => setErrors(err)) // to send errors if there are any
    }
    fetchData();
  }, [url]);
  return [Events, haserrors];

}


export { useFetch };