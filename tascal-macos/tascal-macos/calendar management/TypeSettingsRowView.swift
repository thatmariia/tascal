//
//  TypeSettingsRowView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 24/11/2020.
//

import SwiftUI

struct TypeSettingsRowView: View {
    
    @State var hovering = false
    @State var editing = false
    
    var tt: TaskType
    
    
    
    var body: some View {
        VStack {
            HStack {
                if hovering {
                    TypeActionsMenu(editing: $hovering, tt: tt)
                }
                if !editing {
                        Text(tt.txt)
                        Spacer()
                } else {
                    Text("EDITING")
                    Spacer()
                    // TODO:: edit type
                }
            
            }
            Divider()
        }
        .onHover { (hov) in
            hovering = hov
        }
    }
}
