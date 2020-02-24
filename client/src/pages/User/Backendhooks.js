import { useState, useEffect } from "react";
import jwt_decode from 'jwt-decode';

function useFetch() {
  const [User, setUser] = useState([]);
  const [OfferedRides, setOfferedRides] = useState([]);
  const [RequestedRides, setRequestedRides] = useState([]);
  const [haserrors, setErrors] = useState(false);

  useEffect( () => {

    async function fetchData() {
      let decoded;
      let response;

      if(localStorage.usertoken){
        decoded = jwt_decode(localStorage.usertoken);
        try{
          response = await fetch("/getusers/" +   decoded.identity.username, { method: 'GET', mode: 'cors' }); //awaiting for fetch to retrieve 
          response.json() // converting response to json format
          .then(response => {
          setUser(response.user)
          setOfferedRides(response.offered_rides)
          setRequestedRides(response.requested_rides)
        }) //sending data to Event variable
        .catch(err => setErrors(true)) // to send errors if there are any
        console.log(decoded.identity.username);
        
        } catch(err) {
          setErrors(true)
        }
      }
    }
      fetchData();
  }, []);

  return [User, OfferedRides, RequestedRides, haserrors];
}

const SubmitRequest = async (requestId, ride_status) => {
  if(localStorage.usertoken){
      let decoded = jwt_decode(localStorage.usertoken);
      const set_body = { "userId": decoded.identity.username, "requestId":requestId, "status": ride_status };
      console.log(set_body);
      try{
          let response = await fetch("/users/modifyRequest",  //awaiting for fetch to retrieve 
          { method: 'POST', mode: 'cors', headers: { 'Accept':'application/json', 'Content-Type': 'application/json' }, 
          body:JSON.stringify(set_body)});
          console.log(decoded.identity.username);
          console.log(response.status);
          if (response.status===200){
              window.location.reload(false);
          } else{
              throw new Error("Error while modifying requests");
          }
      } catch(err) {
          console.error('Failure!');
          console.log(err);
          alert(err);
      }
  }
}

export { useFetch, SubmitRequest };