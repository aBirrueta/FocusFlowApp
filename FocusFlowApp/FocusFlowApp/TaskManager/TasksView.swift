//
//  TasksView.swift
//  FocusFlowApp
//
//  Created by Alejandro Birrueta on 4/11/25.
//

import SwiftUI

struct TasksView: View {
    // Create some example tasks
        @State private var tasks: [Task] = [
            Task(title: "Learn SwiftUI", isComplete: false, priority: .medium),
            Task(title: "Build FocusFlowApp", isComplete: false, priority: .medium)
        ]
        
        var body: some View {
            HStack{
                Text("Tasks")
                Button("+") {
                    AddTaskView()
                }
                .buttonStyle(.bordered)
                
            }
            NavigationStack {
                List {
                    ForEach(tasks) { task in
                        HStack{
                            Text(task.title)
                            if task.priority == .medium{
                                Text("!!")
                            }
                            if task.priority == .high{
                                Text("!!!")
                            }
                            if task.priority == .low{
                                Text("!")
                            }
                        }
                    }
                }
            }
        }
}

#Preview {
    TasksView()
}
