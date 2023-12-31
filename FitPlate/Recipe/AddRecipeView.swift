//
//  AddRecipeView.swift
//  FitPlate
//
//  Created by Mac-albert on 04/08/23.
//

import SwiftUI

struct AddRecipeView: View {
    @StateObject private var viewModel = AddRecipeViewModel()
    @State private var showImagePicker = false
    @State private var isSelectSourceType = false
    @State private var isFinishAddRecipe = false
    @State private var isClosedAddRecipe = false
    
    @State private var editMode = EditMode.inactive
    
    @State private var tempIngredientsName: String = ""
    @State private var tempIngredientsQuan: String = ""
    
    var body: some View {
        VStack{
            VStack(spacing: 8){
                if let image = viewModel.selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .scaledToFit()
                } else {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                Button {
                    self.isSelectSourceType = true
                } label: {
                    Text("+ Add Image")
                        .font(.callout)
                        .foregroundColor(AppColor.primaryText)
                }
                .alert(isPresented: $isSelectSourceType) {
                    Alert(title: Text("Select Source of Photo"),
                          message: Text("Choose one of 2 option Below"),
                          primaryButton: .default(Text("Camera"),
                                                  action: {
                        viewModel.selectedSourceType = .camera
                        self.showImagePicker.toggle()
                    }),
                          secondaryButton: .default(Text("Photo Library"),
                                                    action: {
                        viewModel.selectedSourceType = .photoLibrary
                        self.showImagePicker.toggle()
                    }))
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(image: self.$viewModel.selectedImage, sourceType: viewModel.selectedSourceType ?? .photoLibrary)
                }
            }
            ScrollView{
                VStack{
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
                    
                        HStack{
                            VStack{
                                HStack{
                                    Text("Waktu")
                                    Spacer()
                                }
                                .font(.headline)
                                HStack{
                                    Picker("Select an option", selection: $viewModel.selectedTimeOptions) {
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
                                    viewModel.ingredients.append(Ingredient(ingredientsName: "", ingredientsQuantity: ""))
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.black)
                                }
                            }
                            .font(.headline)
                            ForEach(viewModel.ingredients.indices, id: \.self) { index in
                                let ingredient = $viewModel.ingredients[index]

                                HStack {
                                    if index == viewModel.ingredients.count - 1 {
                                        TextField("", text: ingredient.ingredientsName)
                                            .onChange(of: ingredient.ingredientsName) { newValue in
                                                // Handle changes to ingredient name
                                            }
                                            .disableAutocorrection(true)
                                        Spacer()
                                        TextField("", text: ingredient.ingredientsQuantity)
                                            .multilineTextAlignment(.trailing)
                                            .onChange(of: ingredient.ingredientsQuantity) { newValue in
                                                // Handle changes to ingredient quantity
                                            }
                                            .disableAutocorrection(true)
                                    } else {
                                        if ingredient.ingredientsName == "" || ingredient.ingredientsQuantity == "" {
                                            TextField("", text: ingredient.ingredientsName)
                                                .onChange(of: ingredient.ingredientsName) { newValue in
                                                    // Handle changes to ingredient name
                                                }
                                                .disableAutocorrection(true)
                                            Spacer()
                                            TextField("", text: ingredient.ingredientsQuantity)
                                                .multilineTextAlignment(.trailing)
                                                .onChange(of: ingredient.ingredientsQuantity) { newValue in
                                                    // Handle changes to ingredient quantity
                                                }
                                                .disableAutocorrection(true)
                                        } else {
                                            Text(ingredient.ingredientsName)
                                            Spacer()
                                            Text(ingredient.ingredientsQuantity)
                                        }
                                    }
                                }
                                Divider()
                                .swipeActions(edge: .trailing) {
                                    Button("Edit") {
                                        // Handle edit action here
                                        if index == viewModel.ingredients.count - 1 {
                                            // Handle edit for new ingredient
                                        } else {
                                            // Handle edit for existing ingredient
                                        }
                                    }
                                }
                            }
                        }
//                        VStack(spacing: 8){
//                            HStack{
//                                Text("Bahan Lainnya")
//                                Spacer()
//                                Button {
//        //                            Action
//                                } label: {
//                                    Image(systemName: "plus")
//                                        .foregroundColor(Color.black)
//                                }
//                            }
//                            .font(.headline)
//                            ForEach(viewModel.ingredients, id: \.self) { ingredient in
//                                HStack{
//                                    Text(ingredient.ingredientsName)
//                                    Spacer()
//                                }
//                                Divider()
//                            }
//                        }
//                        VStack(spacing: 8){
//                            HStack{
//                                Text("Peralatan (Minimal 1)")
//                                Spacer()
//                                Button {
//        //                            Action
//                                } label: {
//                                    Image(systemName: "plus")
//                                        .foregroundColor(Color.black)
//                                }
//                            }
//                            .font(.headline)
//                            ForEach(viewModel.utensils, id: \.self) { utensil in
//                                HStack{
//                                    Text(utensil)
//                                    Spacer()
//                                }
//                                Divider()
//                            }
//                        }
                    }
//                    VStack(spacing: 8){
//                        VStack(spacing: 8){
//                            HStack{
//                                Text("Cara Memasak")
//                                Spacer()
//                                Button {
//        //                            Action
//                                } label: {
//                                    Image(systemName: "plus")
//                                        .foregroundColor(Color.black)
//                                }
//                            }
//                            .font(.headline)
//                            ForEach(viewModel.stepsCooking, id: \.self) { step in
//                                HStack{
//                                    Text(step)
//                                    Spacer()
//                                }
//                                Divider()
//                            }
//                        }
//                        VStack(spacing: 8){
//                            HStack{
//                                Text("Nutrition Info")
//                                Spacer()
//                                Button {
//        //                            Action
//                                } label: {
//                                    Image(systemName: "plus")
//                                        .foregroundColor(Color.black)
//                                }
//                            }
//                            .font(.headline)
//                            ForEach(viewModel.nutritionInfo, id: \.self) { nutrition in
//                                HStack{
//                                    Text(nutrition.nutritionName)
//                                    Spacer()
//                                    Text(nutrition.nutritionRate)
//                                }
//                                Divider()
//                            }
//                        }
//                    }
                    
                    ButtonView(title: "Save") {
                        isFinishAddRecipe = true
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 16)
                }
                .padding()
                .navigationTitle(Text("Add Personal Recipe"))
                .alert(isPresented: $isFinishAddRecipe, content: {
                    Alert(title: Text("Saved"),
                          message: Text("Recipe Added Successfully"),
                          dismissButton: .default(Text("OK"),
                                                  action: {
                        isClosedAddRecipe = true
                    }))
                })
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
