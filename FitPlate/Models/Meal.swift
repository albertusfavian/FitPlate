//
//  Meal.swift
//  FitPlate
//
//  Created by Albert Mandiri on 02/08/23.
//


import Foundation
import FirebaseFirestoreSwift

struct Meal: Identifiable, Codable{
    @DocumentID var id: String?
    var mealName: String
    var image: String
    var time: Int
    var mealDescription: String
    var mealDay: Status
    var mainIngredients: [Ingredient]
    var complementaryIngredients: [Ingredient]
    var utensils: [Utensil]
    var steps: [String]
    var nutrition: [Nutrition]?
}

struct Ingredient: Hashable, Codable{
    var ingredientsName: String
    var ingredientsQuantity: String
}

struct Utensil: Codable {
    var untensilName: String
}

struct Nutrition: Hashable, Codable {
    var nutritionName: String
    var nutritionRate: String
}

extension Meal{
    enum Status: String, Codable{
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
    }
}
