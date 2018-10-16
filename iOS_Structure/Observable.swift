//
//  Binding.swift
//  iOS_Structure
//
//  Created by Jon Eikholm on 15/10/2018.
//  Copyright © 2018 Jon Eikholm. All rights reserved.
//

import Foundation
class Observable<T>{
    var bind:(T) -> () = {_ in
        
    }
    
    var value:T{
        didSet{
            bind(value)
        }
    }
    init(_ value:T) {
        self.value = value
    }
}
