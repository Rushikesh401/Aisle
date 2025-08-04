//
//  PhoneNumberView.swift
//  Aisle
//
//  Created by Rushikesh Suradkar on 04/08/25.
//

import SwiftUI

struct PhoneNumberView: View {
    
    @State private var countryCode: String = "+91"
    @State private var phoneNumber : String = ""
    @State private var characterLimit : Int = 10
    @State private var path = NavigationPath()
    
    @StateObject private var vm = PhoneNumberViewModel()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment : .leading, spacing: 10) {
                Text("Get OTP")
                
                Text("Enter Your \nPhone Number")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                phoneNumberInputField
                
                RoundedButton(text: "Continue") {
                    vm.verifyMobileNumber(countryCode+phoneNumber)
                }
                .disabled(phoneNumber.count != characterLimit)
                
            }
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                    case .otpVerification(let phoneNumber):
                    OtpVerficationView(phoneNumber: countryCode+phoneNumber, path: $path)
                    
                case .notes:
                    NotesView()
                }
            }.onChange(of: vm.isValidNumber) { newValue in
                if newValue {path.append(AppRoute.otpVerification(phoneNumber: phoneNumber))}
            }

            
            Spacer()
        }
    }
    
    private var phoneNumberInputField : some View {
        HStack {
            
            Button {
                //action
            } label: {
                Text(countryCode)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
                    .fontWeight(.bold)
                    .tint(.primary)
            }
            
            TextField("", text: $phoneNumber)
                .padding(.vertical, 10)
                .padding(.horizontal, 14)
                .keyboardType(.numberPad)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
                .fontWeight(.bold)
                .onChange(of: phoneNumber) { newValue in
                    handlePhoneNumberExceededLimit(newValue)
                }
        }
        
    }
    
    private func handlePhoneNumberExceededLimit(_ updatedPhoneNumber: String) {
        if updatedPhoneNumber.count > characterLimit {
            phoneNumber = String(updatedPhoneNumber.prefix(characterLimit))
        }
    }
}


#Preview {
    PhoneNumberView()
}
