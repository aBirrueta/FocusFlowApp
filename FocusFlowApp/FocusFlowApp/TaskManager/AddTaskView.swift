//
//  AddTaskView.swift
//  FocusFlowApp
//
//  Created by Alejandro Birrueta on 4/17/25.
//

import SwiftUI

struct AddTaskView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(height: 250)
                .cornerRadius(25)
                .padding()
                .foregroundColor(.gray)
            VStack{
                Text("Task Name")
                Text("Due Date")
                Text("priority")

            }
                
        }
    }
}

#Preview {
    AddTaskView()
}
