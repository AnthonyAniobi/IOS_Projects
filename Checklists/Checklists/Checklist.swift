//
//  Checklist.swift
//  Checklists
//
//  Created by Anthony Aniobi on 20/03/2023.
//

import Foundation


class Checklist: ObservableObject{
    
    init(){
        print("Document directory is: \(documentDirectory())")
        print("File path is: \(dataFilePath())")
        loadListItems()
    }
    
    @Published var item = []

    
    func showChecklistContent(){
        for item in item{
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet){
        item.remove(atOffsets: whichElement)
        showChecklistContent()
        saveListItems()
    }
    
    func moveListItem(whichElement: IndexSet, destination:Int){
        item.move(fromOffsets: whichElement, toOffset: destination)
        saveListItems()
    }
    
    func documentDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentDirectory().appendingPathComponent("Checklist.plist")
    }
    
    func saveListItems(){
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(item)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        }catch{
            print("Error encoding items")
        }
    }
    
    func loadListItems(){
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path){
            let decoder = PropertyListDecoder()
            do{
                item = try decoder.decode([CheckListItem].self, from: data)
            }catch{
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
}
