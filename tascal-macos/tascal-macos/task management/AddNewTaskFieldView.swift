//
//  AddNewTaskFieldView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct AddNewTaskFieldView: View {
    var body: some View {
        HStack {
            Text("poopie")
            Spacer()
        }
        .modifier(NewTaskViewModifier())
    }
}

struct AddNewTaskFieldView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTaskFieldView()
    }
}
