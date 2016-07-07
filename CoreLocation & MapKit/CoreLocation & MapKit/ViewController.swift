/// TIPP:
/// Inside the Simulators Debug-menu you can simulate a city run etc

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    /// Location Manager is reponsible for tracking your location and givng feedback about changes using a delegation protocol
    var locationManager: CLLocationManager?
    
    /// You can define Locations using CLLocation 
    var startLocation: CLLocation?
    var locationOfWorldLargestHairBall = CLLocation(latitude: 40.728657, longitude: -73.631744)

    @IBOutlet weak var hairBallDistanceLabel : UILabel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager() // Creating a Manager Object
        
        locationManager?.delegate = self // Setting ourself as an delegate
        
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest // keep battery life in mind
        
        locationManager?.requestWhenInUseAuthorization() // This will present a accept dialog to the user
    }
}


extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if startLocation == nil {
            startLocation = locations.first
        } else {
            guard let latest = locations.first else {return}
            let distanceInMeters = startLocation?.distanceFromLocation(latest)
            print("distance in meters: \(distanceInMeters)")
            hairBallDistanceLabel?.text = "\(latest.distanceFromLocation(self.locationOfWorldLargestHairBall))m"
        }
    }
    
    /// If the user accepted location services for your app if will call this method
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        /// if the user authorized on of the following options start tracking 
        if status == .AuthorizedWhenInUse || status == .AuthorizedAlways {
            locationManager?.startUpdatingLocation()
        }
    }
}
