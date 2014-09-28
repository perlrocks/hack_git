//
//  ViewController.swift
//  hack1
//
//  Created by seamus o cuinneagain on 9/27/14.
//  Copyright (c) 2014 seamus o cuinneagain. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    @IBOutlet weak var theMapView: MKMapView!
 
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        var latitude:CLLocationDegrees = 48.123456
        var longitude:CLLocationDegrees = 9.991234
        
        var latdelta:CLLocationDegrees = 0.1
        var longdelta:CLLocationDegrees = 0.1
        
        var thespan: MKCoordinateSpan = MKCoordinateSpanMake(latdelta, longdelta)
        var churchlocation = CLLocationCoordinate2DMake(latitude,longitude)
      
        
        var theregion: MKCoordinateRegion = MKCoordinateRegionMake  (churchlocation,thespan)
        
        
        self.theMapView.setRegion(theregion, animated:true)
        
        var theUlmMinsterAnnotation = MKPointAnnotation()
        theUlmMinsterAnnotation.coordinate = churchlocation
        
        theUlmMinsterAnnotation.title = "title of annotation"
        theUlmMinsterAnnotation.subtitle="annotation subtitle "
        self.theMapView.addAnnotation(theUlmMinsterAnnotation)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func findMyLocation(sender: AnyObject) {
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.startUpdatingLocation()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  

}

