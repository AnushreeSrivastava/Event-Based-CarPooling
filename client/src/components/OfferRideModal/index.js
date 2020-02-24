import React, { useState } from "react";
import Modal from 'react-bootstrap/Modal';
import Button from "react-bootstrap/Button";
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Toast from 'react-bootstrap/Toast';
import DatePicker from 'react-datepicker'
import "react-datepicker/dist/react-datepicker.css";
import stateData from './stateData.json';

const OfferRide = (props) => {

    const [validated, setValidated] = useState(false);
    const [showToast, setShowToast] = useState(false);
    const [startDate, setStartDate] = useState(new Date());

    const sendOfferRide = async (form) => {

        const data = {
            eventId: props.eventId,
            username: props.userId,
            carModel: form.carModel.value,
            noOfSeats: form.noOfSeats.value,
            startTime: form.startTime.value,
            address1: form.address1.value,
            address2: form.address2.value,
            city: form.city.value,
            state: form.state.value,
            zipCode: form.zipCode.value,
            eventDate: props.eventDate
        }
        // const data = { eventId: props.eventId }
        console.log(`Data to be passed ${JSON.stringify(data)}`);

        await fetch('http://localhost:5000/offerRide', {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
            .then(res => res.json())
            .then((res) => {
                console.log('Data received is', res);
                if (res['response'] === 'Success') {
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
            sendOfferRide(form);
            event.preventDefault();
            event.stopPropagation();
        }
        setValidated(true);
    };

    const hanldeToastClose = () => {
        console.log('Hit close toast!');
        setShowToast(false);
        props.onSubmit();
    };

    return (
        <div>
            <Modal show={props.show} onHide={props.onSubmit}>
                <Modal.Header closeButton>
                    <Modal.Title>Enter following details to offer a ride</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form noValidate validated={validated} onSubmit={handleSubmit}>

                        <Form.Group as={Row} controlId="formPlaintextCarModel">
                            <Form.Label column sm="3">
                                Car Model
                        </Form.Label>
                            <Col sm="9">
                                <Form.Control type="text" name="carModel" required placeholder="Car Model" />
                            </Col>
                        </Form.Group>

                        <Form.Group as={Row} controlId="formNoOfSeats">
                            <Form.Label column sm="6">
                                Number of seats available
                        </Form.Label>
                            <Col sm="6">
                                <Form.Control name="noOfSeats" as="select">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                </Form.Control>
                            </Col>
                        </Form.Group>

                        <Form.Group as={Row} controlId="formStartTime">
                            <Form.Label column sm="3">
                                Start Time
                        </Form.Label>
                            <Col sm="9">
                                {/* <TimePicker onChange={onTimeChange} name="startTime" start="10:00" end="21:00" step={30} /> */}

                                <DatePicker className="form-control"
                                    name="startTime"
                                    selected={startDate}
                                    onChange={date => setStartDate(date)}
                                    showTimeSelect
                                    showTimeSelectOnly
                                    timeIntervals={15}
                                    timeCaption="Time"
                                    dateFormat="HH:mm"
                                    timeFormat="HH:mm"
                                />
                            </Col>
                        </Form.Group>

                        <Form.Group as={Row} controlId="formAddress1">
                            <Form.Label column sm="4">
                                Starting Address Line 1
                        </Form.Label>
                            <Col sm="8">
                                <Form.Control type="text" name="address1" required placeholder="Address Line 1" />
                            </Col>
                        </Form.Group>

                        <Form.Group as={Row} controlId="formAddress2">
                            <Form.Label column sm="4">
                                Line 2
                        </Form.Label>
                            <Col sm="8">
                                <Form.Control type="text" name="address2" placeholder="Address Line 2" />
                            </Col>
                        </Form.Group>
                        <Form.Group as={Row} controlId="formCity">
                            <Form.Label column sm="3">
                                City
                        </Form.Label>
                            <Col sm="9">
                                <Form.Control type="text" name="city" required placeholder="City" />
                            </Col>
                        </Form.Group>
                        <Form.Group as={Row} controlId="formState">
                            <Form.Label column sm="3">
                                State
                            </Form.Label>
                            <Col sm="9">
                                <Form.Control name="state" as="select">
                                    {
                                        stateData.map((state, i) => (
                                            <option key={i} value={state.value}>{state.name}</option>
                                        ))}
                                </Form.Control>
                            </Col>
                        </Form.Group>
                        <Form.Group as={Row} controlId="formZipCode">
                            <Form.Label column sm="3">
                                Zip Code
                        </Form.Label>
                            <Col sm="9">
                                <Form.Control type="text" name="zipCode" required placeholder="Zip Code" minLength='5' maxLength='5' />
                                <Form.Control.Feedback type="invalid">
                                    Enter Zipcode of 5 characters.
                            </Form.Control.Feedback>
                            </Col>
                        </Form.Group>
                        <Col xs={12} className="text-center">
                            <Button variant="primary" type="submit">
                                Save
                        </Button>
                        </Col>
                        <Col>
                            <Toast onClose={hanldeToastClose} show={showToast} delay={3000} autohide>
                                <Toast.Body>Data Saved! View it on your profile.</Toast.Body>
                            </Toast>
                        </Col>
                    </Form>
                </Modal.Body>
            </Modal>
        </div>
    );
};

export default OfferRide;
