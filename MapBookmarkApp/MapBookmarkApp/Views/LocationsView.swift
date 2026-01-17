//
//  LocationsView.swift
//  MapBookmarkApp
//
//  Created by Anthony Aniobi on 17/01/2026.
//

import SwiftUI

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location] = []
    
    
    init() {
        self.locations = LocationsDataService.locations
    }
}


struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations){ location in
                Text(location.name)
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
