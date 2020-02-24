import React from 'react';
import Event from "../Event";
import { shallow } from 'enzyme';


it('renders without crashing', () => {
    const wrapper = shallow(<Event
        match={{ params: { eventid: '5075823' } }}
    />);
    //Matches if the correct elements were rendered
    expect(wrapper.containsMatchingElement(<h2 className="h2-request text-center">Request a Ride</h2>)).toBeTruthy();
});