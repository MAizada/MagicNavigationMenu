
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
                    
                    print("Adding goal")
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



