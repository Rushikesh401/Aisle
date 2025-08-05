//
//  NotesView.swift
//  Aisle
//
//  Created by Rushikesh Suradkar on 04/08/25.
//

import SwiftUI

struct NotesView: View {
    let token : String
    
    @StateObject private var viewModel = NotesViewModel()
    
    var body: some View {
        TabView {
            
            DiscoverView()
                .tabItem {
                    Image("discover")
                    Text("Discover")
                    
                }
            
            UserProfileView(notesViewModel: viewModel)
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
        .onAppear{
            viewModel.fetchNotes(token)
        }
           
    }
}

#Preview {
    NotesView(token: "")
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
    var notesViewModel : NotesViewModel
    var body: some View {
        VStack(spacing: 8){
            Text("Notes")
                .font(.system(size: 28, weight: .bold))
            
            Text("Personal Messages to you")
                .font(.system(size: 18, weight: .medium))
            
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: notesViewModel.notes?.invites.profiles[0].photos[1].photo ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 344, height: 344)
                        .cornerRadius(20)
                } placeholder: {
                    ProgressView()
                        .frame(width: 344, height: 344)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(getNameAndAge().0) , \(getNameAndAge().1)" )
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(Color.appWhite)
                    
                    Text(notesViewModel.notes?.invites.profiles[0].generalInformation.location.full ?? "")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(Color.appWhite)
                }
                .padding()
                
            }
            
            Spacer()
            
        }
    }
    
    private func getNameAndAge() -> (String, Int){
        return (notesViewModel.notes?.invites.profiles[0].generalInformation.firstName ?? "Meena", notesViewModel.notes?.invites.profiles[0].generalInformation.age ?? 23 )
        
    }
}
