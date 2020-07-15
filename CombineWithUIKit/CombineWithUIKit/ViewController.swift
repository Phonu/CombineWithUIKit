//
//  ViewController.swift
//  CombineWithUIKit
//
//  Created by mac admin on 18/06/20.
//  Copyright © 2020 Kunal. All rights reserved.
//

import UIKit
import Combine


/*
 ** Customize handling of asynchronous events by combining event-processing operators
 ** basic principle of Combine
    --Publishers are the same as Observables.
    --Subscribers are the same as Observers.
 */





extension Notification.Name {
    static let messageNotification = Notification.Name("newMessage")
}

struct Messsage {
    let content:String
}

class ViewController: UIViewController {

    @IBOutlet weak var messsageSwitch: UISwitch!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    @Published var canSendMessages:Bool = false
    
    private(set) var name:String = "kunal"
    
    let a = A()
   
    
//    let abc = SingletonClass()
    
    
    /*AnyCancellable instance automatically calls cancel() when deinitialized.*/
    /*i.e, Whenever the view controller is released, the property is released as well and the cancel() method is called*/
    var switchSubscriber:AnyCancellable?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProcessingChain()
        
        SingletonClass.sharedInstance.name = "kunal"
        
        
        let p = SingletonClass.sharedInstance
        p.abcd()
        print(SingletonClass.sharedInstance.name)
        
//        self.self.a.name = "Meenal"
        print(a.name)
        
      
    }
    
    func setupProcessingChain(){
        switchSubscriber = $canSendMessages.receive(on: DispatchQueue.main).assign(to: \.isEnabled, on: messageButton)
        //Subscriber are confirmed with cancellable protocol.

        let messagePublisher = NotificationCenter.Publisher(center: .default, name:.messageNotification)
            .map({notification -> String? in
                return ((notification.object as? Messsage)?.content ?? "")
            })


        let messageSubscriber = Subscribers.Assign(object: messageLabel, keyPath: \.text)
        messagePublisher.subscribe(messageSubscriber)
    }

    @IBAction func didSwitch(_ sender: Any) {
        canSendMessages = (sender as! UISwitch).isOn
        /*Eaiser way to connect the UI Componenet with each other through Combine */
    }
    @IBAction func sendMessage(_ sender: Any) {
      let message = Messsage(content: "\(Date())")
        NotificationCenter.default.post(name: .messageNotification, object: message)
    
    }
    
}

class A {
    private(set) var name:String = "kunal"
    
    func abc() {
        
    }
}
