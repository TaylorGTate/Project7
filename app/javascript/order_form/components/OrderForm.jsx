import React from "react";
import axios from "axios";
import { Link } from "react-router-dom";

import Cart from '../../catalog/components/Cart';
import PayTypeSelector from './PayTypeSelector';
import classnames from "classnames";

export default class OrderForm extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            name: "",
            address: "",
            email: "",
            pay_type: "",
            errors: {}
        };
        this.onInputChange = this.onInputChange.bind(this);
        this.onFormSubmit = this.onFormSubmit.bind(this);
    }

    onFormSubmit(event) {
        event.preventDefault();

        const newOrder = {
            name: this.state.name,
            address: this.state.address,
            email: this.state.email,
            pay_type: this.state.pay_type
        };

        var self = this;
        axios.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest";
        axios
            .post("/orders", { ...newOrder })
            .then(function(response) {
                console.log(response.data);
                self.props.history.push({
                  pathname: '/'
                });
            })
            .catch(function(error) {
                console.log(error.response);
                // alert("Cannot place order: ", error);
                self.setState({errors: error.response.data})
            });
    }

    onInputChange(e) {
        this.setState({ [e.target.name]: e.target.value });
    }

    handlePopularity = (books) => {

    };

    handleSelectPayType = selected_pay_type => {
        console.log(selected_pay_type);
        this.setState( {pay_type: selected_pay_type});
    }

    render = () => {
        const { errors } = this.state;
        console.log(errors)
        var {true_cart_id} = this.props.location

        return (
            <div className="container">
                <div className="row">
                    <div className="col-md-12 pull-right">
                        <Cart ref="cart" id={true_cart_id ? true_cart_id : this.props.cart_id} handlePopularity={this.handlePopularity} url={this.props.match.url}/>
                    </div>
                </div>

                <h2>Please Enter Your Details</h2>
                <form noValidate onSubmit={this.onFormSubmit}>
                    <div>
                        {errors.form && (
                            <div className="invalid-feedback" style={{display: "block"}}>
                                {errors.form}
                            </div>
                        )}
                    </div>

                    <div className="form-group">
                        <input
                            type="text"
                            className={classnames(
                                "form-control form-control-lg",
                                { "is-invalid": errors.name }
                            )}
                               placeholder="Name"
                            name="name"
                            value={this.state.name}
                            onChange={this.onInputChange}
                        />
                        {errors.name && (
                            <div className="invalid-feedback">
                                {errors.name}
                            </div>
                        )}
                    </div>
                    <div className="form-group">
                        <input
                            type="address"
                            className={classnames(
                                "form-control form-control-lg",
                                { "is-invalid": errors.address }
                            )}
                            placeholder="Address"
                            name="address"
                            value={this.state.address}
                            onChange={this.onInputChange}
                        />
                        {errors.address && (
                            <div className="invalid-feedback">
                                {errors.address}
                            </div>
                        )}
                    </div>
                    <div className="form-group">
                        <input
                            type="email"
                            className={classnames(
                                "form-control form-control-lg",
                                {
                                    "is-invalid":
                                        errors.email
                                }
                            )}
                            placeholder="Email"
                            name="email"
                            value={this.state.email}
                            onChange={this.onInputChange}
                        />
                        {errors.email && (
                            <div className="invalid-feedback">
                                {errors.email.join(", ")}
                            </div>
                        )}
                    </div>

                    <div className="form-group">
                    <div>
                        <PayTypeSelector handleSelectPayType={this.handleSelectPayType} />
                    </div>
                        {errors.pay_type && (
                            <div className="invalid-feedback" style={{display: "block"}}>
                                {errors.pay_type.join(", ")}
                            </div>
                        )}
                    </div>


                    <div className="actions" align="right">
                        <input
                            type="submit"
                            className="btn btn-success"
                        />
                        &nbsp;
                        <Link className="btn btn-success" to={{pathname:"/", true_cart_id: true_cart_id }}>
                            Cancel
                        </Link>
                    </div>
                </form>
            </div>
        );
    };
}
