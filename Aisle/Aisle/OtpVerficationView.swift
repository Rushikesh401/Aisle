//
//  OtpVerficationView.swift
//  Aisle
//
//  Created by Rushikesh Suradkar on 04/08/25.
//

import SwiftUI

struct OtpVerficationView: View {
    var phoneNumber: String
    
    var body: some View {
        Text("+91 \(phoneNumber)")
    }
}

#Preview {
    OtpVerficationView(phoneNumber: "9999999999" )
}
