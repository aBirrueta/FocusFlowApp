//
//  TasksView.swift
//  FocusFlowApp
//
//  Created by Alejandro Birrueta on 4/11/25.
//

import SwiftUI

struct TasksView: View {
    @State var taskName: String = ""
    @State var showingAddTask = false
    @State private var selectedPriority: Task.Priority = .medium
    @State private var selectedDueDate: Date = Date()
    @State private var tasks: [Task] = [
    //examples
    Task(title: "clean room", isComplete: false, priority: .medium),
    Task(title: "study for test", isComplete: false, priority: .medium)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Tasks")
                    .font(.title)
    
                Button(action: {showingAddTask = true}) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                }
            }
            .padding()
            
            List {
                Section(header: Text("Tasks")) {
                    ForEach(tasks.filter { !$0.isComplete }) { task in
                        HStack {
                            // Complete Button
                            Button(action:{toggleTaskCompletion(task)}){
                                Image(systemName: task.isComplete ? "circle.fill" : "circle")
                            }
                            Text(task.title)
                            if task.dueDate != nil {
                                                        Text(task.dueDate!, style: .date)
                                                            .font(.caption)
                                                            .foregroundColor(.secondary)
                                                    }
                            Spacer()
                            
                            if task.dueDate != nil {
                                Text(task.dueDate!, style: .date)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            priorityLabel(for: task.priority)
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                deleteTask(task)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
                
                // Completed Tasks
                Section(header: Text("Completed Tasks")) {
                    ForEach(tasks.filter { $0.isComplete }) { task in
                        HStack {
                            Button(action: {
                                toggleTaskCompletion(task)
                            }) {
                                Image(systemName: "checkmark.circle")
                            }
                            Text(task.title)
                        }
                    }
                }
            }
        }        .sheet(isPresented: $showingAddTask) {
            NavigationStack {
                Form {
                    TextField("Task Name", text: $taskName)
                    
                    DatePicker(
                        "Due Date",
                        selection: $selectedDueDate,
                        displayedComponents: .date
                    )
                    
                    Picker("Priority", selection: $selectedPriority) {
                        Text("Low").tag(Task.Priority.low)
                        Text("Medium").tag(Task.Priority.medium)
                        Text("High").tag(Task.Priority.high)
                    }
                    .pickerStyle(.segmented)
                }
                .navigationTitle("Create Task")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            showingAddTask = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            addTask()
                            showingAddTask = false
                        }
                    }
                }
            }
        }
    }
    
    private func priorityLabel(for priority: Task.Priority) -> some View {
        switch priority {
        case .low:
            return Text("!").foregroundColor(.blue)
        case .medium:
            return Text("!!").foregroundColor(.orange)
        case .high:
            return Text("!!!").foregroundColor(.red)
        }
    }
    
    private func addTask() {
        guard !taskName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }
        
        // Creates new task with info put in form
        let newTask = Task(
            title: taskName,
            isComplete: false,
            dueDate: selectedDueDate,
            priority: selectedPriority
        )
        
        tasks.append(newTask)
        
        // clears form for next use
        taskName = ""
        selectedPriority = .medium
        selectedDueDate = Date()
    }
    private func toggleTaskCompletion(_ task: Task) {
            if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                tasks[index].isComplete.toggle()
            }
        }
        
        // Function to delete a task
    private func deleteTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
}
