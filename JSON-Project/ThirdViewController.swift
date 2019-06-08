//
//  ThirdViewController.swift
//  JSON-Project
//
//  Created by Greeens5 on 07/06/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
class ThirdViewController: UIViewController {
    
    
     override func viewDidLoad() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        let lat = Double(appDelegate.globallatitude!)
        let long = Double(appDelegate.globallongitude!)
        let camera = GMSCameraPosition.camera(withLatitude: lat!, longitude:   long!, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
//        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat!, longitude:     long!)
//        marker.title = "Adayar"
//        marker.snippet = "CHENNAI"
        marker.map = mapView
        
        

    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
