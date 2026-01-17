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
                VStack {
                    Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                }
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y:15)
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
