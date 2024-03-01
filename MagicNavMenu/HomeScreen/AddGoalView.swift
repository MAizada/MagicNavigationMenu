import SwiftUI

struct AddGoalView: View {
    @EnvironmentObject var goalsManager: GoalsManager
    @State private var showAlert = false
    @State private var showEmptyTextAlert = false

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your goal", text: $goalsManager.newGoalText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Add Goal") {
                    if goalsManager.newGoalText.isEmpty {
                        showEmptyTextAlert = true
                    } else {
                        goalsManager.addGoal(goalsManager.newGoalText)
                        showAlert = true
                        goalsManager.newGoalText = ""
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.teal)
                .cornerRadius(20)
            }
            .padding()
            .navigationBarTitle("Add Goal")
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Goal Added"),
                    message: Text("Your goal has been added successfully."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .alert(isPresented: $showEmptyTextAlert) {
                Alert(
                    title: Text("Empty Text"),
                    message: Text("Please enter a goal before adding."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView()
            .environmentObject(GoalsManager())
    }
}
