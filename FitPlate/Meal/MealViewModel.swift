//
//  MealViewModel.swift
//  FitPlate
//
//  Created by Albert Mandiri on 02/08/23.
//


import Foundation
import SwiftUI

class MealViewModel: ObservableObject{
    @Published var meals: [Meal]?
    @Published var choosenMealsPlan: [Meal] = []
    
    var view: MealTabItemView?
    
    init() {
        
    }
    
    func choosenMealPlanSection(geo: GeometryProxy) {
        if choosenMealsPlan == nil {
            view?.choosenMealPlanSectionNull(geo: geo)
        } else {
            EmptyView()
        }
    }
}
