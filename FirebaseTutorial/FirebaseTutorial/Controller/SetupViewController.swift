//
//  SetupViewController.swift
//  FirebaseTutorial
//
//  Created by Kazuki Maeda on 2020/01/26.
//  Copyright © 2020 Kazuki Maeda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class SetupViewController: UIViewController {
    
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddrTextField: UITextField!
    @IBOutlet weak var birthdayPickerField: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func submit(_ sender: Any) {
        // Prepare data string        
        let user = User(
            userId: userIdTextField.text,
            firstName: firstNameTextField.text,
            lastName: lastNameTextField.text,
            email: emailAddrTextField.text,
            birthday: birthdayPickerField.date
        )
        let database = "users"
        let apiClient = APIClient()
        let documentID = apiClient.insertDB(data: user, database: database, completion: toNextVC)
        UserDefaults.standard.set(documentID, forKey: "documentID")
        
    }
    
    private func toNextVC() {
        performSegue(withIdentifier: "setupCompleteSegue", sender: nil)
    }
    
}
