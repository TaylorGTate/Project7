import React from "react";
import axios from "axios";
import { Link } from "react-router-dom";

export default class OrderForm extends React.Component {
    render = () => {

        return (
            <div className="container">
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
