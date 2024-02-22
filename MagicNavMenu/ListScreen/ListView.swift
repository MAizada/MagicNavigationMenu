
import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Goal")
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
