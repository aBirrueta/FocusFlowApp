//
//  NavigationTabView.swift
//  FocusFlowApp
//
//  Created by Alejandro Birrueta on 4/11/25.
//

import SwiftUI

struct NavigationTabView: View {
    var body: some View {
        TabView{
            Tab("PomoTimer", systemImage: "timer") {
                    PomoTimerView()
            }
            
            Tab("Tasks", systemImage: "checklist") {
                TasksView()
            }

            Tab("LifeCoach", systemImage: "person.bubble") {
                    LifeCoachView()
            }

        }
    }
}

#Preview {
    NavigationTabView()
}
