//
//  HomeScreen.swift
//  MenuDrawerNavigation-SwiftUI
//
//  Created by Manu Aravind on 29/10/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @Binding var isToggle: Bool
    var topSafeArea: CGFloat
    
    var body: some View {
        VStack {
            CommonHeaderView(isToggle: $isToggle, topSafeArea: topSafeArea, title: "Home")
            Spacer()
        }.background(.white)
    }
}
