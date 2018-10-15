//
//  Presenter.swift
//  iOS_Structure
//
//  Created by Jon Eikholm on 15/10/2018.
//  Copyright © 2018 Jon Eikholm. All rights reserved.
//

import Foundation
class Presenter {
  private var myModel = Model<Date>()
    
    func addEntry(){
        myModel.insert(Date())
    }
    var count:Int {
        return myModel.count
    }
    
    func removeEntry(at index:Int){
        myModel.remove(at: index)
    }
    
    subscript(index:Int) -> String? {  // this specific Presenter is initialized as a Date description presenter!
        guard let date = myModel[index] else{
            return nil
        }
        return date.description
    }
}
