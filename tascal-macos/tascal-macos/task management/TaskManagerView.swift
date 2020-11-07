//
//  TaskManagerView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct TaskManagerView: View {
    var body: some View {
        HStack{
            VStack {
                Text("TASKS")
                Text("some stuff")
                Spacer()
            }
            Spacer()
        }
    }
}

struct TaskManagerView_Previews: PreviewProvider {
    static var previews: some View {
        TaskManagerView()
    }
}
