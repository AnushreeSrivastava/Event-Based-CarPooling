import React from "react";
import Navbar from "react-bootstrap/Navbar";
import Nav from "react-bootstrap/Nav";
import styled from "styled-components";

const Styles = styled.div`
  .content {
    margin-left: 40%;
  }
`;

const Footer = props => {
  return (
    <Styles>
      <Navbar bg="dark" expand="lg" variant="dark">
        <Nav.Link href="/" className="content">
          @EBCSystems
        </Nav.Link>
        <Nav.Link href="/">About</Nav.Link>
        <Nav.Link href="/">Contact</Nav.Link>
      </Navbar>
    </Styles>
  );
};

export default Footer;
