//
//  ProfileSettigsView.swift
//  myboost
//
//  Created by Mac2021 on 5/4/2023.
//

import SwiftUI

struct ProfileSettigsView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                    ProfileSeViewContent()
                   //     .navigationTitle("")
                }

               .navigationBarItems(trailing:
                    NavigationLink(destination: ProfileView()) {
                        Text("Edit")
                            .font(.system(size: 20, weight: .bold))
                    }

                )
            }

        }
        
    }
    
    struct ProfileSeViewContent : View { struct User {
        var username: String = "Emna"
        var password: String = ""
        var email: String = "emna@esprit.tn"
        var age: String = "25"

        
    }
        //settings
        //logout
        //edit image
        @State var user: User = .init()
        var body : some View {
            
            ZStack {
                Color("BgColor").edgesIgnoringSafeArea(.all)
                VStack {
                    
                    VStack {
                        
                        VStack{
                            Image("userimage")
                                .resizable()
                                .frame(width: 130.0, height: 130.0)
                            
                            Text(" My Profile")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.bottom, 10)
                            
                            
                        }.padding(.vertical)
                        Text(user.username)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 16)
                            .padding(.vertical)

                        
                        Text( user.email)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 16)
                            .padding(.vertical)
                        
                        Text( "Age: " + user.age + "  ans")
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 16)
                            .padding(.vertical)
                        
                        Text("Password:    " + "**********")
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
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
    
