//
//  CalTypeView_Days.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct CalTypeView_Days: View {
    
    @EnvironmentObject var dates: DatesSettings
    
    var body: some View {
        
        HStack {
            ForEach(0..<dates.days_dates.count) { i in
                DayBoxView(date_info: dates.days_dates_info[i])
            }
        }
        .gesture(DragGesture().onChanged({ (value) in
            dates.drag_update(on: value, with: .day)
        }))
    }
}

struct CalTypeView_Days_Previews: PreviewProvider {
    static var previews: some View {
        CalTypeView_Days()
    }
}
