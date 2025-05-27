//
//  PomoTimerView.swift
//  FocusFlowApp
//
//  Created by Alejandro Birrueta on 4/11/25.
//

import SwiftUI

struct PomoTimerView: View {
    @State var timeRemaining = 60
    @State private var isRunning = false
    @State private var timer: Timer?
    @State private var focusDuration = 60 * 25
    @State private var shortBreakDuration = 60 * 5
    @State private var longBreakDuration = 60 * 15
    @State private var selectedInterval = TimerInterval.focus
    //time intervals
    enum TimerInterval: String, CaseIterable{
        case focus = "Focus"
        case shortBreak = "Short Break"
        case longBreak = "Long Break"
    }
        //duration of each interval
        private func getDuration(for interval: TimerInterval) -> Int {
                switch interval {
                case .focus:
                    return focusDuration
                case .shortBreak:
                    return shortBreakDuration
                case .longBreak:
                    return longBreakDuration
                }
            }

    var body: some View {
        Text("PomoTimer")
            .font(.title)
        Picker("Timer Interval", selection: $selectedInterval) {
                        ForEach(TimerInterval.allCases, id: \.self) { interval in
                            Text(interval.rawValue).tag(interval)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: selectedInterval) { _, newValue in
                        if !isRunning {
                            timeRemaining = getDuration(for: newValue)
                        }
                    }

            Text("\(timeString(time: timeRemaining))")
            .font(.largeTitle)
        Button(action: {
            if isRunning {
                stop()
            } else {
                start()
            }
        }) {
            Text(isRunning ? "Pause" : "Start")
                .font(.title)
                .background(isRunning ? Color.red : Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        Button("reset") {
            reset()
                    }


    }
    private func timeString(time: Int) -> String {
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            return String(format:"%02i:%02i", minutes, seconds)
        }
    private func start() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stop()
            }
        }
    }

    private func stop() {
        isRunning = false
        timer?.invalidate()
    }
    private func reset(){
        isRunning = false
        timer?.invalidate()
        timeRemaining = 0
    }
    

}

#Preview {
    PomoTimerView()
}
