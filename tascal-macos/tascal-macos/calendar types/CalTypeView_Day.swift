//
//  CalTypeView_Day.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct CalTypeView_Day: View {
    
    @EnvironmentObject var dates: DatesSettings
    
    var body: some View {
        
        VStack {
            MonthTitleView()
            DayBoxView(date: dates.day)
                .gesture(DragGesture().onChanged({ (value) in
                    dates.drag_update(on: value, with: .day)
                }))
        }
    }
}

struct CalTypeView_Day_Previews: PreviewProvider {
    static var previews: some View {
        CalTypeView_Day()
    }
}
