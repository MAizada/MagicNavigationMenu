//
//  HomeView.swift
//  MagicNavMenu
//
//  Created by Aizada on 18.02.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var completionPercentage: Double = 70.0
    @State private var showProfile: Bool = false
    @State private var showAddGoal: Bool = false

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    showProfile.toggle()
                }) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.teal)
                        .padding()
                }
                Spacer()
                Button(action: {
                    showAddGoal.toggle()
                }) {
                    Text("+")
                        .font(.title)
                        .frame(width: 30, height: 30)
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding()
                }
            }

            Spacer()
            Text("My goal")
                .font(.largeTitle)
                .padding()
            ZStack {
                Circle()
                    .stroke(lineWidth: 10.0)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                Circle()
                    .trim(from: 0.0, to: CGFloat(completionPercentage / 100.0))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.teal)
                    .rotationEffect(Angle(degrees: -90))
                Text("\(Int(completionPercentage))%")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.teal)
            }
            .frame(width: 150, height: 150)
        }
        .padding()
        .sheet(isPresented: $showProfile) {
            // Место для представления профиля
            Text("Profile Screen")
        }
        .sheet(isPresented: $showAddGoal) {
            AddGoalView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
