//
//  ProfileSettigsView.swift
//  myboost
//
//  Created by Mac2021 on 5/4/2023.
//

import SwiftUI

struct ProfileSettigsView: View {
    struct User {
        var username: String = "Emna"
        var password: String = ""
        var email: String = "emna@esprit.tn"
        
    }
    @State var user: User = .init()
    var body: some View {
        ZStack {
            Color("BgColor").edgesIgnoringSafeArea(.all)
            VStack {
                
                VStack {
                   
                    VStack{
                        Image("userimage")
                            .resizable()
                            .frame(width: 130.0, height: 130.0)
                        
                        Text("Edit My Profile")
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
                   
                    TextField("e-mail", text: $user.email)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 16)
                        .padding(.vertical)
                    
                    
                    /* PrimaryButton(title: "Email me a signup link").padding(.vertical)*/
                }
                
                Spacer()
                Divider()
                Spacer()
                
            }
            .padding()
        }
    }
}

struct ProfileSettigsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettigsView()
    }
}
