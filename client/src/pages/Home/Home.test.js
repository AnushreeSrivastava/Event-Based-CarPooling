import React from 'react';
import Home from "../Home";
import { mount, shallow, render } from 'enzyme';


it('renders without crashing', () => {
    shallow(<Home />);
});