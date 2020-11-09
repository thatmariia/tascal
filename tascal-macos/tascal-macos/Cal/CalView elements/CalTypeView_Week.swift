//
//  CalTypeView_Week.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct CalTypeView_Week: View {
    
    @EnvironmentObject var dates: DatesSettings
    
    var body: some View {

        VStack {
            MonthTitleView()
            HStack {
                ForEach(0..<dates.week.count) { i in
                    DayBoxView(date: dates.week[i])
                    if (i != dates.week.count-1) { Spacer() }
                }
            }
            .gesture(DragGesture().onChanged({ (value) in
                //TODO:: drag slower, do a carousel
                dates.drag_update(on: value, with: .day)
            }))
        }
        
    }
}

struct CalTypeView_Week_Previews: PreviewProvider {
    static var previews: some View {
        CalTypeView_Week()
    }
}
