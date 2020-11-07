//
//  TaskLevelTxtView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct TaskLevelTxtView: View {
    
    var txt: String
    
    var body: some View {
        HStack {
            Text(txt).font(.subheadline)
            Spacer()
        }
    }
}
