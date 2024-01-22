//
//  ViewController.swift
//  New Project
//
//  Created by Rsllwstbrk on 13.11.23.
//

import UIKit

class BankAccount {
    
    var balance = 0
    let concurrentQueue = DispatchQueue(label: "Bank Account Balance", attributes: .concurrent)
    
    func deposit () {
        concurrentQueue.async {
            self.balance += 20}
    }
    
    func withdrawal () {
        concurrentQueue.async {
            self.balance -= 10
        }
    }
    
}

class ViewController: UIViewController {
    
    let bankAccount = BankAccount()
    
    
    let label = UILabel()
    let balanceLabel = UILabel()
//    
//    let lock = NSLock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        concurrentQueue.async {
//            balance += 20
//        }
//        concurrentQueue.async {
//            balance -= 10
//        }
        
        
        
        
        DispatchQueue.concurrentPerform(iterations: 5, execute: {_ in 
            bankAccount.deposit()
        })
        DispatchQueue.concurrentPerform(iterations: 4, execute: {_ in 
            bankAccount.withdrawal()
        })
//        let depositThread = Thread {
//            deposit()
//            return deposit()
//            }
//            depositThread.start()
//        
//        
//        
//        let withdrawalThread = Thread {
//            withdrawal()
//            return withdrawal()
//        }
//            withdrawalThread.start()
//        
//        
//        
//        func deposit() {
//            lock.lock()
//            bankAccount.deposit()
//            lock.unlock()
//        }
//        
//        func withdrawal() {
//            lock.lock()
//            bankAccount.withdrawal()
//            lock.unlock()
//        }
//
//        
        self.view.addSubview(label)
        label.text = "Current Balance:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -22).isActive = true
        
        self.view.addSubview(balanceLabel)
        balanceLabel.text = "\(bankAccount.balance)$"
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        balanceLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
        
        
        
        
        
    }


}

