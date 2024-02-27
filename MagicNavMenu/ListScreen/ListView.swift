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
                }
            }
            .navigationBarTitle("Goals")
            .navigationBarItems(trailing: EditButton())
        }
    }

    struct GoalRowView: View {
        @EnvironmentObject var goalsManager: GoalsManager
        var index: Int

        var body: some View {
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
        }
    }

    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
                .environmentObject(GoalsManager())
        }
    }
}
