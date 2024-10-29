//
//  MenuButton.swift
//  MenuDrawerNavigation-SwiftUI
//
//  Created by Manu Aravind on 29/10/24.
//

import SwiftUI

struct NavigationItemView: View {
    
    var imageName: String
    var menuName: String
    var buttonIndex: Int
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 25) {
                Image(imageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.white)
                    .frame(width: 20, height: 20)
                   .foregroundColor(Color.white)
                Text(menuName)
                    .font(.subheadline)
                    .foregroundColor(Color.white)
            }
            .padding(.vertical, 5)
            .padding(.horizontal)
            .cornerRadius(10)
        }
    }
}
