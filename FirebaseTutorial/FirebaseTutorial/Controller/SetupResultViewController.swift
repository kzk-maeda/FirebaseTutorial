//
//  SetupResultViewController.swift
//  FirebaseTutorial
//
//  Created by Kazuki Maeda on 2020/01/27.
//  Copyright © 2020 Kazuki Maeda. All rights reserved.
//

import UIKit

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
        let database = "users"
        let apiClient = APIClient()
        apiClient.selectDB(id: documentID, database: database, completion: displayUserInfo)
    }
    
    private func displayUserInfo(data : [String : Any]) {
        let apiClient = APIClient()
        userIdLabel.text = data["userId"] as? String
        firstNameLabel.text = data["firstName"] as? String
        lastNameLabel.text = data["lastName"] as? String
        emailAddrLabel.text = data["email"] as? String
        birthdayLabel.text = apiClient.timestampToString(date: data["birthday"] as! NSObject)
    }

}
