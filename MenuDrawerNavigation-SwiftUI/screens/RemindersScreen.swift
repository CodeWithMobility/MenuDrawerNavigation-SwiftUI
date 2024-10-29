//
//  RemindersScreen.swift
//  MenuDrawerNavigation-SwiftUI
//
//  Created by Manu Aravind on 29/10/24.
//
import SwiftUI

struct RemindersScreen: View {
    
    @Binding var isToggle: Bool
    var topSafeArea: CGFloat
    
    var body: some View {
        VStack {
            CommonHeaderView(isToggle: $isToggle, topSafeArea: topSafeArea, title: "Reminders")
                       Spacer()
        }.background(.white)
    }
}
