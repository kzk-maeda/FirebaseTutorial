//
//  AuthResultViewController.swift
//  FirebaseTutorial
//
//  Created by Kazuki Maeda on 2020/01/24.
//  Copyright © 2020 Kazuki Maeda. All rights reserved.
//

import UIKit

class AuthResultViewController: UIViewController {
    
    var userId : String!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let forceUserId = userId else {
            return
        }
        messageLabel.text = "Hello \(forceUserId)! Welccome this App."
    }
    

}
