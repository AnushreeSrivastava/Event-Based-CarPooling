import React, { useState } from "react";
import Navbar from "react-bootstrap/Navbar";
import NavDropdown from "react-bootstrap/NavDropdown";
import Nav from "react-bootstrap/Nav";
import Form from "react-bootstrap/Form";
import FormControl from "react-bootstrap/FormControl";
import Button from "react-bootstrap/Button";
import icon from "../../assests/icon.png";
import Signup from "../SignupModal";
import Avatar from 'react-avatar';
import jwt_decode from 'jwt-decode'

import { useHistory } from "react-router-dom";

const imgIcon = {
  width: "45px",
  marginRight: "10px"
};

const brand = {
  backgroundColor: "inherit",
  borderColor: "darkslategrey"
};

const NavBar = () => {

  const [showSignup, setShowSignup] = useState(false);
  const [filterValue, setFilterValue] = useState("No Filter");
  let history = useHistory();

  const handleSubmit = () => {
    console.log('Closing modal');
    setShowSignup(false);
  };

  const handleShow = () => setShowSignup(true);

  const handleLogout = () => {
    localStorage.clear(); //for localStorage
    sessionStorage.clear(); //for sessionStorage
  };

  const filterChange = (e) => {
    setFilterValue(e.currentTarget.textContent);
  };

  const onSearch = (event) => {
    event.preventDefault();
    let form = event.target;
    // console.log(form.elements.searchValue.value);
    if (form.elements) history.push("/", {filterValue: filterValue, searchValue: form.elements.searchValue.value});
    else history.push('/');
  };

  return (


    <Navbar bg="dark" expand="lg" variant="dark">
      <Navbar.Brand onClick={onSearch} className="ml-lg-5 w-25">
        <Button style={brand}>
          <img src={icon} style={imgIcon} alt="Site logo" />
          Event Based Carpool
        </Button>
      </Navbar.Brand>

      <Form inline className="w-50" onSubmit={onSearch}>
        <NavDropdown title={filterValue} id="basic-nav-dropdown">
          <NavDropdown.Item as='text' onClick={filterChange}>No Filter</NavDropdown.Item>          
          <NavDropdown.Item as='text' onClick={filterChange}>City</NavDropdown.Item>
          <NavDropdown.Item as='text' onClick={filterChange}>Performer</NavDropdown.Item>
          <NavDropdown.Item as='text' onClick={filterChange}>Date</NavDropdown.Item>
        </NavDropdown>

        {filterValue === 'Date' &&
        <FormControl
        type="date"
        placeholder="mm/dd/yy"
        className="mr-sm-2 w-50"
        name = "searchValue"
        />
        }
        {filterValue === 'City' &&
        <Form.Control as="select" className="mr-sm-2 w-50" name = "searchValue">
          <option value="Charlotte">Charlotte</option>
          <option value="Chicago">Chicago</option>
          <option value="Atlanta">Atlanta</option>
          <option value="New York">New York</option>
        </Form.Control>
        }
        {filterValue !== 'Date' &&
        filterValue !== 'City' &&
        <FormControl
        type="text"
        placeholder=""
        className="mr-sm-2 w-50"
        name = "searchValue"
        />
        }
        <Button variant="outline-light" type='submit'>Search</Button>
      </Form>
      <Nav.Link href="/" onClick={onSearch}>Home</Nav.Link>
      { localStorage.usertoken ? 
        [
        <Nav.Link href="/" onClick={handleLogout} >Logout</Nav.Link>, 
        <Nav.Link href="/user">
        
        
        
        

        <Avatar name= {jwt_decode(localStorage.usertoken).identity.first_name} round={true} size={40}>
        </Avatar>
        </Nav.Link>
        //<Nav.Link href="/user" >Profile</Nav.Link>
        ]  :  [
        <Nav.Link key="Login" href="/Login" >Login </Nav.Link>, 
        <Button key="Signup" variant="outline-light" onClick={handleShow}>
        Signup
        </Button>, 
        <Signup key="Signupmodal" show={showSignup} onSubmit = {handleSubmit}/>
        ]
      }
      
      
    </Navbar>


  )
    
}


export default NavBar;







