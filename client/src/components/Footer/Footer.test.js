import React from 'react';
import Footer from "../Footer";
import { mount, shallow, render } from 'enzyme';
import Nav from "react-bootstrap/Nav";

const clickFn = jest.fn();

describe('Footer Component testing', () => {
  it('should render Footer component', () => {
    const component = shallow(<Footer/>);
    expect(component).toMatchSnapshot();
  });

  it('should have about, contact and Logo links', () => {
    const wrapper = mount(<Footer/>);
    const about = <Nav.Link href="/">About</Nav.Link>;
    const contact = <Nav.Link href="/">Contact</Nav.Link>;
    const logo = <Nav.Link href="/" className="content">@EBCSystems</Nav.Link>;

    expect(wrapper.contains(about)).toEqual(true);
    expect(wrapper.contains(contact)).toEqual(true);
    expect(wrapper.contains(logo)).toEqual(true);    
  });  
});
