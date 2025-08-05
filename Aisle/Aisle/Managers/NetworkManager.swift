//
//  NetworkManager.swift
//  Aisle
//
//  Created by Rushikesh Suradkar on 05/08/25.
//

import Foundation

final class NetworkManager{
    static let shared = NetworkManager()
    static let baseURL = "https://app.aisle.co/V1"
    static let phoneNumberEnpoint = "/users/phone_number_login" // POST
    static let OTPEnpoint = "/users/verify_otp" // POST
    static let notesEnpoint = "/users/test_profile_list" // GET
    
    private init() {}
    
    func request<T: Decodable>(url: String,
                               httpMethod: String,
                               parameters: [String: Any]? = nil,
                               headers: [String: String]? = nil,
                               completion: @escaping (Result<T, Error>) -> Void) {
            guard let url = URL(string: url) else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0)))
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod
            
            headers?.forEach { key, value in
                request.setValue(value, forHTTPHeaderField: key)
            }
            
           
            if let parameters = parameters, httpMethod != "GET" {
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
                } catch {
                    completion(.failure(error))
                    return
                }
            }
        
        print("request> \(request) \(String(describing: headers?.values))")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "No data", code: 0)))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
                
        }.resume()
    }
}
