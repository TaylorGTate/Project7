import React from "react";
import ReactDOM from "react-dom";
import PayTypeSelector from "./components/PayTypeSelector";

document.addEventListener("DOMContentLoaded", () => {
	const pay_type = order_pay_type.getAttribute("pay_type");
  ReactDOM.render(<PayTypeSelector pay_type={pay_type}/>, order_pay_type);
});
