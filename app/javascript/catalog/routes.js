import React from 'react';

import {
  // BrowserRouter as Router,
  Route,
  Switch,
  HashRouter
} from 'react-router-dom';

import Catalog from "./components/Catalog";
import OrderForm from "../order_form/components/OrderForm";

const App = (props) => (
  <HashRouter cart_id={props.cart_id}>
    <div>
      <Switch>
          <Route 
                exact path='/' 
                render={(routerProps) => <Catalog {...routerProps} {...props} />} 
            />
            <Route 
                exact path='/order_form' 
                render={(routerProps) => <OrderForm {...routerProps} {...props} />} 
            />
        </Switch>
    </div>
  </HashRouter>
)
export default App;
