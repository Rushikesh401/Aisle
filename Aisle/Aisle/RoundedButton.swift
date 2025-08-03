//
//  RoundedButton.swift
//  Aisle
//
//  Created by Rushikesh Suradkar on 04/08/25.
//

import SwiftUI

struct RoundedButton: View {
    let text : String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Continue")
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .fontWeight(.bold)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.appPrimary)
                    )
                .tint(Color.black)
                    
        }
        .padding(.vertical)
    }
}

//#Preview {
//    RoundedButton(action:Void)
//}
