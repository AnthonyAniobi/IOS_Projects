//
//  LocationPreviewView.swift
//  MapBookmarkApp
//
//  Created by Anthony Aniobi on 17/01/2026.
//

import SwiftUI

struct LocationPreviewView: View {
    let location: Location
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            
            
            
            VStack(alignment: .leading) {
                imaggeSection
                titleSectiton
            }
            
            VStack(spacing: 8){
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10).fill(.ultraThinMaterial)
                .offset(y:65)
        )
        .cornerRadius(10)
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .padding()
            
    }
    .environmentObject(LocationsViewModel())
}

extension LocationPreviewView {
    private var imaggeSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSectiton: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var learnMoreButton: some View {
        Button{
            
        }label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button{
            vm.nextButtonPressed()
        }label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
