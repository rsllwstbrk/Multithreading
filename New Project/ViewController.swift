//
//  ViewController.swift
//  New Project
//
//  Created by Rsllwstbrk on 13.11.23.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let balanceLabel = UILabel()
    
    let lock = NSLock()
    var balance = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let depositThread = Thread {
            depositMethod()
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            depositThread.start()
        }
        
        
        
        let withdrawalThread = Thread {
            withdrawalMethod()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            withdrawalThread.start()
        }
        
        func depositMethod() {
            lock.lock()
            balance += 20
            lock.unlock()
        }
        
        func withdrawalMethod() {
            lock.lock()
            balance -= 10
            lock.unlock()
        }

        
        self.view.addSubview(label)
        label.text = "Current Balance:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -22).isActive = true
        
        self.view.addSubview(balanceLabel)
        balanceLabel.text = "\(balance)$"
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        balanceLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
        
        
        
        
    }


}

