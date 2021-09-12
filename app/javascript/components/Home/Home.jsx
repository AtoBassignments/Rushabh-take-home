import React, {useState, useEffect} from "react";
import MapView from "../MapView/MapView.jsx";
import {HOME_BASE} from "./constants";
import consumer from "../../channels/consumer"

export default function Home(props) {

    const [centerLoc, setCenterLoc] = useState(HOME_BASE.COORDINATES);
    const [vehicles, setVehicles] = useState(null);

    function setup() {



        consumer.subscriptions.create("FleetStatusChannel", {
            received(data) {
                if (data && data.updated_vehicles.length !== 0) {
                    setVehicles(data.updated_vehicles);
                    setCenterLoc({lat: parseFloat(data.updated_vehicles[0].latitude), lng: parseFloat(data.updated_vehicles[0].longitude)});
                }
            }
        });
    }

    useEffect(() => {
        setup();
    });


    return (
        <MapView centerLoc={centerLoc} vehicles={vehicles}/>
    );
}
