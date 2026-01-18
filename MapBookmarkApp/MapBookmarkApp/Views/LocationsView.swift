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
    let maxWidthForIpad: CGFloat = 700
    
    var body: some View {
        ZStack {
            
            mapLayer
            .ignoresSafeArea()
            
            VStack (spacing: 0) {
                header
                .padding()
                .frame(maxWidth: maxWidthForIpad)
                
                Spacer()
                locationPreviewStack
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil){ location in
                LocationDetailView(location: location)
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
                    .animation(.none, value: vm.mapLocation)
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
    
    private var mapLayer: some View {
        Map(position: $vm.mapPosition){
            ForEach( vm.locations ) { location in
                Annotation("", coordinate: location.coordinates){
                    LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1: 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            }
        }
    }
    
    private var locationPreviewStack: some View {
        ZStack{
            ForEach(vm.locations){ location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        )
                    )
                }
            }
        }
    }
}
