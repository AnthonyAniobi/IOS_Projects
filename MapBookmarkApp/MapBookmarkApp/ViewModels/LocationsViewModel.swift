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
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextButtonPressed(){
        let loctionIndex = locations.firstIndex(where: {$0 == mapLocation})
        
        guard let currentIndex = loctionIndex else {
            print("Could not find current index in locations array should not happen")
            return
        }
        
        // check if
        let nextIndex = currentIndex + 1
        if locations.indices.contains(nextIndex){
            showNextLocation(location: locations[nextIndex])
        } else {
            showNextLocation(location: locations[0])
        }
    }
}
