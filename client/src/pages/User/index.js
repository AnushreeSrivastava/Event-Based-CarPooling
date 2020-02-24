import React from 'react';
import userImg from "../../assests/avataar.svg";
import "../../assests/styles/userStyle.css";
import { useFetch, SubmitRequest } from "./Backendhooks"; //to handle fetch data request from flask


const User = () => {
  const [user, offered_rides, requested_rides, hasErrors] = useFetch(); // to call flask/backend server		
  return (
    <div className="container-fluid">
      <div className="row">
        <div className="col-sm-4 text-right" >
          <img className="masthead-avatar mb-5" src={userImg} alt="profile pic" />
        </div>
        <div className="user-data col-sm-6">
          <p className="masthead-name text-uppercase mb-2 mt-4"> {user.name + " ( " + user.username + " ) "} </p>
          <p className="mb-2" > {user.contact} </p>
          <p className="mb-2" > {user.email} </p>

        </div>
        {/* <div className="col-sm-4 justify-content-center align-self-center">
                    <button type="button" className="btn btn-dark btn-lg">
                        Edit Details
                     </button>
                </div> */}
      </div>
      <div className="row mt-5 w-75 mx-auto">
        <div className="col-lg-6 lg-offset-6">
          <div className="user-offered-rides">
            <p className="heading-req">Requests Received</p>
            <ul className="list-group">
              {offered_rides.length > 0 ?
                <>{offered_rides.map(ride => (
                  <li className="list-group-item bg-light" key={ride.request_id}>
                    <p className="p-rider">Name: {ride.name}</p>
                    <p className="p-rider">Contact: {ride.contact_no}</p>
                    <p className="p-rider">Email: {ride.email}</p>
                    <p className="p-rider">Event Name: {ride.event_name}</p>
                    <p className="p-rider">Date/Time: {ride.date_time}</p>
                    <p className="p-rider">Location: {ride.address}</p>
                    {ride.status === 'pending' ? <>
                      <button onClick={async () => await SubmitRequest(ride.request_id, "declined")} type="button" className="btn btn-dark btn-sm float-right font-weight-bold" >
                        Decline
                                    </button>&nbsp;
                                    <button onClick={async () => await SubmitRequest(ride.request_id, "accepted")} type="button" className="btn btn-dark btn-sm float-right mr-2 font-weight-bold"  >
                        Accept
                                    </button>
                    </>
                      :
                      <button type="button" className="btn btn-dark btn-md float-right mr-2 font-weight-bold" disabled>
                        Already Accepted!
                                    </button>
                    }
                  </li>
                ))}
                </> : <> <p className="float-left p-rider">No Rides Offered....</p> </>}
            </ul>
          </div>
        </div>
        <div className="col-lg-6 lg-offset-6">
          <div className="user-requested-rides">
            <p className="heading-req">Requests made</p>
            <ul className="list-group">
              {requested_rides.length > 0 ?
                <>
                  {requested_rides.map(ride => (
                    <li className="list-group-item bg-light" key={ride.request_id}>
                      <p className=" p-rider">Host Name: {ride.name}</p>
                      <p className="p-rider">Event Name: {ride.event_name}</p>
                      <p className="p-rider">Date/Time: {ride.date_time}</p>
                      <p className="p-rider">Location: {ride.address}</p>
                      {ride.status === "pending" ?
                        <span className="text-warning float-right">Pending</span>
                        : ride.status === "accepted" ?
                          <span className="text-danger float-right mr-2">Accepted</span>
                          :
                          <span className="text-success float-right mr-2">Declined</span>
                      }
                    </li>
                  ))}
                </> : <> <p className="float-left p-rider">No Rides Requested....</p> </>}
            </ul>
          </div>
        </div>
      </div>
    </div>
  )
};

export default User;