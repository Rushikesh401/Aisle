//
//  PhoneNumberViewModel.swift
//  Aisle
//
//  Created by Rushikesh Suradkar on 05/08/25.
//

import Foundation

final class PhoneNumberViewModel : ObservableObject {
    
    @Published var isValidNumber : Bool = false
    
    func verifyMobileNumber(_ phone : String) {
        let url = NetworkManager.baseURL + NetworkManager.phoneNumberEnpoint
        let params = ["number" : phone]
        
        NetworkManager.shared.request(url: url, httpMethod: "POST", parameters: params) { (result: Result<PhoneNumber, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.isValidNumber = response.status
                case .failure(let error):
                    self.isValidNumber = false
                    print(error.localizedDescription)
                }
            }
        }
    }
}


