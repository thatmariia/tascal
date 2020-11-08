//
//  DoneEditingButtonView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import SwiftUI

struct DoneEditingButtonView: View {
    
    @Binding var editing: Bool
    
    var body: some View {
        
        Button {
            editing = false
        } label: {
            IconButtonView(icon_system_name: "pin.circle.fill")
        }
        .buttonStyle(PlainButtonStyle())
    }
}
