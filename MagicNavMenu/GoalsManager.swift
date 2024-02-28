
import SwiftUI

struct GoalList {
    var name: String
    var goals: [String]
    var isGoalCompleted: [Bool]
    var goalProgress: [Double]
}

class GoalsManager: ObservableObject {
    @Published var newGoalText: String = ""
    @Published var goals: [String] = []
    @Published var isGoalCompleted: [Bool] = []
    @Published var goalProgress: [Double] = []

    init() {
        if let savedGoals = UserDefaults.standard.array(forKey: "savedGoals") as? [String] {
            goals = savedGoals
        }

        if let savedIsGoalCompleted = UserDefaults.standard.array(forKey: "savedIsGoalCompleted") as? [Bool] {
            isGoalCompleted = savedIsGoalCompleted
        }
    }

    func addGoal(_ goal: String) {
        goals.append(goal)
        isGoalCompleted.append(false)
        goalProgress.append(0.0)
        newGoalText = ""
        saveToUserDefaults()
    }

    func toggleGoalCompletion(index: Int) {
        if index >= 0 && index < isGoalCompleted.count && index < goalProgress.count {
            isGoalCompleted[index].toggle()
            goalProgress[index] = isGoalCompleted[index] ? 100.0 : 0.0
            saveToUserDefaults()
        } else {
            print("Index is out of range.")
        }
    }

    private func saveToUserDefaults() {
        UserDefaults.standard.set(goals, forKey: "savedGoals")
        UserDefaults.standard.set(isGoalCompleted, forKey: "savedIsGoalCompleted")
    }
    
    func deleteGoal(at index: Int) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            if index >= 0 && index < self.goals.count {
                self.goals.remove(at: index)
                self.isGoalCompleted.remove(at: index)
                self.goalProgress.remove(at: index)
                self.saveToUserDefaults()
            } else {
                print("Index is out of range or array is empty.")
            }
        }
    }
    
    func deleteGoals(at indices: IndexSet) {
           goals.remove(atOffsets: indices)
           isGoalCompleted.remove(atOffsets: indices)
           goalProgress.remove(atOffsets: indices)
           saveToUserDefaults()
       }
    
    func updateGoal(at index: Int, with newText: String) {
        if index >= 0 && index < goals.count {
            goals[index] = newText
            saveToUserDefaults()
        } else {
            print("Index is out of range.")
        }
    }

}
