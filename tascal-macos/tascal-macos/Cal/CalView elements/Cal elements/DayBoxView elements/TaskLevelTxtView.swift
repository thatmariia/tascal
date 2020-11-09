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
        VStack{
        HStack {
            IconButtonView(icon_system_name: "arrow.right").opacity(0.0)

            Text(txt)
                .font(.system(size: 15)).fontWeight(.semibold)
                .foregroundColor(Color.accentColor)
            Spacer()
        }
            Divider()
        }
    }
}
