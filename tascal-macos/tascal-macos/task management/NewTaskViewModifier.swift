//
//  NewTaskViewModifier.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import Foundation
import SwiftUI

struct NewTaskViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
            content
                .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
                .background(Color.white.opacity(0.1)).cornerRadius(5)
        }
}


