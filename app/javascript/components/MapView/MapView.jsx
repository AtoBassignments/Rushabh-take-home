import React from "react";

import "./MapView.css";
import GoogleMapReact from 'google-map-react';
import {GOOGLE_MAPS} from "./constants";

const VehicleMarker = (props) => <div className="marker" {...props}><img src={require('./marker.png')}></img></div>;

export default function MapView(props) {

    function vehicleMarker(vehicle) {
        return (
            <VehicleMarker
                lat={parseFloat(vehicle.latitude)}
                lng={parseFloat(vehicle.longitude)}
                id={vehicle.uid}
            />
        );
    }

    function showVehicles(vehicles) {
        if (vehicles && vehicles.length !== 0) {
            return vehicles.map(v => vehicleMarker(v))
        }
    }

    return (
        <div id="map-view" className="MapView">
            <GoogleMapReact
                bootstrapURLKeys={{key: GOOGLE_MAPS.API_KEY}}
                center={props.centerLoc}
                defaultZoom={5}
            >
                {
                    showVehicles(props.vehicles)
                }
            </GoogleMapReact>
        </div>
    );
}
