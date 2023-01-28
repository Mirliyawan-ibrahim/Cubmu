//
//  CustomCornerComponent.swift
//  CubMu
//
//  Created by Mirliyawan Ibrahim on 28/01/23.
//

import SwiftUI

struct CustomCornersPage: Shape {
   
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
}
