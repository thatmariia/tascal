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

        VStack {
            MonthTitleView()
            HStack {
                ForEach(0..<dates.days.count) { i in
                    DayBoxView(date: dates.days[i])
                    if (i != dates.days.count-1) { Spacer() }
                }
            }
            .onMoveCommand(perform: { (dir) in
                dates.drag_update(on: dir, with: .day)
            })
        }
        
    }
}

struct CalTypeView_Days_Previews: PreviewProvider {
    static var previews: some View {
        CalTypeView_Days()
    }
}
