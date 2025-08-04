//
//  TimerView.swift
//  Aisle
//
//  Created by Rushikesh Suradkar on 04/08/25.
//

import SwiftUI

struct TimerView: View {
    
    @State private var timeRemaining = 60
    @State private var timer: Timer? = nil
    @Binding var showToast : Bool
    
    var body: some View {
        
        Text(String(format: "00 : %02d", timeRemaining))
            .font(.title3)
            .fontWeight(.bold)
            .monospacedDigit()
            .onAppear{
                startTimer()
            }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining >= 1 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
            }
            
            if timeRemaining == 0 {showToast.toggle()}
        }
    }
}

        
       
#Preview {
    TimerView(showToast: .constant(false))
}

