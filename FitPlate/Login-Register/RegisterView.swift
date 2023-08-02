//
//  RegisterView.swift
//  FitPlate
//
//  Created by Albert Mandiri on 02/08/23.
//


import SwiftUI
import Firebase
import FirebaseAuth

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    @State private var isPasswordSecured = true
    @State private var isConfirmPasswordSecured = true

    var body: some View {
        NavigationView{
            ZStack {
                Color(hex: "FFF9F0").edgesIgnoringSafeArea(.all)
                VStack {
                    VStack(alignment: .leading, spacing: 15) {
                        Group {
                            HStack{
                                Text("Full Name")
                                Text("*")
                                    .foregroundColor(Color(hex: "FE0200"))
                            }
                                .font(.system(size: 16))

                            TextField("", text: $viewModel.username)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(hex: "F0BB62"), lineWidth: 1)
                                )
                                .autocapitalization(.none)
                                .disableAutocorrection(true)

                            HStack{
                                Text("Email")
                                Text("*")
                                    .foregroundColor(Color(hex: "FE0200"))
                            }
                                .font(.system(size: 16))

                            TextField("", text: $viewModel.email)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(hex: "F0BB62"), lineWidth: 1)
                                )
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }

                        Group {
                            HStack{
                                Text("Password")
                                Text("*")
                                    .foregroundColor(Color(hex: "FE0200"))
                            }
                                .font(.system(size: 16))

                            ZStack(alignment: .trailing) {
                                if isPasswordSecured {
                                    SecureField("", text: $viewModel.password)
                                } else {
                                    TextField("", text: $viewModel.password)
                                }

                                Button(action: {
                                    isPasswordSecured.toggle()
                                }) {
                                    Image(systemName: isPasswordSecured ? "eye.slash" : "eye")
                                        .accentColor(.gray)
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(hex: "F0BB62"), lineWidth: 1)
                            )
                            .autocapitalization(.none)
                            .disableAutocorrection(true)

                            HStack{
                                Text("Confirm Password")
                                Text("*")
                                    .foregroundColor(Color(hex: "FE0200"))
                            }
                                .font(.system(size: 16))

                            ZStack(alignment: .trailing) {
                                if isConfirmPasswordSecured {
                                    SecureField("", text: $viewModel.confirmPassword)
                                } else {
                                    TextField("", text: $viewModel.confirmPassword)
                                }

                                Button(action: {
                                    isConfirmPasswordSecured.toggle()
                                }) {
                                    Image(systemName: isConfirmPasswordSecured ? "eye.slash" : "eye")
                                        .accentColor(.gray)
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(hex: "F0BB62"), lineWidth: 1)
                            )
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        }
                    }
                    Spacer()
                    Button(action: {
                        viewModel.register()
                    }) {
                        Text("Register")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "519259"))
                    .foregroundColor(.white)
                    .cornerRadius(10.0)
                    .padding(.bottom, 15)
                }
                .padding([.leading, .trailing], 27.5)
            }
            .navigationTitle("Register")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

    
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
