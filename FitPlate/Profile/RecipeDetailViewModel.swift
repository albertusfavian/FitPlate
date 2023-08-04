//
//  RecipeDetailViewModel.swift
//  FitPlate
//
//  Created by Mac-albert on 04/08/23.
//


import Foundation

extension RecipeDetailView {
    class RecipeDetailViewModel: ObservableObject {
        var meal: Meal
        
        init (meal: Meal) {
            self.meal = meal
        }
        
    }
}
