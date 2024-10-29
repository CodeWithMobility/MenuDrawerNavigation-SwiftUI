//
//  CalendarScreen.swift
//  MenuDrawerNavigation-SwiftUI
//
//  Created by Manu Aravind on 29/10/24.
//

import SwiftUI

struct CalendarScreen: View {
    
    @Binding var isToggle: Bool
    var topSafeArea: CGFloat
    
    var body: some View {
        
        VStack {
            CommonHeaderView(isToggle: $isToggle, topSafeArea: topSafeArea, title: "Calendar")
                       Spacer()
        }.background(.white)
    }
}
