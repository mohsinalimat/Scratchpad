//
//  GeoCodingHelper.swift
//  CoreLocation & MapKit
//
//  Created by Sebastian Boldt on 10.07.16.
//  Copyright © 2016 Sebastian Boldt. All rights reserved.
//

import Foundation
import CoreLocation

/// Lookups are expensive, if you make a lot of request apple will deny them
/// If user is moving, defer looks until after a significant distance has been traveled 
/// provide the lookups so the user can always see the results, dont do lookup when app is in background

/// You can use
public func getAddressFromCoordinates(completion:([CLPlacemark]?,NSError?)->()) {
    // thoroughfare -> German: Durchgangsstraße
    // TODO: Implement this
}

public func getCoordinatesFromAddress(addressString:String, completion: @escaping  ([CLPlacemark]?,Error?)->()) {
    let goeCoder = CLGeocoder()
    goeCoder.geocodeAddressString(addressString,completionHandler:completion)

}

func testStringToCoordinates() {
    getCoordinatesFromAddress(addressString: "Neubukower Straße 1, 18230 Zweedorf", completion: {
        placeMarks, error in
        if let placemark = placeMarks?.first {
            let latitude = placemark.location?.coordinate.latitude
            let longitude = placemark.location?.coordinate.longitude
            print("*********************************")
            print("Lat:\(latitude) Long:\(longitude)")
            print("*********************************")
        }
    })
}
