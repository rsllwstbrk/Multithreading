//
//  ViewController.swift
//  New Project
//
//  Created by Rsllwstbrk on 13.11.23.
//

import UIKit


class BankAccount {
    func deposit() {}
    func withdrawal() {}
}

class ViewController: UIViewController {
    
    var depositTimer: Timer?
    var withdrawalTimer: Timer?
    
    let label = UILabel()
    let balanceLabel = UILabel()

    var balance = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
        depositTimer = Timer(timeInterval: 2, repeats: true, block: { depositTimer in
                self.balance += 4
                self.balanceLabel.text = "\(self.balance)$"
            })
        RunLoop.main.add(depositTimer!, forMode: .default)
        
        withdrawalTimer = Timer(timeInterval: 7, repeats: true, block: { depositTimer in
                self.balance -= 10
                self.balanceLabel.text = "\(self.balance)$"
            })
        RunLoop.main.add(withdrawalTimer!, forMode: .default)
        
    }


}

