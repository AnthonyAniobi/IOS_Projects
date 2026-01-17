//
//  LocationsViewModel.swift
//  MapBookmarkApp
//
//  Created by Anthony Aniobi on 17/01/2026.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject{
    @Published var locations: [Location] = []
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapPosition: MapCameraPosition = MapCameraPosition.automatic
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // show list of locations
    @Published var showLocationList: Bool = false
    
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
        mapPosition = MapCameraPosition.region(
            MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan,
            )
        )
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut){
            showLocationList.toggle()
        }
    }
}
