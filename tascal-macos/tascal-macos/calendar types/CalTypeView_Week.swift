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
            Divider()
            ForEach(dates.week) { day in
                DayBoxView(date: day)
                Divider()
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .gesture(DragGesture().onChanged({ (value) in
            //TODO:: figure out why it doesnt drag properly
            dates.drag_update(on: value, with: .day)
        }))
    }
}

struct CalTypeView_Week_Previews: PreviewProvider {
    static var previews: some View {
        CalTypeView_Week()
    }
}
