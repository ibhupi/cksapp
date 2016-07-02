//
//  MapViewController.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        GMSServices.provideAPIKey(GoogleMapAPIKEY)
        
        let camera = GMSCameraPosition.cameraWithLatitude(TokyoTowerCoordinate.latitude,
                                                          longitude: TokyoTowerCoordinate.longitude, zoom: 16)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = TokyoTowerCoordinate
        marker.title = "Tokyo Tower"
        marker.snippet = "東京タワー"
        marker.map = mapView
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(MyScheduleViewController.addNewEvent))
        self.navigationItem.rightBarButtonItem = barButtonItem
    }

    func addNewEvent() {
        self.addPlacePicker()
    }
    
    
    private func addPlacePicker() {
        let center = CLLocationCoordinate2DMake(51.5108396, -0.0922251)
        let northEast = CLLocationCoordinate2DMake(center.latitude + 0.001, center.longitude + 0.001)
        let southWest = CLLocationCoordinate2DMake(center.latitude - 0.001, center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        let placePicker = GMSPlacePicker(config: config)
        
        placePicker.pickPlaceWithCallback({ (place: GMSPlace?, error: NSError?) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let place = place {
                print("Place name \(place.name)")
                print("Place address \(place.formattedAddress)")
                print("Place attributions \(place.attributions)")
            } else {
                print("No place selected")
            }
        })
        
        
    }
    
    // MARK: - Private Function
    
    func reloadRoute() {
        
    }

    
    
    // MARK: - GMSMapViewDelegate
    
    func mapViewDidFinishTileRendering(mapView: GMSMapView) {
        self.reloadRoute()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
