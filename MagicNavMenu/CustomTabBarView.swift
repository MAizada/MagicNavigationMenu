//
//  ContentView.swift
//  MagicNavMenu
//
//  Created by Aizada on 18.02.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    @State private var selection = 0

    enum Tab: Int, CaseIterable {
        case home, profile, messages, photos, settings

        var imageName: String {
            switch self {
            case .home: return "house"
            case .profile: return "person"
            case .messages: return "message"
            case .photos: return "photo"
            case .settings: return "gearshape"
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selection) {
                HomeView().tag(Tab.home.rawValue)
                ProfileView().tag(Tab.profile.rawValue)
                MessagesView().tag(Tab.messages.rawValue)
                PhotosView().tag(Tab.photos.rawValue)
                SettingsView().tag(Tab.settings.rawValue)
            }
            .accentColor(.clear)

            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Spacer()
                    TabItem(tab: tab, isSelected: selection == tab.rawValue) {
                        withAnimation {
                            selection = tab.rawValue
                        }
                    }
                    Spacer()
                }
            }
        }
        .background(Color.white.cornerRadius(20))
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
        ZStack {
            Circle()
                .fill(isSelected ? Color.red : Color.clear)
                .frame(width: isSelected ? 60 : 0, height: isSelected ? 60 : 0)
                .offset(y: isSelected ? -20 : 0)
                .animation(.default)

            Image(systemName: tab.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(isSelected ? .black : .black)
                .padding()
        }
        .onTapGesture(perform: action)
    }
}
