//
//  Meal.swift
//  FitPlate
//
//  Created by Albert Mandiri on 02/08/23.
//


import Foundation

class Meal: Decodable{
    var mealName: String
    var mealDescription: String
    var mealDay: Status
    var mainIngredients: [Ingredient]
    var complementaryIngredients: [Ingredient]
    var utensils: [Utensil]
    var steps: [String]
}

class Ingredient: Decodable{
    var ingredientsName: String
    var ingredientsQuantity: String
}

class Utensil: Decodable {
    var untensilName: String
}

extension Meal{
    enum Status: String, Decodable{
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
    }
}
