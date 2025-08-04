//
//  ToastView.swift
//  Aisle
//
//  Created by Rushikesh Suradkar on 05/08/25.
//

import SwiftUI

struct ToastView: View {
    var toastMessage : String
    var backgroundColor : Color
    var foregroundColor : Color
    
    var body: some View {
        Text(toastMessage)
            .font(.system(size: 14, weight: .bold))
            .padding()
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(10)
        
    }
}

#Preview {
    ToastView(toastMessage: "Please try again", backgroundColor: Color.appPrimary, foregroundColor: Color.black)
}
