import React from "react";
import Jumbotron from "react-bootstrap/Jumbotron";
import styled from "styled-components";
import background from "../../assests/background-event.jpg";
import { useFetch } from "./Backendhooks"; //to handle fetch data request from flask

const Styles = styled.div`
 .jumbo{
    //background: url(${background}) no-repeat fixed bottom;
    padding: 1em 2em;
    background-color: #7eb3c794;
    color:black;
    margin-top: 0px;
    margin-bottom: 5px;
    max-width: 80%;
    margin-left: 12%;
    &:hover{
        background-color: #69a8af;
    }
 };
 .container{
    background: url(${background}) no-repeat fixed bottom;
    max-width: inherit;
    min-height: 85vh;
 };

 .jumbo h2{
  font-size: 30px;
  }

 .jumbo p{
   font-size: 18px;
  }

 .jumbo li{
   list-style-type: none;
  }`;



const Home = (props) => {
  let queryParams = "";
  if (props.location.state !== undefined){
    queryParams = `?filterValue=${props.location.state.filterValue}&searchValue=${props.location.state.searchValue}`;
  }
  const url = "/index" + queryParams; //URL of flask/backend server
  console.log(url);
  const [Events, hasErrors] = useFetch(url); // to call flask/backend server

  function handleClick(EventId) {
    window.location = "/event/" + EventId;
  }

  return (
    <Styles>
      <div className="container">
        {Events.length === 0 ?  
        <Jumbotron className="jumbo">
          <h2>  No Events found. Try a different search!  </h2>
        </Jumbotron>
        :
        Events.map(event => ( //Looping through events to populate data on the jumbotron
          <Jumbotron className="jumbo" onClick={() => handleClick(event.id)} key={event.id}>
           <h2> {event.title} </h2>         
            <br />
            <h5> Performers: </h5>
            {event.performers.length > 3 ?
              event.performers.slice(0, 3).map((performer, index) => ( // looping through performers if there are multiple
                <p key={index}>{performer.name}</p>
              ))
              :
              event.performers.map((performer, index) => ( // looping through performers if there are multiple
                <p key={index}>{performer.name}</p>
              ))}
            <br />
            <p> Date & Time: {event.datetime_utc.replace('T', '  ')} </p> {/*Date & Time of Event*/}
          </Jumbotron>
        ))}
      </div>
    </Styles>
  );
}

export default Home;
