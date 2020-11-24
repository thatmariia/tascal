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
        HStack {
            if hovering && !editing {
                TypeActionsMenu(editing: $editing, tt: tt)
            }
            if !editing {
                Text(tt.txt)
                Spacer()
            } else {
                TaskTypeTextFieldView(tt: tt, edit_type: tt.txt  )
            }
        }
        .onHover { (hov) in
            hovering = hov
        }
    }
}
