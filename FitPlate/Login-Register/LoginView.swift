//
//  LoginView.swift
//  FitPlate
//
//  Created by Albert Mandiri on 02/08/23.
//


import SwiftUI
import FirebaseAuth

struct LoginView: View {

    @StateObject private var viewModel = LoginViewModel()
    @State var visible = false
    @State private var isSecured : Bool = true
    @State var isLoginSuccess = false
    @State var isLoginAdminSucces = false

    var authManager = AuthManager()

    var body: some View {
        NavigationView {
            ZStack{
                Color(hex: "FFF9F0").edgesIgnoringSafeArea(.all)
                VStack() {
                    VStack(alignment: .leading, spacing: 15) {
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
                        HStack{
                            Text("Password")
                            Text("*")
                                .foregroundColor(Color(hex: "FE0200"))
                        }
                        .font(.system(size: 16))
                        
                        ZStack(alignment: .trailing) {
                            if isSecured {
                                SecureField("", text: $viewModel.password)
                            } else {
                                TextField("", text: $viewModel.password)
                            }
                            
                            Button(action: {
                                isSecured.toggle()
                            }) {
                                Image(systemName: isSecured ? "eye.slash" : "eye")
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
                            Spacer()
                            Button("Forgot Password?") {
//                                Action
                            }
                            .foregroundColor(Color(hex: "51925A"))
                            .padding()
                            .font(.system(size: 14))
                        }
                        
                        Button(action: {
                            viewModel.signIn { isAdmin in
                                if isAdmin {
//                                    isLoginAdminSucces = true
                                } else {
                                    isLoginSuccess = true
                                }
                            }
                        }) {
                            Text("Login")
                                .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "519259"))
                        .foregroundColor(.white)
                        .cornerRadius(50.0)
                        .padding(.bottom,15)
                        
                        Text("Don't have an Account?")
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        NavigationLink(destination: RegisterView()){
                            Text("Create Account")
                                .frame(maxWidth: .infinity, alignment:.center)
                                .font(.system(size:15))
                                .foregroundColor(Color(hex: "51925A"))
                        }
                        Spacer()
                        
//                        Navigate To MainTabConfig
                        NavigationLink(destination: MainTabConfig(), isActive: $isLoginSuccess) {
                            EmptyView()
                        }
//                        Navigate To Admin Side
//                        NavigationLink(destination: EmptyView(), isActive: $isLoginAdminSucces) {
//                            EmptyView()
//                        }
                    }
                    .navigationTitle("Login")
                    .navigationBarTitleDisplayMode(.inline)
                    .padding([.leading, .trailing], 27.5)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
