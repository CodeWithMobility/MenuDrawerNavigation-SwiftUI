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
    var isHighlight: Bool
    let action: () -> Void
   

    var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: 15) {
                Image(imageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.white)
                    .frame(width: 20, height: 20)
                   .foregroundColor(Color.white)
                Text(menuName)
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            .frame(width: 165)
            .background(isHighlight ? Color.gray.opacity(0.2) : Color.clear)
            .cornerRadius(15)
        }
    }
}

