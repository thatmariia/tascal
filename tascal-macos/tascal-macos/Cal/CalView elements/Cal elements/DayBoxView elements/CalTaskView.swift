//
//  CalTaskView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct CalTaskView: View {
    
    var txt: String
    @State var completed = false
    
    var body: some View {
        VStack {
            HStack {
                TaskCheckmarkView(completed: $completed)
                Text(txt)
                    .lineLimit(nil)
                
               Spacer()
            }
            Divider()
        }
    }
}

