//
//  OtpVerficationView.swift
//  Aisle
//
//  Created by Rushikesh Suradkar on 04/08/25.
//

import SwiftUI

struct OtpVerficationView: View {
    var phoneNumber: String
    @Binding var path: NavigationPath
    @Environment(\.dismiss) private var dismiss
    
    @State private var otp : String = ""
    @State private var otpCharacterLimit : Int = 4
    
    var body: some View {
            VStack(alignment: .leading) {
                
                HStack(spacing: 10){
                    Text("+91 \(phoneNumber)")
                        .font(.system(size: 18, weight: .medium))
                    
                    Button{
                        dismiss()
                    } label: {
                        Image("editIcon")
                            .frame(width: 14, height: 14)
                    }
                }
                
                
                Text("Enter The \nOTP")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .multilineTextAlignment(.leading)
                
                
                TextField("", text: $otp)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 14)
                    .keyboardType(.numberPad)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .opacity(0.5)
                    )
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .frame(width: 78, height: 36)
                    .onChange(of: otp) { newValue in
                        if newValue.count > otpCharacterLimit {
                            otp = String(newValue.prefix(otpCharacterLimit))
                        }
                    }
                
                HStack(spacing: 8) {
                    RoundedButton(text: "Continue") {
                        path.append(AppRoute.notes)
                    }
                    .disabled(otp.count != otpCharacterLimit)
                    
                    TimerView()
                }
                
                Spacer()
                
            }
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
}

#Preview {
    OtpVerficationPreviewWrapper()
}

struct OtpVerficationPreviewWrapper: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        OtpVerficationView(phoneNumber: "9999999999", path: $path)
    }
}

