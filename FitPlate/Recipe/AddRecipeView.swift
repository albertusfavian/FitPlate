//
//  AddRecipeView.swift
//  FitPlate
//
//  Created by Mac-albert on 04/08/23.
//

import SwiftUI

struct AddRecipeView: View {
    @StateObject private var viewModel = AddRecipeViewModel()
    
    var body: some View {
        VStack{
            VStack(spacing: 8){
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                Button {
                    //
                } label: {
                    Text("+ Add Image")
                        .font(.callout)
                        .foregroundColor(AppColor.primaryText)
                }
            }
            ScrollView{
                VStack{
                    Group{
                        VStack{
                            HStack{
                                Text("Name")
                                Spacer()
                            }
                            .font(.headline)
                            TextField("", text: $viewModel.mealName)
                                .padding(.all, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        HStack{
                            VStack{
                                HStack{
                                    Text("Waktu")
                                    Spacer()
                                }
                                .font(.headline)
                                HStack{
                                    Picker("Select an option", selection: $viewModel.selectedOption) {
                                        ForEach(viewModel.timeOptions, id: \.self) { index in
                                            Text("\(index)")
                                                .tag(index)
                                        }
                                    }
                                    .pickerStyle(.menu)
                                    .accentColor(.black)
                                    Text("Menit")
                                    Spacer()
                                }
                            }
                            VStack{
                                HStack{
                                    Text("Jumlah Porsi")
                                    Spacer()
                                }
                                .font(.headline)
                                HStack{
                                    Picker("Select an option", selection: $viewModel.selectedOption) {
                                        ForEach(1...3, id: \.self) { index in
                                            Text("\(index)")
                                                .tag(index)
                                        }
                                    }
                                    .pickerStyle(.menu)
                                    .accentColor(.black)
                                    Text("Porsi")
                                    Spacer()
                                }
                            }
                        }
                        VStack{
                            HStack{
                                Text("Keterangan")
                                Spacer()
                            }
                            .font(.headline)
                            TextField("", text: $viewModel.descriptionText)
                                .padding(.all, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                    }
                    VStack(spacing: 8){
                        VStack(spacing: 8){
                            HStack{
                                Text("Bahan (Minimal 1)")
                                Spacer()
                                Button {
        //                            Action
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.black)
                                }
                            }
                            .font(.headline)
                            ForEach(viewModel.ingredients, id: \.self) { ingredient in
                                HStack{
                                    Text(ingredient.ingredientsName)
                                    Spacer()
                                    Text(ingredient.ingredientsQuantity)
                                }
                                Divider()
                            }
                        }
                        VStack(spacing: 8){
                            HStack{
                                Text("Bahan Lainnya")
                                Spacer()
                                Button {
        //                            Action
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.black)
                                }
                            }
                            .font(.headline)
                            ForEach(viewModel.ingredients, id: \.self) { ingredient in
                                HStack{
                                    Text(ingredient.ingredientsName)
                                    Spacer()
                                }
                                Divider()
                            }
                        }
                        VStack(spacing: 8){
                            HStack{
                                Text("Peralatan (Minimal 1)")
                                Spacer()
                                Button {
        //                            Action
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.black)
                                }
                            }
                            .font(.headline)
                            ForEach(viewModel.utensils, id: \.self) { utensil in
                                HStack{
                                    Text(utensil)
                                    Spacer()
                                }
                                Divider()
                            }
                        }
                    }
                    VStack(spacing: 8){
                        VStack(spacing: 8){
                            HStack{
                                Text("Cara Memasak")
                                Spacer()
                                Button {
        //                            Action
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.black)
                                }
                            }
                            .font(.headline)
                            ForEach(viewModel.stepsCooking, id: \.self) { step in
                                HStack{
                                    Text(step)
                                    Spacer()
                                }
                                Divider()
                            }
                        }
                        VStack(spacing: 8){
                            HStack{
                                Text("Nutrition Info")
                                Spacer()
                                Button {
        //                            Action
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.black)
                                }
                            }
                            .font(.headline)
                            ForEach(viewModel.nutritionInfo, id: \.self) { nutrition in
                                HStack{
                                    Text(nutrition.nutritionName)
                                    Spacer()
                                    Text(nutrition.nutritionRate)
                                }
                                Divider()
                            }
                        }
                    }
                }
                .padding()
                .navigationTitle(Text("Add Personal Recipe"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            // Action
                        }) {
                            Text("Cancel")
                                .foregroundColor(Color.green)
                        }
                    }
                }
            }
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
