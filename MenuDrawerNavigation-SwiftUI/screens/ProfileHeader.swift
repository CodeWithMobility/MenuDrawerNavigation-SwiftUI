//
//  ProfileHeader.swift
//  MenuDrawerNavigation-SwiftUI
//
//  Created by Manu Aravind on 29/10/24.
//

import SwiftUI

struct ProfileHeader: View {
    
    var profileImageName: String
    var name: String
    var role: String
    
    var body: some View {
        VStack {
            Image(profileImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(.white, lineWidth: 10)
                )
                .cornerRadius(50)
            Text(name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 10)
            
            Text(role)
                .fontWeight(.bold)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
        }
    }
}
