//
//  SignupViewController.swift
//  FirebaseTutorial
//
//  Created by Kazuki Maeda on 2020/01/24.
//  Copyright © 2020 Kazuki Maeda. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var userIdField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    @IBAction func signup(_ sender: Any) {
        guard let userId = userIdField.text else {
            return
        }
        guard let password = passwordField.text else {
            return
        }
        let apiClient = APIClient()
        apiClient.createUser(email: userId, password: password, completion: toNextVC)
    }
    
    private func toNextVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
