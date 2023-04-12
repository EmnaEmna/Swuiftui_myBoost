//
//  ProfileView.swift
//  myboost
//
//  Created by Mac2021 on 5/4/2023.
//

import SwiftUI

struct ProfileView: View {
    @State var navigationLinkIsActive = false

    var body: some View {
        NavigationView {
            ProfileViewContent()
                .navigationBarTitle(Text("Edit Profile")
                                   // , displayMode: .inline
                )
                .navigationBarBackButtonHidden(true)

                //.navigationBarTitleDisplayMode(.inline)
                //.navigationBarBackButtonHidden(true)

           

                //.foregroundColor(.red)
                .offset(y: -20)
        }
    }
}


struct EllipseShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addEllipse(in: rect)
        return path
    }
}

struct ProfileViewContent : View {
    @State private var showContent = false
    @ObservedObject var viewModel = SignupViewModel()
    
    @State private var name: String = "John Doe"
    @State private var email: String = "johndoe@example.com"
    @State private var age: String = "25"
    @State private var password: String = "password"
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var isEditingName = false
    @State private var isEditingEmail = false
    @State private var isEditingAge = false
    @State private var isEditingPassword = false
    @State private var showConfirmationAlert = false
    @State private var showAlert = false
    var body : some View {
        VStack {
            VStack(alignment: .leading, spacing: 50) {
                
                // Editable field for name
                HStack {
                    Spacer().frame(width: 5)

                    Image(systemName: "person.fill")
                        .foregroundColor(.gray)
                    if isEditingName {
                        TextField("Name", text: $name)
                    } else {
                        Text(name)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    if !isEditingName {
                        Button(action: {
                            isEditingName = true
                        }, label: {
                            Text("Edit")
                        })
                    } else {
                        Button(action: {
                            showAlert = true
                        }, label: {
                            Text("Save")
                        })
                    }
                    Spacer().frame(width: 20)

                }
                // Editable field for email
                HStack {
                    Spacer().frame(width: 5)

                    Image(systemName: "envelope.fill")
                        .foregroundColor(.gray)
                    if isEditingEmail {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                    } else {
                        Text(email)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    if !isEditingEmail {
                        Button(action: {
                            isEditingEmail = true
                        }, label: {
                            Text("Edit")
                        })
                    } else {
                        Button(action: {
                            showAlert = true
                        }, label: {
                            Text("Save")
                        })
                    }
                    Spacer().frame(width: 20)

                }
                HStack {
                    Spacer().frame(width: 15)

                    Text("Age")
                    Spacer()
                        .foregroundColor(.gray)
                    
                    if isEditingAge {
                        TextField("Age", value: $age, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    } else {
                        Text("\(age)")
                            .fontWeight(.bold)
                    }
                    Spacer()
                    if !isEditingAge {
                        Button(action: {
                            isEditingAge = true
                        }, label: {
                            Text("Edit")
                        })
                    } else {
                        Button(action: {
                            showAlert = true
                        }, label: {
                            Text("Save")
                        })
                    }
                    Spacer().frame(width: 20)

                }
                // Editable field for password
                HStack {
                    Spacer().frame(width: 5)

                    Image(systemName: "lock.fill")
                        .foregroundColor(.gray)
                    if isEditingPassword {
                        VStack(alignment: .leading, spacing: 10) {
                            SecureField("New Password", text: $newPassword)
                            SecureField("Confirm Password", text: $confirmPassword)
                        }
                    } else {
                        Text(password)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    
                    if !isEditingPassword {
                        Button(action: {
                            isEditingPassword = true
                        }, label: {
                            Text("Edit")
                        })
                    } else {
                        Button(action: {
                            if newPassword == confirmPassword {
                                password = newPassword
                            }
                            showAlert = true
                        }, label: {
                            Text("Save")
                        })
                    }
                    

                    
                }
                
                
                .padding(.horizontal)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Save changes?"),
                        primaryButton: .default(Text("Save"), action: {
                            isEditingName = false
                            isEditingEmail = false
                            isEditingAge = false
                            isEditingPassword = false
                        }),
                        secondaryButton: .cancel(Text("Cancel"))
                    )
                }
                HStack{
                    Spacer()
                    Button(action: {
                        // Add code to execute when the button is tapped
                    }) {
                        Text("LOG OUT")
                            .foregroundColor(.white)
                            .padding()
                    }
                    .background(Color.red)
                }
    
                
            }
       
              .padding(.top, 20)
            }
            .padding(.horizontal, 50)
           Spacer()
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
    
    //}
