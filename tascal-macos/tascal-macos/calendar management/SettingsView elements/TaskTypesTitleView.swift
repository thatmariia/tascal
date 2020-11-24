//
//  TaskTypesTitleView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 24/11/2020.
//

import SwiftUI

struct TaskTypesTitleView: View {
    var body: some View {
        HStack {
            Text("Task types").font(.system(size: 20)).fontWeight(.bold)
            Spacer()
        }
    }
}

struct TaskTypesTitleView_Previews: PreviewProvider {
    static var previews: some View {
        TaskTypesTitleView()
    }
}
