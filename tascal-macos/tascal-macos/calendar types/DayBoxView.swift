//
//  DayBoxView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct DayBoxView: View {
    
    var date_info: DateInfo
    
    var body: some View {
        ZStack {
            /* bg here */
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    Text("\(date_info.weekday)")
                    Text("\(date_info.day)")
                    Text("\(date_info.month)")
                    
                    Spacer()
                    
                    Text("blahhh")
                }
            }
            
        }
    }
}
