//
//  MapCollectionViewCell.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/21/15.
//  Copyright (c) 2015 Grupo RBS. All rights reserved.
//

import UIKit
import MapKit

class MapCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lblLocation: UILabel!
    
    func showLocation (latitude: Double, longitude: Double, locationName: String) {
    
        var location = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
        
        var span = MKCoordinateSpanMake(0.5, 0.5)
        var region = MKCoordinateRegion(center: location, span: span)
        
        self.mapView.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate.latitude = location.latitude
        annotation.coordinate.longitude = location.longitude
        annotation.title = locationName
        
        self.mapView.addAnnotation(annotation)
        
        self.lblLocation.text = locationName
    
    }
    
}
