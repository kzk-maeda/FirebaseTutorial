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
    
    let db = Firestore.firestore()
    
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
        let encoder = Firestore.Encoder()
        do {
            let data = try encoder.encode(user)
            // Store data to Firestore
            var ref: DocumentReference? = nil
            ref = db.collection("users").addDocument(data: data, completion: { (error) in
                if error != nil {
                    print(error as Any)
                    return
                }
                self.performSegue(withIdentifier: "setupCompleteSegue", sender: nil)
            })
        } catch {
            print(error.localizedDescription)
            return
        }
        
        
    }
    
}
