//
//  CommonHeaderView.swift
//  MenuDrawerNavigation-SwiftUI
//
//  Created by Manu Aravind on 29/10/24.
//
import SwiftUI

struct CommonHeaderView: View {
    
    @Binding var isToggle: Bool
    var topSafeArea: CGFloat
    var title: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "line.horizontal.3")
                .resizable()
                .frame(width: 20, height: isToggle ? 20 : 20)
                .rotationEffect(.degrees(isToggle ? 90 : 0))
                .onTapGesture {
                    isToggle.toggle()
                }
            Text(title) 
                .font(.title2)
                .fontWeight(.bold)
            
            Spacer(minLength: 0)
        }
        .padding(.top, topSafeArea + 20)
        .padding(.leading, 30)
    }
}


