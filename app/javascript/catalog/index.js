import React from "react";
import ReactDOM from "react-dom";
import Catalog from "./components/Catalog";


document.addEventListener("DOMContentLoaded", () => {
    const catalog = document.querySelector("#catalog");
    const seller = JSON.parse(catalog.getAttribute("seller"));
    ReactDOM.render(<Catalog cart_id={cart_id} seller={seller} />, catalog);
});
