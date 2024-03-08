import React from "react";
import Second from './Second';
import { Link } from 'react-router-dom';

function Homepage(props = {children: []}) {
    return (
        <va-alert
            close-btn-aria-label="Close notification"
            status="continue"
            uswds
            visible>
            <h2
                id="track-your-status-on-mobile"
                slot="headline">
                Track your claim or appeal on your mobile device <va-link active href="/second" text="Second Page"/>
                 <Link to="/second">React Link</Link>
            </h2>
            <p className="vads-u-margin-y--0">
                You can use our new mobile app to check the status of your claims or appeals on your mobile device.
                Download the{' '}
                <strong>
                    VA: Health and Benefits
                </strong>
                mobile app to get started.
            </p>
            <va-button
                primary-alternate
                text="Sign-in to VA.gov"
                uswds
            />
        </va-alert>
    )
}

export default Homepage;