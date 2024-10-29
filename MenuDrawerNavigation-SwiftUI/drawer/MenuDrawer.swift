//
//  MenuDrawer.swift
//  MenuDrawerNavigation-SwiftUI
//
//  Created by Manu Aravind on 29/10/24.
//

import SwiftUI

struct MenuDrawer : View {
    
    @State private var buttonIndex = 0
    @State private var isToggle = false
    
    let bgColor = Color(red: 24 / 255, green: 32 / 255, blue: 55 / 255)
    
    let menuItems = [
        ("home", "Home"),
        ("icon_task", "Tasks"),
        ("icon_build", "Projects"),
        ("icon_reminder", "Reminders"),
        ("icon_calendar", "Calendar"),
        ("icon_profile", "Profile"),
        ("icon_report", "Reports"),
        ("icon_settings", "Settings")
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let topSafeArea = geometry.safeAreaInsets.top
            let bottomSafeArea = geometry.safeAreaInsets.bottom
            ZStack(alignment: .topLeading) {
                backgroundView(topSafeArea: topSafeArea, bottomSafeArea: bottomSafeArea)
                contentView(topSafeArea: topSafeArea)
            }
            .background(bgColor).ignoresSafeArea()
        }
    }
    
    private func backgroundView(topSafeArea: CGFloat, bottomSafeArea: CGFloat) -> some View {
        return VStack(alignment: .center, spacing: 5) {
            ProfileHeader(profileImageName: "profileimage",
                          name: "Manu Aravind",
                          role: "Mobile Developer")
            Spacer().frame(height: 10)
            ForEach(0..<menuItems.prefix(7).count, id: \.self) { index in
                NavigationItemView(
                    imageName: menuItems[index].0,
                    menuName: menuItems[index].1,
                    buttonIndex: buttonIndex,
                    isHighlight: buttonIndex == index
                ) {
                    self.buttonIndex = index
                    withAnimation {
                        self.isToggle.toggle()
                    }
                }
            }
            Spacer()
            NavigationItemView(
                imageName: menuItems[7].0,
                menuName: menuItems[7].1,
                buttonIndex: buttonIndex,
                isHighlight : false
            ) {
                self.buttonIndex = 7
                withAnimation {
                    self.isToggle.toggle()
                }
            }
        }.padding(.horizontal, 10)
            .padding(.top, topSafeArea)
            .padding(.bottom, bottomSafeArea)
    }
    
    private func contentView(topSafeArea: CGFloat) -> some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                // Display the appropriate view based on the selected menu item
                switch buttonIndex {
                case 0: HomeScreen(isToggle: $isToggle, topSafeArea: topSafeArea, title: menuItems[buttonIndex].1)
                case 1: TasksScreen(isToggle: $isToggle, topSafeArea: topSafeArea, title: menuItems[buttonIndex].1)
                case 2: ProjectsScreen(isToggle: $isToggle, topSafeArea: topSafeArea, title: menuItems[buttonIndex].1)
                case 3: RemindersScreen(isToggle: $isToggle, topSafeArea: topSafeArea, title: menuItems[buttonIndex].1)
                case 4: CalendarScreen(isToggle: $isToggle, topSafeArea: topSafeArea, title: menuItems[buttonIndex].1)
                case 5: ProfileScreen(isToggle: $isToggle, topSafeArea: topSafeArea, title: menuItems[buttonIndex].1)
                case 6: ReportsScreen(isToggle: $isToggle, topSafeArea: topSafeArea, title: menuItems[buttonIndex].1)
                default: HomeScreen(isToggle: $isToggle, topSafeArea: topSafeArea, title: menuItems[buttonIndex].1)
                }
            }
        }
        .background(Color.white)
        .cornerRadius(25)
        .conditionalModifier(condition: 1, isToggle: isToggle)
    }
}



