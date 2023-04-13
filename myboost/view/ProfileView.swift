//
//  ProfileView.swift
//  myboost
//
//  Created by Mac2021 on 5/4/2023.
//

import SwiftUI
/*
struct ProfileView: View {
    @ObservedObject var viewModel = UserViewModel()

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
*/

struct EllipseShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addEllipse(in: rect)
        return path
    }
}

struct ProfileView : View {
    @State private var showContent = false
    @Environment(\.presentationMode) var presentationMode // added property
    @State private var selectedImage: UIImage?
    @State private var showlogin = false
    @State private var showback = false

    @State private var isImagePickerPresented = false
    @ObservedObject var viewModel = UserViewModel()
    
    @State private var name: String = "Emna"
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
        VStack (spacing:75){
            VStack{
                Button(action: {
                    showback = true
                },
                           label: {
                Text("<- Back")
                    .font(.system(size: 20, weight: .bold))
            })
                
            }
          
            VStack {
                
                // Display the profile image
                /* Image(uiImage: viewModel.profileImage ?? UIImage(systemName: "person")!)
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: 150, height: 150)
                 .clipShape(Circle())
                 
                 // Add the ImagePicker view
                 ImagePicker(selectedImage: $viewModel.selectedImage) { image in
                 viewModel.uploadImage(image, completion:)*/
                // Display the profile image
               /* Image(uiImage: viewModel.profileImage ?? UIImage(systemName: "person")!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                
                // Add the ImagePicker view
                ImagePicker(selectedImage: Binding<UIImage>(
                    get: { viewModel.selectedImage! },
                    set: { viewModel.selectedImage = $0 }
                )) { image in
                    viewModel.uploadImage(image) { result in
                        switch result {
                        case .success(let filePath):
                            print("File uploaded to \(filePath)")
                        case .failure(let error):
                            print("Error uploading file: \(error.localizedDescription)")
                        }
                    }
                }}*/

                        }

           Image("profilee")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
                .padding(.bottom, 20)
                .onTapGesture {
                    isImagePickerPresented = true
                }
            
            VStack(alignment: .leading, spacing: 50) {
                
                // Editable field for name
                HStack {
                    Spacer().frame(width: 5)
                    
                   /* Image(systemName: "person.fill")
                        .foregroundColor(.gray)*/
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
                                .foregroundColor(.red)
                                .bold()
                        })
                    } else {
                        Button(action: {
                            viewModel.editprofile(name: self.name) { result in
                                                switch result {
                                                case .success(let token):
                                                    print("Profile updated successfully. New token: \(token)")
                                                    // Optionally update any UI elements to reflect the updated profile
                                                case .failure(let error):
                                                    print("Profile update failed: \(error.localizedDescription)")
                                                }
                                            }
                        }, label: {
                            Text("Save")
                                .foregroundColor(.red)
                                .bold()


                        })
                        .onDisappear{isEditingName=false}

                    }
                    Spacer().frame(width: 20)
                    
                }
                // Editable field for email
                /*HStack {
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
                                .foregroundColor(.red)
                                .bold()


                        })
                    } else {
                        Button(action: {
                            showAlert = true
                        }, label: {
                            Text("Save")
                                .foregroundColor(.red)
                                .bold()


                        })
                        .onDisappear{isEditingEmail=false}

                    }
                    Spacer().frame(width: 20)
                    
                }*/
             /*   HStack {
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
                                .foregroundColor(.red)
                                .bold()

                        })
                    } else {
                        Button(action: {
                            showAlert = true
                        }, label: {
                            Text("Save")
                                .foregroundColor(.red)
                                .bold()


                        })
                        .onDisappear{isEditingAge=false}

                    }
                    Spacer().frame(width: 20)
                    
                }*/
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
                                .foregroundColor(.red)
                                .bold()

                        })
                       
                    } else {
                        Button(action: {
                           if newPassword == confirmPassword {
                                password = newPassword
                               showAlert = true
                               viewModel.editpass(password: self.password) { result in
                                                   switch result {
                                                   case .success(let token):
                                                       print("Profile updated successfully. New token: \(token)")
                                                       
                                                   case .failure(let error):
                                                       print("Profile update failed: \(error.localizedDescription)")
                                                   }
                                               }
                            }
                            
                        }, label: {
                            Text("Save")
                                .foregroundColor(.red)
                                .bold()

                        })
                        .onDisappear{isEditingPassword=false}

                    }
                    
                    
                    
                }
                
                
                .padding(.horizontal)
                .alert(isPresented: $showAlert) {
                   /* Alert(
                        title: Text("Save changes?"),
                        primaryButton: .default(Text("Save"), action: {
                            isEditingName = false
                            isEditingEmail = false
                            isEditingAge = false
                            isEditingPassword = false
                            submitupdate(email: email, newname: name)
                            
                        }),
                        secondaryButton: .cancel(Text("Cancel"))
                    )*/
                    Alert(
                         title: Text("Profile Updated"),
                         message:Text("cahnges saved sucessflly! "),
                            
                         dismissButton: .default(Text("OK"), action: {
                             DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // added delay
                                                     presentationMode.wrappedValue.dismiss() // replaced navigation dismissal
                                                 }
                                             })

                         
                             
                         )
                    
                }
                HStack{
                    Spacer()
                    Button(action: {
                        let defaults = UserDefaults.standard
                                            defaults.removeObject(forKey: "token")
                        showlogin = true
                        
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
        .fullScreenCover(isPresented: $showback, content: {
                        ProfileSettigsView1()
                             })
        .fullScreenCover(isPresented: $showlogin, content: {
                        SignInScreen()
                             })
        .padding(.horizontal, 50)
        Spacer()
    }
    
    func submitupdate(email: String,newname: String){
        viewModel.updateprofil(email: email, name: newname, onSuccess: {resmeg in }, onFailure: { title,message in  }
        )
        
    }
}
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
    
    //}