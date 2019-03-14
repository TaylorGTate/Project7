import React from "react";
import ReactDOM from "react-dom";
import App from './routes';

document.addEventListener("DOMContentLoaded", () => {
    const catalog = document.querySelector("#catalog");
    const seller = JSON.parse(catalog.getAttribute("seller"));
    const cart_id = JSON.parse(catalog.getAttribute("cart_id"));
    ReactDOM.render(<App cart_id={cart_id} seller={seller} />, catalog);
});
