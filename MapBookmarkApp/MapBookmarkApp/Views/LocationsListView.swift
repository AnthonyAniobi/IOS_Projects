//
//  LocationsListView.swift
//  MapBookmarkApp
//
//  Created by Anthony Aniobi on 17/01/2026.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    
    var body: some View {
        List {
            ForEach(vm.locations){ location in
                listRowView(location: location)
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}


extension LocationsListView {
    
    private func listRowView(location: Location) -> some View{
        HStack{
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth:.infinity, alignment: .leading)
        }
    }
    
}
