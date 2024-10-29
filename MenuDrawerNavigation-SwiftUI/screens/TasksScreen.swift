//
//  TasksScreen.swift
//  MenuDrawerNavigation-SwiftUI
//
//  Created by Manu Aravind on 29/10/24.
//

import SwiftUI

struct TasksScreen: View {
    
    @Binding var isToggle: Bool
    var topSafeArea: CGFloat
    
    var body: some View {
        
        VStack {
            CommonHeaderView(isToggle: $isToggle, topSafeArea: topSafeArea, title: "Tasks")
            Spacer()
        }.background(.white)
    }
}
