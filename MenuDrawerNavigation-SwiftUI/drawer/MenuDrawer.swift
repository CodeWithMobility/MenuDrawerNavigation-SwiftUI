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
       
            VStack(alignment: .leading, spacing: 5) {
                ProfileHeader(profileImageName: "profileimage",
                                             name: "Manu Aravind",
                                             role: "Mobile Developer")
                ForEach(0..<menuItems.prefix(7).count, id: \.self) { index in
                    NavigationItemView(
                        imageName: menuItems[index].0,
                        menuName: menuItems[index].1,
                        buttonIndex: buttonIndex
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
                    buttonIndex: buttonIndex
                ) {
                    self.buttonIndex = 7
                    withAnimation {
                        self.isToggle.toggle()
                    }
                }
            }
            .padding(.top, topSafeArea)
            .padding(.bottom, bottomSafeArea)
            
          
        
    }
    
    private func contentView(topSafeArea: CGFloat) -> some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                // Display the appropriate view based on the selected menu item
                switch buttonIndex {
                case 0: HomeScreen(isToggle: $isToggle, topSafeArea: topSafeArea)
                case 1: TasksScreen(isToggle: $isToggle, topSafeArea: topSafeArea)
                case 2: ProjectsScreen(isToggle: $isToggle, topSafeArea: topSafeArea)
                case 3: RemindersScreen(isToggle: $isToggle, topSafeArea: topSafeArea)
                case 4: CalendarScreen(isToggle: $isToggle, topSafeArea: topSafeArea)
                case 5: ProfileScreen(isToggle: $isToggle, topSafeArea: topSafeArea)
                case 6: ReportsScreen(isToggle: $isToggle, topSafeArea: topSafeArea)
                default: HomeScreen(isToggle: $isToggle, topSafeArea: topSafeArea)
                }
            }
        }
        .background(Color.white)
        .cornerRadius(25)
        .conditionalModifier(condition: 4, isToggle: isToggle)
    }
}



extension View {
    @ViewBuilder
    func conditionalModifier(condition: Int, isToggle: Bool) -> some View {
        let screenWidth = UIScreen.main.bounds.width
        let offsetValue = screenWidth / 1.7
        let animatedOffset = isToggle ? offsetValue : 0
        let animatedScale = isToggle ? 0.8 : 1.0
        let animatedRotation = isToggle ? -12.0 : 0.0
        let animatedRotationZ = isToggle ? -45.0 : 0.0
        
        // Applying modifiers conditionally based on condition value
        switch condition {
        case 1:
            self
                .scaleEffect(animatedScale)
                .rotationEffect(.degrees(animatedRotation))
                .offset(x: animatedOffset)
                .animation(.easeInOut(duration: 0.3), value: isToggle)
                .applyShadow()
            
        case 2:
            self
                .offset(x: animatedOffset, y: isToggle ? 200 : 0)
                .animation(.easeInOut(duration: 0.3), value: isToggle)
                .applyShadow()
            
        case 3:
            self
                .scaleEffect(animatedScale)
                .offset(x: animatedOffset)
                .animation(.easeInOut(duration: 0.3), value: isToggle)
                .applyShadow()
            
        case 4:
            self
                .scaleEffect(animatedScale)
                .offset(x: animatedOffset)
                .rotation3DEffect(.degrees(animatedRotationZ), // Rotate by -30 degrees when toggled
                                  axis: (x: 0, y: 1, z: 0), // Rotate along the Y-axis
                                  anchor: .trailing, // Set anchor to the right side
                                  anchorZ: 0,
                                  perspective: 0.5
                )
                .animation(.easeInOut(duration: 0.3), value: isToggle)
                .applyShadow()
            
        default:
            self
        }
    }
    
    // A custom shadow modifier
    func applyShadow() -> some View {
        //self.shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 10)
        self.shadow(color: Color.white.opacity(0.3), radius: 10, x: -10, y: 10)
    }
}
