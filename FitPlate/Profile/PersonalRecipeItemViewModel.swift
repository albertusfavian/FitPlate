//
//  PersonalTabItemViewModel.swift
//  FitPlate
//
//  Created by Mac-albert on 03/08/23.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class PersonalRecipeViewModel: ObservableObject {
    let accadmn = Image("accadm")
    let recipeadm = Image("recipeadm")
    
    @Published var meals: [Meal] = [Meal.preview, Meal.ayamGeprek, Meal.babyPotatoAndBroccoli]
    
    private var db = Firestore.firestore()
    
    init() {
//        fetchUsers()
    }

    //Fetching users from databasaee

//    func fetchUsers() {
//        db.collection("users").addSnapshotListener { querySnapshot, error in
//            guard let documents = querySnapshot?.documents else {
//                print("Error fetching users: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//
//            self.users = documents.compactMap { document in
//                let username = document.data()["username"] as? String
//                let email = document.data()["email"] as? String
//                let id = document.documentID
//
//                return UserInfo(id: id, username: username ?? "", email: email ?? "")
//            }
//
//        }
//    }
    
    
//    func deleteUser(_ user: UserInfo) {
//        db.collection("users").document(user.id).delete { error in
//            if let error = error {
//                print("Error deleting user: \(error.localizedDescription)")
//            } else {
//                print("User deleted successfully!")
//            }
//        }
//    }
    
//    func deleteUsers(at offsets: IndexSet) {
//        let usersToDelete = offsets.map { users[$0] }
//        for user in usersToDelete {
//            deleteUser(user)
//        }
//    }
        
    func filteredSearch(searchText: String) -> [Meal] {
        if searchText.isEmpty {
            return meals
        } else {
            return meals.filter { meal in
                meal.mealName.localizedCaseInsensitiveContains(searchText) ||
                meal.mealDescription.localizedCaseInsensitiveContains(searchText) ||
                meal.mealDay.rawValue.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
        
        
}


