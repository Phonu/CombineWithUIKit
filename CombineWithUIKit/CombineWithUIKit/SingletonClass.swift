//
//  SingletonClass.swift
//  CombineWithUIKit
//
//  Created by mac admin on 25/06/20.
//  Copyright © 2020 Kunal. All rights reserved.
//

import Foundation



final class SingletonClass {
    var name:String = ""
    var add:String = ""
    
    static let sharedInstance = SingletonClass()
    
    private init() {}
    
    
    func abcd() {
        
    }
}



