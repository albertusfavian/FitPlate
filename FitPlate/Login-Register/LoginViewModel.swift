//
//  LoginViewModel.swift
//  FitPlate
//
//  Created by Albert Mandiri on 02/08/23.
//


import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class LoginViewModel: ObservableObject {
    let authManager = AuthManager()
    
    @Published var email = ""
    @Published var password = ""
    @Published var isAdmin = false
    @Published var isLoginSuccess = false
    
    func signIn(completion: @escaping (Bool) -> Void) {
        authManager.signIn(email: email, password: password) { error, isSuccess in
            if isSuccess {
                self.isLoginSuccess = true
            } else {
                print("Error when Sign In\(error?.localizedDescription)")
            }
        }
    }
}









    

