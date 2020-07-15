//
//  RandomViewModel.swift
//  CombineWithUIKit
//
//  Created by mac admin on 08/07/20.
//  Copyright © 2020 Kunal. All rights reserved.
//

import Foundation
import Combine

class RandomViewModel {
    let random = Random()
    
//    var randomValueAsString: String {
//        return random.value.description
//    }

    
    func randomValueAsString() -> AnyPublisher<String? ,Never>{
        random.$value
            .map( { i in i.description})
            .eraseToAnyPublisher()
    }

    func next() {
        random.next()
    }
}
