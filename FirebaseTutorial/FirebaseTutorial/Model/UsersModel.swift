//
//  UsersModel.swift
//  FirebaseTutorial
//
//  Created by Kazuki Maeda on 2020/01/26.
//  Copyright © 2020 Kazuki Maeda. All rights reserved.
//

import Foundation

struct User : Codable {
    let userId: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let birthday: Date?
}
