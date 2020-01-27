//
//  SetupResultViewController.swift
//  FirebaseTutorial
//
//  Created by Kazuki Maeda on 2020/01/27.
//  Copyright © 2020 Kazuki Maeda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class SetupResultViewController: UIViewController {

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailAddrLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    var documentId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        documentId = UserDefaults.standard.object(forKey: "documentID") as? String
        loadDocument(documentID: documentId ?? "")
        
    }
    
    private func loadDocument(documentID: String) {
        let db = Firestore.firestore()
        if documentID.isEmpty {return}
        let ref = db.collection("users").document(documentID)
        ref.getDocument(source: .default) { (document, error) in
            guard let document = document else {return}
            let data = document.data()!
            DispatchQueue.main.async {
                self.userIdLabel.text = data["userId"] as? String
                self.firstNameLabel.text = data["firstName"] as? String
                self.lastNameLabel.text = data["lastName"] as? String
                self.emailAddrLabel.text = data["email"] as? String
                self.birthdayLabel.text = self.timestampToString(timestamp: data["birthday"] as! Timestamp)
                
            }
        }
    }
    
    private func timestampToString(timestamp: Timestamp) -> String {
        let dateValue = timestamp.dateValue()
        let f = DateFormatter()
        f.locale = Locale(identifier: "ja_JP")
        f.dateStyle = .long
        f.timeStyle = .none
        return f.string(from: dateValue)
    }


}
