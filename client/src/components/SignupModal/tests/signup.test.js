import React from 'react';
import Signup from "../../SignupModal";
import { mount, shallow, render } from 'enzyme';
import Modal from 'react-bootstrap/Modal';

const clickFn = jest.fn();

describe('Singup Modal', () => {
  it('should render Signup modal', () => {
    const component = shallow(<Signup/>);
    expect(component).toMatchSnapshot();
  });

  it('should have a boolean prop', () => {
    const wrapper = mount(<Signup show={false} onSubmit={clickFn}/>);
    expect(wrapper.props().show).toBe(false);
  });

  it('should render a signup modal', () => {
    const wrapper = shallow(<Signup show={false} onSubmit={clickFn}/>);
    const name = <Modal.Title>Sign-Up Form</Modal.Title>;
    expect(wrapper.contains(name)).toEqual(true);
  });  
});
