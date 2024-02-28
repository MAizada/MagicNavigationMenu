import SwiftUI

struct ListView: View {
    @EnvironmentObject var goalsManager: GoalsManager
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<goalsManager.goals.count, id: \.self) { index in
                    GoalRowView(index: index)
                        .contentShape(Rectangle())
                        .contextMenu {
                            Button("Delete") {
                                goalsManager.deleteGoal(at: index)
                            }
                        }
                }
                .onDelete(perform: { indexSet in
                    goalsManager.deleteGoals(at: indexSet)
                })
            }
            .navigationBarTitle("Goals")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct GoalRowView: View {
    @EnvironmentObject var goalsManager: GoalsManager
    var index: Int
    @State private var isEditing = false
    @State private var editedText: String = ""
    
    var body: some View {
        HStack {
            if isEditing {
                TextField("Edit goal", text: $editedText, onCommit: {
                    goalsManager.updateGoal(at: index, with: editedText)
                    isEditing = false
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, 8)
            } else {
                Text(goalsManager.goals.indices.contains(index) ? goalsManager.goals[index] : "")
                    .foregroundColor(goalsManager.isGoalCompleted.indices.contains(index) ? (goalsManager.isGoalCompleted[index] ? .green : .primary) : .primary)
                    .onTapGesture {
                        editedText = goalsManager.goals.indices.contains(index) ? goalsManager.goals[index] : ""
                        isEditing = true
                    }
            }
            
            Spacer()
            
            Image(systemName: goalsManager.isGoalCompleted.indices.contains(index) ? (goalsManager.isGoalCompleted[index] ? "checkmark.circle.fill" : "circle") : "circle")
                .onTapGesture {
                    goalsManager.toggleGoalCompletion(index: index)
                }
                .foregroundColor(goalsManager.isGoalCompleted.indices.contains(index) ? (goalsManager.isGoalCompleted[index] ? .green : .primary) : .primary)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(GoalsManager())
    }
}

