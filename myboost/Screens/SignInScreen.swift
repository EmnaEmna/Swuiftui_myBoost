//
//  SignInScreen.swift
//  myboost
//
//  Created by Mac2021 on 13/3/2023.
//

import SwiftUI

struct SignInScreen: View {
    
    struct User {
        var username: String = ""
        var password: String = ""
        var email: String = ""
        
    }
    
    
    @ObservedObject var Signup = SignupViewModel()
    @State var user: User = .init()
    var body: some View {
        ZStack {
            Color("BgColor").edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                VStack {
                    Spacer()
                    Image("myboost_logo")
                        .resizable()
                        .frame(width: 132.0, height: 132.0)
                    Spacer()
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 30)
                    
                
                    
                    
                    TextField("Email", text: $Signup.email)
                    
                        
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 16)
                        .padding(.vertical)
                    
                    
                    
                    
                    SecureField("Password", text: $Signup.password )
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                        .padding(.vertical)
                    
                    /*TextField("Work email address", text: $user.email)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                        .padding(.vertical)
                    */
                    
                    Button(action: submit){
                            Text("Connect")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("PrimaryColor"))
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                    }
                    .opacity( Signup.isEmailValid() && Signup.isPasswordValid() ? 1 : 0.6)
                    .disabled(!Signup.isEmailValid() && !Signup.isPasswordValid())
                   
                    let inputtest = Signup.isEmailValid() && Signup.isPasswordValid()
                    
                    
                    
                    switch inputtest {
                    case true :
                        Text("")
                    case false :
                        Text("Invalid Email or Password")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.bottom, 30)
                    }
                    


                    //PrimaryButton(title: "Email me a signup //link").padding(.vertical)
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
            print("The user input\(user)")
        
        }
}


struct SignInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}


struct SocalLoginButton: View {
    var image: Image
    var text: Text
    
    var body: some View {
        HStack {
            image
                .padding(.horizontal)
            Spacer()
            text
                .font(.title2)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(50.0)
        .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
    }
}

