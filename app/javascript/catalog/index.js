import React from "react";
import ReactDOM from "react-dom";
import Catalog from "./components/Catalog";


document.addEventListener("DOMContentLoaded", () => {
    const catalog = document.querySelector("#catalog");
    const cart_id = JSON.parse(catalog.getAttribute("cart_id"));
    ReactDOM.render(<Catalog cart_id={cart_id} />, catalog);
});
