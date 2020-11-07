//
//  DayBoxView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct DayBoxView: View {
    
    var date: CalDate
    
    var body: some View {
        ZStack {
            /* bg here */
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    DateButtonBoxView(date: date)
                    
                    Spacer()
                    
                    Text("blahhh")
                }
            }
            
        }
    }
}
