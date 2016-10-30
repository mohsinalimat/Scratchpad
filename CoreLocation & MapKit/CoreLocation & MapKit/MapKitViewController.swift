//
//  MapKitViewController.swift
//  CoreLocation & MapKit
//
//  Created by Sebastian Boldt on 10.07.16.
//  Copyright © 2016 Sebastian Boldt. All rights reserved.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appleHQ = CLLocation(latitude: 37, longitude: -122)
        let regionRadius : CLLocationDistance = 100
        let region = MKCoordinateRegionMakeWithDistance(appleHQ.coordinate, regionRadius, regionRadius)
        mapView.setRegion(region, animated: true)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        // Mapview setup 
        self.mapView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MapKitViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse {
            
        }
    }
}

extension MapKitViewController : MKMapViewDelegate {
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("Rendering")
    }
}
