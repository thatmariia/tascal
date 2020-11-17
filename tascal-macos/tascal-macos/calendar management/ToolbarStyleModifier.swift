//
//  ToolbarStyleModifier.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 09/11/2020.
//

import SwiftUI

struct ToolbarStyleModifier: ViewModifier {
    
    var hovering: Bool = false
    
    func body(content: Content) -> some View {
        content
            /*.overlay(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(.separatorColor).opacity(hovering ? 1.0 : 0.0))
            )*/
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color(.separatorColor).opacity(hovering ? 0.0 : 1.0),
                            lineWidth: 1)
            )
            .background(Color(.separatorColor).opacity(hovering ? 1.0 : 0.0))
            .cornerRadius(5)
            
        
    }
}

