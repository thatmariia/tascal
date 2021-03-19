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
                if hovering && !editing && !(tt.txt == "Others") {
                    TypeActionsMenu(editing: $editing, tt: tt)
                }
                if !editing {
                    Text(tt.txt)
                    Spacer()
                } else {
                    TaskTypeTextFieldView(tt: tt, edit_type: tt.txt)
                }
            }
            // TODO:: why on earth doesnt it keep the height
            .frame(height: 20)
            Divider()
        }
        .onHover { (hov) in
            hovering = hov
        }
    }
}
