/// TIPP:
/// Inside the Simulators Debug-menu you can simulate a city run etc

import UIKit
import CoreLocation

class ViewController: UIViewController {
    var locationManager: CLLocationManager?
    var startLocation: CLLocation?
    var locationOfWorldLargestHairBall = CLLocation(latitude: 40.728657, longitude: -73.631744)

    @IBOutlet weak var hairBallDistanceLabel : UILabel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
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
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse || status == .AuthorizedAlways {
            locationManager?.startUpdatingLocation()
        }
    }
}
