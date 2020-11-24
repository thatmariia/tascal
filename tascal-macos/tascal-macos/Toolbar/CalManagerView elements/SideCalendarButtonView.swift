//
//  SideCalendarButtonView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 17/11/2020.
//

import SwiftUI

struct SideCalendarButtonView: View {
    
    @State var hovering = false
    
    var body: some View {
        Button(action: {
            toggleSidebar()
        }) {
            Image(systemName: "square.grid.2x2")
        }
        .frame(minWidth: 20)
        .buttonStyle(PlainButtonStyle())
        .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
        .modifier(ToolbarStyleModifier(hovering: hovering))
        .onHover { (hov) in
            hovering = hov
        }
    }
}

struct SideCalendarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SideCalendarButtonView()
    }
}
