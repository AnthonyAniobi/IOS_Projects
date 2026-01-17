//
//  LocationsViewModel.swift
//  MapBookmarkApp
//
//  Created by Anthony Aniobi on 17/01/2026.
//

import Foundation

class LocationsViewModel: ObservableObject{
    @Published var locations: [Location] = []
    
    init(){
        self.locations = LocationsDataService.locations
    }
}
