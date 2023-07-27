//
//  ContentView.swift
//  Ios Academy
//
//  Created by Anthony Aniobi on 26/07/2023.
//

import SwiftUI


struct UrlImage: View{
    let urlString: String
    
    @State var data: Data?
    var body: some View{
        if let data=data, let uiImage = UIImage(data: data){
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(Color.gray)
        } else {
            Image(systemName: "video")
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear{
                    fetchData()
                }
        }
        
    }
    
    func fetchData(){
        guard let url = URL(string: urlString) else{return}
        
        let task = URLSession.shared.dataTask(with: url){
            data,_,error in
            self.data = data
        }
        
        task.resume()
    }
}


struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.courses, id: \.self){
                    course in
                    HStack{
                        UrlImage(urlString: course.image)
                        Text(course.name)
                    }
                    .padding(3)
                    
                }
                
            }
            .navigationTitle("Courses")
            .navigationBarTitleDisplayMode(.large)
            .onAppear{
                viewModel.fetch()
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
