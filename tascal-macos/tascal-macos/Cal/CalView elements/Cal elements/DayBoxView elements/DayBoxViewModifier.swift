//
//  DayBoxViewModifier.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import Foundation
import SwiftUI

struct DayBoxViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
            content
                .padding(EdgeInsets(top: 3, leading: 20, bottom: 3, trailing: 20))
                .background(Color(NSColor.controlTextColor)).cornerRadius(10)
                .foregroundColor(Color(NSColor.controlBackgroundColor))
        }
}


