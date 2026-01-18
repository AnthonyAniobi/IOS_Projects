//
//  LocationDetailView.swift
//  MapBookmarkApp
//
//  Created by Anthony Aniobi on 17/01/2026.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    var location: Location
    @EnvironmentObject var vm: LocationsViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton, alignment: .topLeading)
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}


extension LocationDetailView {
    
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
                    
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            if let url = URL(string: location.link){
                Link("Read more on Wikipedia", destination: url)
            }
        }
    }
    
    private var mapLayer: some View {
        Map(
            position: .constant(
                MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: location.coordinates,
                        span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    )
                )
            )
        ){
            Annotation("", coordinate: location.coordinates){
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(8)
    }
    
    private var backButton: some View {
        Button(action: {
            vm.sheetLocation = nil
        }) {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thinMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
            
        }
    }
}
