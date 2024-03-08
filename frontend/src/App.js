import React, { useEffect } from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import { applyPolyfills, defineCustomElements } from '@department-of-veterans-affairs/component-library';
import Homepage from './Homepage';
import Second from './Second';

function App() {

    useEffect(() => {
        // Apply polyfills and define all custom elements provided by the package
        applyPolyfills().then(() => {
            defineCustomElements(window);
        });
    }, []);

  return (
    <div className="App">
      <Router>
        <Switch>
            <Route exact path="/">
                <Homepage />
            </Route>
            <Route exact path="/second">
                <Second />
            </Route>
        </Switch>
      </Router>
    </div>
  );
}

export default App;
