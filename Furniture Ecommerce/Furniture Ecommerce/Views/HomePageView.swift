//
//  HomePageView.swift
//  Furniture Ecommerce
//
//  Created by Anthony Aniobi on 30/07/2023.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var cartManager : CartManager
    var body: some View {
        NavigationView {
            ZStack(alignment: .top){
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView (.vertical){
                    VStack{
                        
                        AppBar()
                            
                        SearchView()
                            
                        ImageSliderView()
                        
                        HStack{
                            Text("New Arrivals")
                                .font(.title2)
                                .fontWeight(.medium)
                            Spacer()
                            
                            NavigationLink(destination: {ProductsView()}, label: {Image(systemName: "circle.grid.2x2.fill")
                                    .foregroundColor(Color("kPrimary"))
                            })
                        }
                        .padding()
                        
                        ScrollView(.horizontal, showsIndicators: true){
                            HStack(spacing: 10) {
                                ForEach(productList, id: \.id) { product in
                                    NavigationLink{
                                        ProductDetailsView(product: product)
                                    }label: {
                                        ProductCardView(product: product)
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 50)
                    }
                    .environmentObject(cartManager)
                }
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .environmentObject(CartManager())
    }
}

struct AppBar: View {
    @EnvironmentObject var cartManager : CartManager
    
    var body: some View {
        ScrollView(.vertical) {
            VStack (alignment: .leading){
                HStack{
                    Image(systemName: "location.north.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                    Text("Shangai, China")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Spacer()
                    NavigationLink(destination: CartView()) {
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                    
                }
                Text("Find the Most \n Luxirious")
                    .font(.largeTitle .bold())
                + Text(" Furniture")
                    .font(.largeTitle .bold())
                    .foregroundColor(Color("kPrimary"))
            }
            .padding()
        }
    }
}
