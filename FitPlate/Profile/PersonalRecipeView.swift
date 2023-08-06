//
//  PersonalRecipeView.swift
//  FitPlate
//
//  Created by Mac-albert on 03/08/23.
//

import SwiftUI

struct PersonalRecipeView: View {
    @State private var isAddRecipeActive = false
    @State private var searchBarText = ""
    @ObservedObject private var viewModel = PersonalRecipeViewModel()

    var body: some View {
        VStack {
            HStack {
                TextField("Find Recipe", text: $searchBarText)
                    .padding(.vertical, 8)
                    .padding(.leading, 36)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading),
                        alignment: .leading
                                    )
                Button(action: {
                    searchBarText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.horizontal, 8)
                }
            }
            .padding()

//            let sortedUsers = viewModel.filteredSearch(searchText: searchBarText).sorted(by: { $0.mealName < $1.mealName })
//            let sections = Dictionary(grouping: sortedUsers) { String($0.mealName.prefix(1)).uppercased() }
            
//            List {
//                ForEach(Array(sections.keys).sorted(), id: \.self) { key in
//                    Section(header: Text(key).font(.headline)) {
//                        ForEach(sections[key]!, id: \.id) { user in
//                            UserRow(user: user)
//                        }
//                        .onDelete { indices in
//                            let user = sections[key]![indices.first!]
//                            viewModel.deleteUser(user)
//                        }
//                    }
//                }
//            }
            NavigationLink(destination: AddRecipeView(), isActive: $isAddRecipeActive) {
                EmptyView()
            }
            
            List{
                ForEach(viewModel.meals, id: \.mealName) { meal in
                    NavigationLink {
                        RecipeDetailView(meal: meal)
                    } label: {
                        HStack{
                            Image(systemName: mealSymbol(mealStatus: meal.mealDay))
                            Text(meal.mealName)
                        }
                        .foregroundColor(Color.black)
                    }

                }
            }.listStyle(.grouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddRecipeActive = true
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(Color.green)
                    }
                }
            }
        }
        .navigationTitle(Text("Personal Recipe"))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func mealSymbol(mealStatus: Meal.Status) -> String {
        if mealStatus == .breakfast {
            return "cup.and.saucer.fill"
        } else if mealStatus == .lunch {
            return "fork.knife"
        } else if mealStatus == .dinner {
            return "wineglass"
        }
        return ""
    }
}

//struct UserRow: View {
//    let user: UserInfo
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(user.username)
//                .font(.headline)
//            Text(user.email)
//                .font(.subheadline)
//        }
//    }
//}

struct searchAcc: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        Spacer()
                    }
                )

            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
        }
    }
}

struct PersonalRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalRecipeView()
    }
}
