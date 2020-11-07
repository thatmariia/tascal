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
        
        HStack {
            ForEach(0..<dates.week_dates.count) { i in
                DayBoxView(date_info: dates.week_dates_info[i])
            }
        }
        .gesture(DragGesture().onChanged({ (value) in
            dates.drag_update(on: value, with: .day)
        }))
    }
}

struct CalTypeView_Week_Previews: PreviewProvider {
    static var previews: some View {
        CalTypeView_Week()
    }
}
