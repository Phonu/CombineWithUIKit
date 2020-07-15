//
//  Random.swift
//  CombineWithUIKit
//
//  Created by mac admin on 08/07/20.
//  Copyright © 2020 Kunal. All rights reserved.
//

import Foundation

class Random {
    
    @Published private(set) var value: Int = 0
    
    func next() {
        value  = Int.random(in: 0...9)
    }
}
