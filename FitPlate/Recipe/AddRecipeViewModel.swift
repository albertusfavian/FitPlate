//
//  AddRecipeViewModel.swift
//  FitPlate
//
//  Created by Mac-albert on 04/08/23.
//

import Foundation
import UIKit

class AddRecipeViewModel: ObservableObject{
    @Published var mealName = ""
    @Published var descriptionText = ""
    @Published var ingredients: [Ingredient] = [Ingredient(ingredientsName: "Tomat", ingredientsQuantity: "100gr"), Ingredient(ingredientsName: "Selada", ingredientsQuantity: "50gr")]
    @Published var utensils: [String] = ["Fork", "Knife"]
    @Published var stepsCooking: [String] = ["lalalalalallalalalalallalalala1",
                                             "lalalalalallalalalalallalalala2",
                                             "lalalalalallalalalalallalalala3",
                                             "lalalalalallalalalalallalalala4"
    ]
    @Published var nutritionInfo: [Nutrition] = [Nutrition(nutritionName: "Kalsium", nutritionRate: "100gr")]
    @Published var selectedOption = 1
    @Published var selectedTimeOptions = 15
    let timeOptions = [15, 30, 45, 60]
    
    @Published var selectedImage: UIImage?
    @Published var selectedSourceType: UIImagePickerController.SourceType?
    
    
}
