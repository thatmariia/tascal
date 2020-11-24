//
//  TaskTypesTitleView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 24/11/2020.
//

import SwiftUI

struct TaskTypesTitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Task types").font(.system(size: 20)).fontWeight(.bold)
                Spacer()
            }
            Divider()
        }
    }
}
