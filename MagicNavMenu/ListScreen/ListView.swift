
import SwiftUI

struct ListView: View {
    @EnvironmentObject var goalsManager: GoalsManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<goalsManager.goals.count, id: \.self) { index in
                    HStack {
                        Text(goalsManager.goals[index])
                            .foregroundColor(goalsManager.isGoalCompleted[index] ? .green : .primary)
                        
                        Spacer()
                        
                        Image(systemName: goalsManager.isGoalCompleted[index] ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                goalsManager.toggleGoalCompletion(index: index)
                            }
                            .foregroundColor(goalsManager.isGoalCompleted[index] ? .green : .primary)
                    }
                    .contentShape(Rectangle())
                    .swipeActions {
                        Button(action: {
                            goalsManager.removeGoal(at: index)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationBarTitle("Goals")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(GoalsManager())
    }
}
