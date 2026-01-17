//
//  LocationsView.swift
//  MapBookmarkApp
//
//  Created by Anthony Aniobi on 17/01/2026.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapPosition)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
