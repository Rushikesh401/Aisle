//
//  OTPVerificationViewModel.swift
//  Aisle
//
//  Created by Rushikesh Suradkar on 05/08/25.
//

import Foundation

final class OTPVerificationViewModel : ObservableObject {
    @Published var isOTPValid: Bool = false
    @Published var token: String? = nil
    
    func verifyOTP(_ number : String, _ otp : String, completion: @escaping (Bool)-> Void){
        let url = NetworkManager.baseURL + NetworkManager.OTPEnpoint
        let params = ["number" : number, "otp" : otp]
        
        NetworkManager.shared.request(url: url, httpMethod: "POST", parameters: params) {  (result : Result<OTPResponse,Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.token = response.token
                    self.isOTPValid = true
                    completion(true)
                case .failure(let error):
                    self.isOTPValid = false
                    self.token = nil
                    completion(false)
                    print("OTP verification error: \(error.localizedDescription)")
                }
            }
        }
    }
}
 
