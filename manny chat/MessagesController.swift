//
//  ViewController.swift
//  manny chat
//
//  Created by Emmanuel Erilibe on 2/6/17.
//  Copyright © 2017 Emmanuel Erilibe. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        if FIRAuth.auth()?.currentUser?.uid == nil {
            performSelector(inBackground: #selector(handleLogout), with: nil)
            handleLogout()
        }
    }

    func handleLogout() {
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print(logoutError)
        }
    
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }

}

