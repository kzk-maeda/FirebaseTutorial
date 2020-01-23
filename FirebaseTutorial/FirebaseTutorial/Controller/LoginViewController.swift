//
//  LoginViewController.swift
//  FirebaseTutorial
//
//  Created by Kazuki Maeda on 2020/01/24.
//  Copyright © 2020 Kazuki Maeda. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userIdField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue" {
            guard let userId = userIdField.text else {
                return
            }
            let resultVC: AuthResultViewController = segue.destination as! AuthResultViewController
            resultVC.userId = userId
        }
    }
    
    @IBAction func login(_ sender: Any) {
        guard let userId = userIdField.text else {
            return
        }
        guard let password = passwordField.text else {
            return
        }
        Auth.auth().signIn(withEmail: userId, password: password) { (result, error) in
            guard let result = result else {return}
            print(result)
            
            self.performSegue(withIdentifier: "loginSegue", sender: userId)
        }
    }
    
}
