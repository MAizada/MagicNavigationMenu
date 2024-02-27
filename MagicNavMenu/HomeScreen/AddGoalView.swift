
import SwiftUI

class GoalsManager: ObservableObject {

    @Published var newGoalText: String = ""
}

struct AddGoalView: View {
    @EnvironmentObject var goalsManager: GoalsManager

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your goal", text: $goalsManager.newGoalText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Add Goal") {
<<<<<<< Updated upstream
                    
                    print("Adding goal")
=======
                    let newGoal = "Your new goal" 
                       DispatchQueue.main.async {
                           goalsManager.addGoal(newGoal)
                           print("Adding goal")
                       }
>>>>>>> Stashed changes
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.teal)
                .cornerRadius(10)
            }
            .padding()
            .navigationBarTitle("Add Goal")
        }
    }
}

struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView()
            .environmentObject(GoalsManager())
    }
}



