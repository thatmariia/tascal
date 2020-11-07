//
//  CalTaskView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct CalTaskView: View {
    
    var txt: String
    
    var body: some View {
        HStack{
            Text(txt)
            Spacer()
        }
    }
}

