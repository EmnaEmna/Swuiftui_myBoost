//
//  TabBar.swift
//  myboost
//
//  Created by Mac-Mini-2021 on 22/03/2023.
//



import SwiftUI


struct HomeView: View {
    var body: some View{
        TabView{
            Text("Home").tabItem{
                Image(systemName: "house")
                Text("Home")
            }
            Text("Profil").tabItem{
                Image(systemName: "person")
                Text("Profil")
            }
            Text("Profil").tabItem{
                Image(systemName: "")
                Text("Profil")
            }
            
        }
    }
}

struct homeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
