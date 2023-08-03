//
//  AuthManager.swift
//  FitPlate
//
//  Created by Albert Mandiri on 02/08/23.
//


import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthManager {
    let auth = Auth.auth()
    let db = Firestore.firestore()

    func registerUser(email: String, password: String, fullName: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error registering user: \(error.localizedDescription)")
                completion(nil, error)
            } else if let user = result?.user {
                print("User registered successfully: \(user.email ?? "")")
                
                let userId = user.uid  // No need for guard, user.uid will be available if registration is successful
                
                let userData = User(id: userId, name: fullName, password: password, email: email, accountCreated: Date(), isAdmin: false)
                
                do {
                    try self.db.collection("users").addDocument(from: userData) { error in
                        if let error = error {
                            print("failed")
                        } else {
                            completion(result, nil)
                        }
                    }
                } catch {
                    completion(nil, error)
                }
            }
        }
    }
    
    func signIn(){
        
    }
}
