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
    }
    
    @Published var item = [
        CheckListItem(name: "Walk the dog"),
        CheckListItem(name: "Brush my teeth"),
        CheckListItem(name: "Learn iOS development", isChecked: true),
        CheckListItem(name: "Walk the dog", isChecked: true),
        CheckListItem(name: "Soccer practice"),
        CheckListItem(name: "Eat ice cream", isChecked: true)]

    
    func showChecklistContent(){
        for item in item{
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet){
        item.remove(atOffsets: whichElement)
        showChecklistContent()
    }
    
    func moveListItem(whichElement: IndexSet, destination:Int){
        item.move(fromOffsets: whichElement, toOffset: destination)
    }
    
    func documentDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentDirectory().appendingPathComponent("Checklist.plist")
    }
}
