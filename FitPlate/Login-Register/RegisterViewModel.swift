//
//  RegisterViewModel.swift
//  FitPlate
//
//  Created by Albert Mandiri on 02/08/23.
//


import Foundation
import SwiftUI
import FirebaseAuth
import Firebase

class RegisterViewModel: ObservableObject {
    
    let authManager = AuthManager()
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    private var db = Firestore.firestore()
    
    func register() {
        
    }
    
    //TEMPLATE EMAIL FORMAT SO USERS SO THEY INSERT THE CORRECT FORMAT WHEN ENTERING THEIR EMAIL
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private var isInputValid: Bool {
        
        guard !username.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            return false
        }
        
        guard password == confirmPassword else {
            return false
        }
        
        guard isValidEmail(email) else {
                return false
            }
        
        return true
    }
}


