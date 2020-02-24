import React from 'react';
import NavBar from "../NavBar";
import { mount, shallow, render } from 'enzyme';
import Nav from "react-bootstrap/Nav";

const clickFn = jest.fn();

describe('NavBar Component', () => {
  it('should render NavBar', () => {
    const component = shallow(<NavBar/>);
    expect(component).toMatchSnapshot();
  });

  it('should have a home, login links and signup button', () => {
    const wrapper = mount(<NavBar/>);
    const login = <Nav.Link href="/">Login</Nav.Link>;
    const home = <Nav.Link href="/">Home</Nav.Link>;

    expect(wrapper.contains(login)).toEqual(true);
    expect(wrapper.contains(home)).toEqual(true);
  });
});
