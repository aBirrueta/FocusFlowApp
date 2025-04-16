//
//  TasksView.swift
//  FocusFlowApp
//
//  Created by Alejandro Birrueta on 4/11/25.
//

import SwiftUI

struct TasksView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 70
                    )
                    .background(.clear)
                    .cornerRadius(10)
                    .padding()
                HStack{
                    Button("o") {
                    
                    }
                    .foregroundStyle(.green)
                    .buttonStyle(.bordered)
                    
                    Text("Title")
                    
                    Text("urgency")
                    
                    Text("due date")
                }
            }
        }
    }
}

#Preview {
    TasksView()
}
