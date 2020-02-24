import React, {useState} from "react";
import Modal from 'react-bootstrap/Modal';
import Button from "react-bootstrap/Button";
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Toast from 'react-bootstrap/Toast';

const Signup = (props) =>{
    const [validated, setValidated] = useState(false);
    const [showToast, setShowToast] = useState(false);

    const sendSingup = async(form)=>{
        const data = {
            firstName: form.firstName.value,
            lastName: form.lastName.value,
            phoneNumber: form.phone.value,
            email: form.email.value,
            password: form.password.value
        }
        console.log(`Data to be passed ${JSON.stringify(data)}` );
        //send data to backend
        await fetch('http://localhost:5000/signup', {
            method: 'POST',
            headers: {
                'Accept':'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then(res=>res.json())
        .then((res)=>{
            console.log('Data received is', res);
            if (res['response'] === 'Success'){
                setShowToast(true);
            }
            else {
                alert(res['response']);
            }
        }).catch(error => {
            alert('Error occured. Contact Admin.');
            props.onSubmit();            
        });
    };

    const handleSubmit = event => {
        console.log('In Handle Submit');
        const form = event.currentTarget;
        if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
        }
        else {
            console.log('In Show toast');
            sendSingup(form);
            event.preventDefault();
            event.stopPropagation();
        }
        setValidated(true);
    };

    const hanldeToastClose = ()=>{
        console.log('Hit close toast!');
        setShowToast(false);
        props.onSubmit();
    };

    return (
        <div>
        <Modal show={props.show} onHide={props.onSubmit}>
            <Modal.Header closeButton>
              <Modal.Title>Sign-Up Form</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form noValidate validated={validated} onSubmit={handleSubmit}>

                    <Form.Group as={Row} controlId="formPlaintextFirstName">
                        <Form.Label column sm="3">
                            First Name
                        </Form.Label>
                        <Col sm="9">
                            <Form.Control type="text" name="firstName" required placeholder="First Name"/>
                        </Col>
                    </Form.Group>

                    <Form.Group as={Row} controlId="formPlaintextLastName">
                        <Form.Label column sm="3">
                            Last Name
                        </Form.Label>
                        <Col sm="9">
                            <Form.Control type="text" name="lastName" required placeholder="Last Name" />
                        </Col>
                    </Form.Group>

                    <Form.Group as={Row} controlId="formPlaintextPhone">
                        <Form.Label column sm="3">
                            Phone Number
                        </Form.Label>
                        <Col sm="9">
                            <Form.Control type="tel" name="phone" required placeholder="123-456-7890" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" />
                            <Form.Control.Feedback type="invalid">
                                Please enter a valid contact number
                            </Form.Control.Feedback>                            
                        </Col>
                    </Form.Group>

                    <Form.Group as={Row} controlId="formPlaintextEmail">
                        <Form.Label column sm="3">
                            Email
                        </Form.Label>
                        <Col sm="9">
                            <Form.Control type="email" name="email" required placeholder="email@a.com" />
                            <Form.Control.Feedback type="invalid">
                                Please enter a valid email-id
                            </Form.Control.Feedback>
                        </Col>
                    </Form.Group>

                    <Form.Group as={Row} controlId="formPlaintextPassword">
                        <Form.Label column sm="3">
                            Password
                        </Form.Label>
                        <Col sm="9">
                            <Form.Control type="password" name="password" required placeholder="Password" minlength="8" maxLength="16" />
                            <Form.Control.Feedback type="invalid">
                                Enter password of 8-16 characters.
                            </Form.Control.Feedback>                            
                        </Col>
                    </Form.Group>
                    <Col xs={4}>
                        <Button variant="primary" type="submit">
                            Submit
                        </Button>
                    </Col>
                    <Col>
                        <Toast onClose={hanldeToastClose} show={showToast} delay={3000} autohide>
                            <Toast.Body>Signup successful. Login now!</Toast.Body>
                        </Toast>
                    </Col>
                </Form>
            </Modal.Body>
        </Modal>
        </div>
    );
};

export default Signup;
