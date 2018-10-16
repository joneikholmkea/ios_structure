//
//  ViewModel.swift
//  iOS_Structure
//
//  Created by Jon Eikholm on 15/10/2018.
//  Copyright © 2018 Jon Eikholm. All rights reserved.
//

import Foundation
class ViewModel{
    
    private var myModel = Model<Observable<Date>>()
    func addEntry(){
        let dateObservable = Observable(Date())
        myModel.insert(dateObservable)
        dateObservable.bind = {_ in
            NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "updateUI")))
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5)) {
            dateObservable.value = Date()
        }
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
        return date.value.description
    }
    
    
}
