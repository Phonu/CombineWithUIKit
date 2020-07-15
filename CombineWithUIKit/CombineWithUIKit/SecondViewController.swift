//
//  SecondViewController.swift
//  CombineWithUIKit
//
//  Created by mac admin on 08/07/20.
//  Copyright © 2020 Kunal. All rights reserved.
//

import UIKit
import Combine

class SecondViewController: UIViewController {
    
    @Published var 	randomValue = 0
    var cancellable:AnyCancellable?
    @IBOutlet weak var labelValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancellable = $randomValue
            .receive(on: DispatchQueue.main)
            .map({ eachValue in eachValue.description})
            .assign(to: \.text, on: labelValue)

    }
    
    @IBAction func nextClickAction() {
        randomValue = Int.random(in: 0...9)
    }
    


}
