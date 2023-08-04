//
//  AddRecipeViewModel.swift
//  FitPlate
//
//  Created by Mac-albert on 04/08/23.
//

import Foundation

class AddRecipeViewModel: ObservableObject{
    @Published var mealName = ""
    @Published var descriptionText = ""
    @Published var ingredients: [Ingredient] = [Ingredient(ingredientsName: "Tomat", ingredientsQuantity: "100gr"), Ingredient(ingredientsName: "Selada", ingredientsQuantity: "50gr")]
    @Published var utensils: [String] = ["Fork", "Knife"]
    @Published var stepsCooking: [String] = []
    @Published var nutritionInfo: [Nutrition] = [Nutrition(nutritionName: "Kalsium", nutritionRate: "100gr")]
    @Published private var selectedOption = 1
    let timeOptions = [15, 30, 45, 60]
    
    
}
