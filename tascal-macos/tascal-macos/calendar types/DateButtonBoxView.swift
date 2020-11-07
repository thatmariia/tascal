//
//  DateButtonBoxView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct DateButtonBoxView: View {
    
    var date_info: DateInfo
    
    var body: some View {
        VStack {
            VStack{
                Text("\(date_info.weekday)")
                Text("\(date_info.day)")
                Text("\(date_info.month)")
            }
        }
        .onTapGesture {
            // go to day
        }
    }
}

