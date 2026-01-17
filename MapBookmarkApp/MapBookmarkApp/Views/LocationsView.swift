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
            
            VStack (spacing: 0) {
                header
                .padding()
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}


extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList){
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationList ? 180 : 0))
                    }
            }
            if vm.showLocationList{
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y:15)
    }
}
