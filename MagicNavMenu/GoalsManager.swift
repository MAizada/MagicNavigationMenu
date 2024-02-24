
import SwiftUI

class GoalsManager: ObservableObject {
    @Published var newGoalText: String = ""
    @Published var goals: [String] = []
    @Published var isGoalCompleted: [Bool] = []
    
    init() {
        if let savedGoals = UserDefaults.standard.array(forKey: "savedGoals") as? [String] {
            goals = savedGoals
        }
        
        if let savedIsGoalCompleted = UserDefaults.standard.array(forKey: "savedIsGoalCompleted") as? [Bool] {
            isGoalCompleted = savedIsGoalCompleted
        }
    }
    
    func addGoal() {
        goals.append(newGoalText)
        isGoalCompleted.append(false)
        newGoalText = ""
        saveToUserDefaults()
    }
    
    func toggleGoalCompletion(index: Int) {
        isGoalCompleted[index].toggle()
        saveToUserDefaults()
    }
    
    func removeGoal(at index: Int) {
        goals.remove(at: index)
        isGoalCompleted.remove(at: index)
        saveToUserDefaults()
    }
    
    private func saveToUserDefaults() {
        UserDefaults.standard.set(goals, forKey: "savedGoals")
        UserDefaults.standard.set(isGoalCompleted, forKey: "savedIsGoalCompleted")
    }
}
