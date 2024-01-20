//
//  ViewController.swift
//  New Project
//
//  Created by Rsllwstbrk on 13.11.23.
//

import UIKit

//class BankAccount {
//    
//    var balance = 0
//    
//    func deposit () {
//        balance += 20
//    }
//    
//    func withdrawal () {
//        balance -= 10
//    }
//    
//}

class ViewController: UIViewController {
    
//    let bankAccount = BankAccount()
//    
//    
    let label = UILabel()
    let balanceLabel = UILabel()
//    
//    let lock = NSLock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var balance = 0
        
        let concurrentQueue = DispatchQueue(label: "Bank Account Balance", attributes: .concurrent)
//        concurrentQueue.async {
//            balance += 20
//        }
//        concurrentQueue.async {
//            balance -= 10
//        }
        
        
        let depositItem = DispatchWorkItem {
            balance += 20
        }
        depositItem.notify(queue: .main) {
            print ("\(balance)$")
        }
        let withdrawalItem = DispatchWorkItem {
            balance -= 10
        }
        
        concurrentQueue.async(execute: depositItem)
        concurrentQueue.async(execute: withdrawalItem)
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
        balanceLabel.text = "\(balance)$"
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        balanceLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
        
        
        
        
        
    }


}

