import React from "react";
import {render} from "react-dom";
import App from "../components/App/App";

document.addEventListener("DOMContentLoaded", () => {
    render(
        <App/>,
        document.body.appendChild(document.getElementById("react-root"))
    );
});