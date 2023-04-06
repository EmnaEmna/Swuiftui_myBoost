//
//  SignUp.swift
//  myboost
//
//  Created by Mac-Mini-2021 on 14/03/2023.
//

import SwiftUI
struct SignUpScreen: View{
    var body: some View {
        NavigationView{
            SignUpScreenn()
            // .navigationTitle("aaaaa").offset(y:60)
            
            
        }
    }
    struct SignUpScreenn: View {
        struct User {
            var username: String = ""
            var password: String = ""
            var email: String = ""
            
        }
        
        
        
        @State var user: User = .init()
        @ObservedObject var Signup = SignupViewModel()
        
        var body: some View {
            ZStack {
                Color("BgColor").edgesIgnoringSafeArea(.all)
                VStack {
                    
                    VStack {
                        Spacer()
                        VStack{
                            Image("myboost_logo")
                                .resizable()
                                .frame(width: 132.0, height: 132.0)
                            
                            Text("Sign Up")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.bottom, 30)
                        }.padding(.vertical)
                        TextField("Full Name", text: $user.username)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 16)
                            .padding(.vertical)
                        TextField("Email", text: $Signup.email
                        )
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 16)
                        .padding(.vertical)
                        
                        SecureField("Password", text: $Signup.password)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        SecureField("Confirm Password", text: $Signup.confirmPw)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        
                        Button(action: submit){
                            Text("Let's get started")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .font(.title3)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("PrimaryColor"))
                                .cornerRadius(50.0)
                                .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                                .padding(.vertical)
                        }.opacity( Signup.isSignUpComplete ? 1 : 0.6)
                            .disabled(!Signup.isSignUpComplete)
                        
                        let inputtest = Signup.isSignUpComplete
                        
                        
                        
                        switch inputtest {
                        case true :
                            Text("")
                        case false :
                            Text("Invalid Email or Password")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.bottom, 30)
                        }
                        
                        
                        
                        
                        /* PrimaryButton(title: "Email me a signup link").padding(.vertical)*/
                    }
                    
                    Spacer()
                    Divider()
                    Spacer()
                    
                }
                .padding()
            }
            
        }
        func submit()
        {
            print("The user input\(Signup)")
            
        }
    }
    
    struct SignUpScreen_Previews: PreviewProvider {
        static var previews: some View {
            SignUpScreen()
        }
    }
}
