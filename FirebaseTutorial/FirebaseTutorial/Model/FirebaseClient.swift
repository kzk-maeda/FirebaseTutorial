//
//  FirebaseClient.swift
//  FirebaseTutorial
//
//  Created by Kazuki Maeda on 2020/01/29.
//  Copyright © 2020 Kazuki Maeda. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct APIClient: APIClientProtocol {
    func signin(email: String, password: String, completion: @escaping () -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                return
            }
            guard let result = result else {return}
            print(result)
            completion()
        }
    }
    
    func createUser(email: String, password: String, completion: @escaping () -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                return
            }
            guard let result = result else {return}
            print(result)
            completion()
        }
    }
    
    func twitterLogin(comlpetion: @escaping () -> Void) {
        let provider = OAuthProvider(providerID: "twitter.com")
        provider.getCredentialWith(nil) { (credential, error) in
            if error != nil {
                print(error!)
                return
            }
            guard let credential = credential else { return }
            Auth.auth().signIn(with: credential) { (result, error) in
                if error != nil {
                    print(error!)
                    return
                }
                guard let result = result else {return}
                print(result)
                // Store Access Token
                if let credential = result.credential as? OAuthCredential,
                    let accessToken = credential.accessToken,
                    let secret = credential.secret {
                    UserDefaults.standard.set(accessToken, forKey:"twitterAccessToken")
                    UserDefaults.standard.set(secret, forKey: "twitterSecret")
                }
            }
            comlpetion()
            
        }
        sleep(1)
    }

}
