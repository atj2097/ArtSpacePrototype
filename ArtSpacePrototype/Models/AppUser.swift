//
//  AppUser.swift
//  ArtSpacePrototype
//
//  Created by God on 1/21/20.
//  Copyright © 2020 God. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct AppUser {
    let userName: String?
    let email: String?
    let uid: String
    let dateCreated: Date?
    
    init(from user: User) {
        self.userName = user.displayName
        self.email = user.email
        self.uid = user.uid
        self.dateCreated = user.metadata.creationDate
    }
    
//    MARK: - Failable init
    init?(from dict: [String: Any], id: String) {
        guard let userName = dict["userName"] as? String,
        let email = dict["email"] as? String,
        let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue() else {return nil}
        self.userName = userName
        self.email = email
        self.dateCreated = dateCreated
        self.uid = id
        
    }
    
    var fieldsDict: [String:Any] {
        return ["username": self.userName ?? "", "email": self.email ?? ""]
    }
    
}

