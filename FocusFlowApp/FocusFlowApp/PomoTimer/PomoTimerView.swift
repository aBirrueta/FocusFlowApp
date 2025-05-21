//
//  PomoTimerView.swift
//  FocusFlowApp
//
//  Created by Alejandro Birrueta on 4/11/25.
//

import SwiftUI

struct PomoTimerView: View {
    @State var timeRemaining = 60
    @State var minutesRemaing = 0.0
    @State var secondsRemaing = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        Text("\(minutesRemaing)"+":"+"\(secondsRemaing)")
            .onReceive(timer) { _ in
                secondsRemaing = timeRemaining % timeRemaining
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
                if timeRemaining >= 60{
                    minutesRemaing = Double(timeRemaining/60)
                }
            }
        Text("PomoTimer!")
    }
}

#Preview {
    PomoTimerView()
}
