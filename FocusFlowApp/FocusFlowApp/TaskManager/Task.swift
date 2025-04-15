//
//  Task.swift
//  FocusFlowApp
//
//  Created by Alejandro Birrueta on 4/15/25.
//

import Foundation

class Task: ObservableObject, Identifiable {
    let id = UUID()
    @Published var title: String
    @Published var isComplete: Bool
    @Published var dueDate: Date?
    @Published var priority: Priority
    
    enum Priority: String, CaseIterable {
            case low = "Low"
            case medium = "Medium"
            case high = "High"
        }
    init(title: String,
         isComplete: Bool,
         dueDate: Date? = nil,
         priority: Priority) {
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.priority = priority
    }
}
