import React from "react";
import axios from "axios";
import { Link } from "react-router-dom";
import Cart from '../../catalog/components/Cart';
export default class OrderForm extends React.Component {
    handlePopularity = (books) => {
    }

    render = () => {

        return (
            <div className="container">
                <div className="row">
                    <div className="col-md-12 pull-right">
                        <Cart ref="cart" id={this.props.cart_id} handlePopularity={this.handlePopularity} url={this.props.match.url}/>
                    </div>
                </div>
                <h2>Please Enter Your Details</h2>
                <form>
                    <div className="actions" align="right">
                        <Link className="btn btn-success" to={{pathname:"/"}}>
                            Cancel
                        </Link>
                    </div>
                </form>
            </div>
        );
    };
}
