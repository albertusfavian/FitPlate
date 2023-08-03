//
//  RegisterViewModel.swift
//  FitPlate
//
//  Created by Albert Mandiri on 02/08/23.
//


import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    
    let authManager = AuthManager()
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var callbackMessage = ""
    @Published var titleMessage = ""
    
    private var db = Firestore.firestore()
    
    func register(completion: (() -> Void)? = nil) {
        if isValidEmail(email){
            authManager.registerUser(email: email, password: password, fullName: "Tono") { (result, error) in
                if let error = error {
                    self.titleMessage = "Failed"
                    self.callbackMessage = error.localizedDescription
                    completion?()
                } else {
                    self.titleMessage = "Success"
                    self.callbackMessage = "Register Successfull, Welcome \(self.username)"
                    completion?()
                }
            }
        }
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


