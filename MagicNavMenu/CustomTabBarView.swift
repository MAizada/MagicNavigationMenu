//
//  ContentView.swift
//  MagicNavMenu
//
//  Created by Aizada on 18.02.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    @State private var selection = 0
    @State private var imageOffset: CGFloat = 0
    @State private var selectionOffset: CGFloat = 0
    @State private var buttonOffset: CGFloat = 0

    enum Tab: Int, CaseIterable {
        case home, list, settings

        var imageName: String {
            switch self {
            case .home: return "house"
            case .list: return "list.bullet"
            case .settings: return "gearshape"
            }
        }

        var tabTitle: String {
            switch self {
            case .home: return "Home"
            case .list: return "List"
            case .settings: return "Settings"
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selection) {
                HomeView().tag(Tab.home.rawValue)
                ListView().tag(Tab.list.rawValue)
                SettingsView().tag(Tab.settings.rawValue)
            }
            .accentColor(.clear)
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Spacer()
                    TabItem(tab: tab, isSelected: selection == tab.rawValue) {
                        withAnimation {
                            selection = tab.rawValue
                            buttonOffset = CGFloat(tab.rawValue) * (UIScreen.main.bounds.width / CGFloat(Tab.allCases.count))
                        }
                    }
                    Spacer()
                }
            }
        }
        .background(Color.teal.cornerRadius(20))
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}

struct TabItem: View {
    let tab: CustomTabBarView.Tab
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(isSelected ? Color.blue : Color.clear)
                    .frame(width: isSelected ? 70 : 0, height: isSelected ? 70 : 0)
                    .offset(y: isSelected ? -25 : 0)

                Image(systemName: tab.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(isSelected ? .black : .black)
                    .offset(y: isSelected ? -25 : 0)
            }

            if isSelected {
                Text(tab.tabTitle)
                    .font(.caption)
                    .foregroundColor(.black)
                    .padding(.top, -30)
            }
        }
        .onTapGesture {
            action()
        }
    }
}
