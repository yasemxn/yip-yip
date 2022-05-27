//
//  SignInView.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 15.05.2022.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @EnvironmentObject var viewModel: AuthViewmodel
    
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    HStack { Spacer() }
                    
                    Text("Hello.")
                        .font(.largeTitle)
                        .bold()
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.blue)
                    
                    VStack(spacing : 40 ) {
                        CustomTextField(imageName: "envelope",
                                        placeholderText: "Email",
                                        isSecureField: false,
                                        text: $email)
                        
                        CustomTextField(imageName: "lock",
                                        placeholderText: "Password",
                                        isSecureField: true,
                                        text: $password)
                        
                    }
                    .padding([.top, .horizontal], 32)
                    
                }
                .padding(.leading)
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: Text("Reset Password"),
                                   label: {
                        Text("Forgot Password?")
                            .font(.system(size:13, weight: .semibold))
                            .padding(.top)
                            .padding(.trailing, 28)
                    })
                }
                
                Button(action: {
                    viewModel.signIn(withEmail: email, password: password)
                        
                }, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                       
                })
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
 

                Spacer()
                
                NavigationLink(
                    destination: RegistrationView()
                        .navigationBarBackButtonHidden(true),
                label: {
                    
                    HStack {
                        Text("Don't have an account?")
                            .font(.system(size:14))
                        
                        Text("Sign Up")
                            .font(.system(size: 14, weight: .semibold))
                        
                        
                    }
                    
                }) .padding(.bottom)
            }
            }
            .padding(.top, -56)
        }
    }

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

