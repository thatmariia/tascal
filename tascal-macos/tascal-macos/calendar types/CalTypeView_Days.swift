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
            ForEach(dates.days) { day in
                DayBoxView(date: day)
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
