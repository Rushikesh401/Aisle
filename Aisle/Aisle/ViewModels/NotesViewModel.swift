//
//  NotesViewModel.swift
//  Aisle
//
//  Created by Rushikesh Suradkar on 05/08/25.
//

import Foundation

class NotesViewModel : ObservableObject {
    
    @Published var notes: Notes?
    
    func fetchNotes(_ authToken : String){
        let url = NetworkManager.baseURL + NetworkManager.notesEnpoint
        let headers = ["Authorization": "Bearer \(authToken)"]
        
        NetworkManager.shared.request(url: url, httpMethod: "GET", headers: headers) { (result:Result<Notes, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print("fetchNotes > Success:\(response)")
                    self.notes = response
                case .failure(let error):
                    print("fetchNotes > Error:\(error.localizedDescription)")
                }
            }
            
        }
    }
}
