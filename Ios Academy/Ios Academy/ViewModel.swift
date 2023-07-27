//
//  ViewModel.swift
//  Ios Academy
//
//  Created by Anthony Aniobi on 27/07/2023.
//

import Foundation


struct Course: Hashable, Codable{
    let name: String
    let image: String
}


class ViewModel: ObservableObject{
    
    @Published var courses: [Course] = []
    
    func fetch(){
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            data,_, error in
            guard let data = data, error == nil else{
                return
            }
            // convert to json
            do{
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.courses = courses
                }
            }
            catch{
               print(error)
            }
        }
        task.resume()
    }
}
