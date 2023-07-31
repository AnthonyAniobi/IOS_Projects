//
//  ContentView.swift
//  Furniture Ecommerce
//
//  Created by Anthony Aniobi on 29/07/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @State var currentTab: Tab = .Home
    
    @Namespace var animation
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $currentTab) {
            HomePageView() 
            Text("Search view")
                .tag(Tab.Search)
            Text("Notification view")
                .tag(Tab.Notificaitons)
            Text("Cart view")
                .tag(Tab.Cart)
            Text("Profile view")
                .tag(Tab.Profile)
        }
        .overlay(HStack(spacing: 0){
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                TabButton(tab: tab)
            }
            .padding(.vertical)
            .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom-15))
            .background(Color("kSecondary"))
        },alignment: .bottom)
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    func TabButton(tab: Tab) -> some View{
        GeometryReader { proxy in
            Button {
                withAnimation(.spring()) {
                    currentTab = tab
                }
            } label: {
                VStack(spacing: 0){
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .foregroundColor(Color("kPrimary"))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack{
                                if currentTab == tab {
                                    MaterialEffect(style: .light)
                                        .clipShape(Circle())
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                    Text(tab.TabName)
                                        .foregroundColor(.primary)
                                        .font(.footnote)
                                        .padding(.top, 50)
                                }
                            }
                        ).contentShape(Rectangle())
                        .offset(y: currentTab == tab ? -15 : 0)
                }
            }
            

        }
        .frame(height: 25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CartManager())
    }
}

enum Tab: String, CaseIterable{
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notificaitons = "bell"
    case Cart = "bag"
    case Profile = "person"
    
    var TabName: String {
        switch self {
        case .Home:
            return "Home"
        case .Cart:
            return "Cart"
        case .Notificaitons:
            return "Notifications"
        case .Profile:
            return "Profile"
        case .Search:
            return "Search"
        }
    }
}


extension View {
    func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}


struct MaterialEffect: UIViewRepresentable{
    
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
