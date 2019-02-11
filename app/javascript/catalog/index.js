import React from "react";
import ReactDOM from "react-dom";
import Catalog from "./components/Catalog";

document.addEventListener("DOMContentLoaded", () => {
    const catalog = document.querySelector("#catalog");
    ReactDOM.render(<Catalog />, catalog);
});
