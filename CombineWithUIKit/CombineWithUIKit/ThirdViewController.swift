//
//  ThirdViewController.swift
//  CombineWithUIKit
//
//  Created by mac admin on 08/07/20.
//  Copyright © 2020 Kunal. All rights reserved.
//

import UIKit
import Combine

class ThirdViewController: UIViewController {
     
    
    let randomViewModal = RandomViewModel()
    
    @IBOutlet weak var value:UILabel!
    
    var cancellable: AnyCancellable?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancellable = randomViewModal
            .randomValueAsString()
            .receive(on: DispatchQueue.main)
            .assign(to: \.text, on: value)

    }
    
    @IBAction func next() {
        randomViewModal.next()
    }

  
}
