import React from "react";
import ReactDOM from "react-dom";
import PayTypeSelector from "./components/PayTypeSelector";

document.addEventListener("DOMContentLoaded", () => {
    const order_pay_type = document.querySelector("#order_pay_type");
    ReactDOM.render(<PayTypeSelector />, order_pay_type);
});
