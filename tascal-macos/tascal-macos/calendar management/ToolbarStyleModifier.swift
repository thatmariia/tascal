//
//  ToolbarStyleModifier.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 09/11/2020.
//

import SwiftUI

struct ToolbarStyleModifier: ViewModifier {
    
    var is_arrow: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay(
                    RoundedRectangle(cornerRadius: is_arrow ? 100 : 5)
                    .stroke(Color(.separatorColor),
                            lineWidth: 1)
            )
    }
}

