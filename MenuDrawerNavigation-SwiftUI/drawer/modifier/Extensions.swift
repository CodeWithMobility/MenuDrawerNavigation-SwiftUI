//
//  Extensions.swift
//  MenuDrawerNavigation-SwiftUI
//
//  Created by Manu Aravind on 29/10/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func conditionalModifier(condition: Int, isToggle: Bool) -> some View {
        let screenWidth = UIScreen.main.bounds.width
        let offsetValue = screenWidth / 1.7
        let animatedOffset = isToggle ? offsetValue : 0
        let animatedScale = isToggle ? 0.8 : 1.0
        let animatedRotation = isToggle ? -12.0 : 0.0
        let animatedRotationZ = isToggle ? 45.0 : 0.0
        
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
                .rotation3DEffect(.degrees(animatedRotationZ),
                                  axis: (x: 0, y: 1, z: 0), // Rotate along the Y-axis
                                  anchor: .trailing, // Set anchor to the right side
                                  anchorZ: 0,
                                  perspective: 0.5
                )
                .animation(.easeInOut(duration: 0.3), value: isToggle)
                .applyShadow()
            
        case 5:
            self
                .scaleEffect(isToggle ? 0.7 : 1.0)
                .offset(x: animatedOffset)
                .rotation3DEffect(.degrees(animatedRotationZ),
                                  axis: (x: 0, y: 1, z: 0), // Rotate along the Y-axis
                                  anchor: .trailing, // Set anchor to the right side
                                  anchorZ: 0,
                                  perspective: 0.5
                )
                .animation(.easeInOut(duration: 0.3), value: isToggle)
                .applyShadow()
            
        case 6:
            self
                .offset(x: animatedOffset)
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
