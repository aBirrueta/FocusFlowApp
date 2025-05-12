//
//  TasksView.swift
//  FocusFlowApp
//
//  Created by Alejandro Birrueta on 4/11/25.
//

import SwiftUI

struct TasksView: View {
    // Create some example tasks
    @State var taskName: String = ""
    @State var showingAddTask = false
    @State private var tasks: [Task] = [
        Task(title: "Learn SwiftUI", isComplete: false, priority: .medium),
        Task(title: "Build FocusFlowApp", isComplete: false, priority: .medium)
    ]
    
    var body: some View {
        HStack{
            Text("Tasks")
            Button("+") {
                showingAddTask = true
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
        .sheet(isPresented: $showingAddTask){
            
            Form{
                TextField("Task Name", text: $taskName )
                Text("Due Date")
                Text("priority")
            }
        }
    }
    /*
     #Preview {
     TasksView()
     }
     */
}
     
