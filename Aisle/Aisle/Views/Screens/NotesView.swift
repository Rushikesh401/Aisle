//
//  NotesView.swift
//  Aisle
//
//  Created by Rushikesh Suradkar on 04/08/25.
//

import SwiftUI

struct NotesView: View {
    var body: some View {
        TabView {
            
            DiscoverView()
                .tabItem {
                    Image("discover")
                    Text("Discover")
                    
                }
            
            UserProfileView()
                .tabItem {
                    Image("inbox")
                    Text("Notes")
                }
            
            
            ChatView()
                .tabItem {
                    Image("chat")
                    Text("Matches")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                    
                }
            
        }
        .accentColor(Color.black)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NotesView()
}

struct ChatView : View {
    var body: some View {
        Text("ChatView")
    }
}

struct ProfileView : View {
    var body: some View {
        Text("ProfileView")
    }
}

struct DiscoverView : View {
    var body: some View {
        Text("DiscoverView")
    }
}

struct UserProfileView : View {
    var body: some View {
        VStack(spacing: 8){
            Text("Notes")
                .font(.system(size: 28, weight: .bold))
            
            Text("Personal Messages to you")
                .font(.system(size: 18, weight: .medium))
            
            ZStack(alignment: .bottomLeading) {
                Image("profile")
                    .frame(width: 344, height: 344)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Meena, 23")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(Color.appWhite)
                    
                    Text("Tap to reviwe 50+ notes")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(Color.appWhite)
                }
                .padding()
                
            }
            
            Spacer()
            
        }
    }
}
