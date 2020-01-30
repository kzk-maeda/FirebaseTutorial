//
//  APIClientProtocol.swift
//  FirebaseTutorial
//
//  Created by Kazuki Maeda on 2020/01/29.
//  Copyright © 2020 Kazuki Maeda. All rights reserved.
//

import Foundation

protocol APIClientProtocol {
    func signin(email: String, password: String,  completion: @escaping () -> Void)
    func createUser(email: String, password: String,  completion: @escaping () -> Void)
    func twitterLogin(comlpetion: @escaping () -> Void)
    func insertDB<T: Codable> (data: T, database: String, completion: @escaping () -> Void) -> String
}
