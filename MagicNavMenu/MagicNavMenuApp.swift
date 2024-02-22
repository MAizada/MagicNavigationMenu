
import SwiftUI

@main
struct MagicNavMenuApp: App {
    var body: some Scene {
        WindowGroup {
            CustomTabBarView()
                .environmentObject(GoalsManager()) 
        }
    }
}
