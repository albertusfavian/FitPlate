//
//  LoginView.swift
//  FitPlate
//
//  Created by Albert Mandiri on 02/08/23.
//


import SwiftUI
import FirebaseAuth
import Firebase

struct LoginView: View {

    @StateObject private var viewModel = LoginViewModel()
    @State var visible = false
    @State private var isSecured : Bool=true

    var authManager = AuthManager()

    var body: some View {
        NavigationView {
            ZStack
            {
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
                        
                        ZStack(alignment: .trailing)
                        {
                            Group{
                                
                                if isSecured
                                {
                                    SecureField("", text: $viewModel.password)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: "F0BB62"), lineWidth: 1)
                                        )
                                        .autocapitalization(.none)
                                        .disableAutocorrection(true)
                                    
                                }
                                else
                                {
                                    TextField("", text: $viewModel.password)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: "F0BB62"), lineWidth: 1)
                                        )
                                        .autocapitalization(.none)
                                        .disableAutocorrection(true)
                                    
                                }
                                
                            }
                    Button(action: {
                                    isSecured.toggle()
                                }) {
                                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                        .accentColor(.gray)
                                }
                        }
                    
                        HStack
                        {
                            Spacer()
                            Button("Forgot Password?")
                            {
                                
                            }
                            .foregroundColor(Color(hex: "51925A"))
                            .padding()
                            .font(.system(size: 14))
                                            
                        }
                        
                        
                        
            Button(action: {
                        viewModel.signIn { isAdmin in
                            if isAdmin {
                                // Navigate to AdminView
                                NavigationLink(destination: EmptyView()) {
                                    EmptyView()
                                }
                            } else {
                                // Navigate to MealTabItemView
                                NavigationLink(destination: MealTabItemView()) {
                                    EmptyView()
                                }
                            }
                        }
                    }) {
                        Text("Sign in")
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
                        
                        NavigationLink(destination: RegisterView())
                        {
                            Text("Create Account")
                                .frame(maxWidth: .infinity, alignment:.center)
                                .font(.system(size:15))
                                .foregroundColor(Color(hex: "51925A"))
                        }
                        
                        Spacer()
                    }
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
