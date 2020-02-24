import React from "react";
import eventImg from "../../assests/demoimg.jpg";
import "../../assests/styles/eventStyle.css";
import OfferRide from "../../components/OfferRideModal"
import { useFetch } from "./Backendhooks"; //to handle fetch data request from flask
import { useState } from "react";
import axios from "axios";
import jwt_decode from 'jwt-decode';

const Event = ({ match }) => {

  const [showOfferRide, setShowOfferRide] = useState(false);

  const handleSubmit = () => {
    console.log('Closing modal');
    setShowOfferRide(false);
  };

  const handleShow = () => setShowOfferRide(true);

  const eventId = match.params.eventid; //URL to fetch event details data from flask/backend server
  const [event, Rides, hasErrors] = useFetch(eventId); // to call flask/backend server
  console.log(Rides);
  const handleSaveRequest = async (index, rideId, eventId) => {
    let decoded = jwt_decode(localStorage.usertoken);
    try {
      let response = await axios.post("http://localhost:5000/saveRequest", {
        eventId: eventId,
        userId: decoded.identity.username,
        rideId: rideId
      }, { 'Content-Type': 'application/json' });

      if (response.status === 200) {
        //Change the button to "Requested" label
        let btnReq = document.getElementsByClassName('li-req')[index].children[3];
        let spanReq = document.getElementsByClassName('li-req')[index].children[4]
        btnReq.classList.add('d-none')
        spanReq.classList.add('d-block')
      }
    }
    catch (error) {
      //Show error label on the top
      document.getElementsByClassName('span-error')[0].classList.add('d-block');
      console.error('Failure!');
      console.log(error);
    }
  };

  return (
    <div className="container-fluid">
      <div className="row">
        <div className="col-sm-6">
          <p className="eventHeading">{event.title}</p>
          <img className="card-img-top" src={event.image} alt="Card cap pic" />
          <br />
          <p>
            Name: <span><em>{event.title}</em></span>
          </p>
          <p>
            Date/Time: <span><em>{event.datetime_local}</em></span>
          </p>
          <p>
            Location: <span> <em>{event.full_address}</em></span>
          </p>
          <p> Performer: <span><em>{event.performers_names}</em> </span> </p>
          <p>
            Desciption: <span><em>{event.description}</em></span>
          </p>
          <br />
          {localStorage.usertoken ? <>
            <button type="button" className="btn btn-dark btn-lg ml-4 mb-4" onClick={handleShow}>
              Offer a Ride
            </button>
            <OfferRide show={showOfferRide} onSubmit={handleSubmit} eventId={eventId} userId={jwt_decode(localStorage.usertoken).identity.username} eventDate={event.datetime_local} />
          </> : <>
              <button type="button" className="btn btn-dark btn-lg ml-4 mb-4" onClick={() => alert("Please login before offering a ride")}>
                Offer a Ride
              </button>
              <OfferRide disabled show={showOfferRide} onSubmit={handleSubmit} />
            </>
          }
        </div>

        <div className="col-sm-6">
          <h2 className="h2-request text-center">Request a Ride</h2>
          <span className="d-none ml-2 text-center font-weight-bold span-error">Oops...Seems like some error occured!Try again. </span>
          <ul className="list-group">
            {Rides.length ? Rides.map((ride, i) => (
              <li className="li-req list-group-item py-4 bg-info shadow mb-3 rounded" key={ride.RIDE_ID}>
                <p className="p-rider"> Rider:
                 <span className="ml-2">{ride.USERNAME}</span>
                </p>
                <p className="p-rider">Start Date:
                <span className="ml-2">{ride.START_TIME.split(' ')[0]}</span>
                </p>
                <p className="p-rider">Start Time:
                <span className="ml-2">{ride.START_TIME.split(' ')[1]}</span>
                </p>
                {ride.STATUS === 'pending' ?
                  <span className="ml-2 float-right span-reqested">Requested! </span> :
                  <>
                    {localStorage.usertoken ?
                      <>
                        <button key={i} type="button" onClick={() => handleSaveRequest(i, ride.RIDE_ID, match.params.eventid)} className="btn btn-dark btn-lg float-right">
                          Request Ride
                        </button>
                      </> :
                      <>
                        <button key={i} type="button" onClick={() => alert("Please login to reuqest a ride")} className="btn btn-dark btn-lg float-right">
                          Request Ride
                        </button>
                      </>
                    }
                    <span className="d-none ml-2 float-right span-reqested">Requested! </span>
                  </>
                }
              </li>
            ))
              : <span className="ml-2 text-center font-weight-bold span-norides">No rides available for this event! </span>}
          </ul>
        </div>

      </div>
    </div>
  );
};

export default Event;
