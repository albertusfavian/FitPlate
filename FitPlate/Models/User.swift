//
//  User.swift
//  FitPlate
//
//  Created by Albert Mandiri on 02/08/23.
//


import Foundation
import FirebaseFirestoreSwift

struct User: Codable {
    @DocumentID var id: String?
    var name: String
    var password: String
    var email: String
    var accountCreated: Date?
    var time: Int?
    var frequency: Int?
    var isAdmin = false
}
