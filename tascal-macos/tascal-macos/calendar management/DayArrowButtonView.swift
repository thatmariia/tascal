//
//  DayArrowButtonView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 17/11/2020.
//

import SwiftUI

struct DayArrowButtonView: View {
    
    @EnvironmentObject var dates: DatesSettings
    
    var left: Bool
    
    var body: some View {
        Button(action: {
            let direction = left ? MoveCommandDirection.left : MoveCommandDirection.right
            dates.drag_update(on: direction , with: .days)
        }, label: {
            if left {
                Image(systemName: "arrowtriangle.left.circle.fill")
                    .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
            } else {
                Image(systemName: "arrowtriangle.right.circle.fill")
                    .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
            }
        })
        .buttonStyle(PlainButtonStyle())
    }
}
