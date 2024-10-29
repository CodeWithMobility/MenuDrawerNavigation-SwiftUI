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
    var title: String
    
    var body: some View {
        VStack {
            TopHeaderView(isToggle: $isToggle, topSafeArea: topSafeArea, title: title)
                       Spacer()
        }.background(.white)
    }
}
