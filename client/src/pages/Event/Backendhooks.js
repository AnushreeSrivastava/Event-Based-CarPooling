import { useState, useEffect } from "react";
import jwt_decode from 'jwt-decode';

function useFetch(eventId) {

  const [Event, setEvent] = useState([]);
  const [Rides, setRides] = useState([]);
  const [haserrors, setErrors] = useState(true);
  const [haserrors1, setErrors1] = useState(true);

  useEffect(() => {

    async function fetchData() {
      
      let response = await fetch("/event/" + eventId, { method: 'GET', mode: 'cors' }); //awaiting for fetch to retrieve 
      let response1 = undefined;
      if(localStorage.usertoken){
        let decoded = jwt_decode(localStorage.usertoken);
        let params = new URLSearchParams({ "userId": decoded.identity.username }).toString(); //hardcoded user need to change to capture user who is logged in
        response1 = await fetch("/event/rides/" + eventId + "?" + params, { method: 'GET', mode: 'cors' }); //awaiting for fetch to retrieve 
      } else{
        response1 = await fetch("/event/rides/" + eventId, { method: 'GET', mode: 'cors' }); //awaiting for fetch to retrieve 
      }

      response.json() // converting response to json format
        .then(response => setEvent(response)) //sending data to Event variable
        .catch(err => setErrors(err)) // to send errors if there are any

      response1.json() // converting response1 to json format
        .then(response1 => setRides(response1)) //sending data to Rides variable
        .catch(err1 => setErrors1(err1)) // to send errors if there are any

    }

    fetchData();

  }, [eventId]);

  return [Event, Rides, haserrors, haserrors1];
}


export { useFetch };