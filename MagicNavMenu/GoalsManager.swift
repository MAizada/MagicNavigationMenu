
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
}
