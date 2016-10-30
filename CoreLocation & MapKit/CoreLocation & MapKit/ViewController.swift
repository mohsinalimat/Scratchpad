/// TIPP:
/// Inside the Simulators Debug-menu you can simulate a city run etc
/// Gpx Files will be selectable
import UIKit
import CoreLocation // also includes CoreLocation

/// Two types of localization 
/// • Always Authorization 
/// • When In Use Authorization


/// Things to keep in mind
/// • Deferred Updates

class ViewController: UIViewController {
    
    /// Location Manager is reponsible for tracking your location and givng feedback about changes using a delegation protocol
    var locationManager: CLLocationManager?
    var monitoringLocation : CLLocation? = CLLocation(latitude: 51, longitude: 52)
    
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
        

        // When using locationManager?.requestAlwaysAuthorization() iOS will not present a blue bar to the user
        
        // testStringToCoordinates()
    }
}


extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if startLocation == nil {
            startLocation = locations.first
        } else {
            //sguard let latest = locations.first else {return}
            //let distanceInMeters = startLocation?.distance(from: latest)
            //print("distance in meters: \(distanceInMeters)")
            //hairBallDistanceLabel?.text = "\(latest.distance(from: self.locationOfWorldLargestHairBall))m"
        }
    }
    /// If the user accepted location services for your app if will call this method
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        /// if the user authorized on of the following options start tracking 
        if status == CLAuthorizationStatus.authorizedWhenInUse || status == CLAuthorizationStatus.authorizedAlways {
            locationManager?.startUpdatingLocation()
            locationManager?.allowsBackgroundLocationUpdates = true // You need to set this in iOS9
        }
    }
    
    
    /// You should implement this method, if this method isnt implemented your App will crash
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // User CLError to determine which kind of error was thrown
        //let _ = CLError.denied // User denied Location Services
    }
    
    /// Geofencing Delegate Methods
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        
    }
}

extension ViewController {
    func locationManagerTests() {
        locationManager?.requestLocation() // Requests a single location
    }
}
