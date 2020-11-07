//
//  CalTypeView_Day.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct CalTypeView_Day: View {
    
    @EnvironmentObject var envi: AppEnvironment
    
    //let next_day = calendar.date(byAdding: .day, value: 1, to: envi.dates[i])
    
    var body: some View {
        
        ZStack {
            DayBoxView(date_info: envi.date_pick_info)
                .gesture(DragGesture().onChanged({ (value) in
                    if (value.startLocation.x > value.predictedEndLocation.x) {
                        self.envi.update_date(date: calendar.date(byAdding: .day, value: 1, to: envi.date_pick)!)
                    } else {
                        self.envi.update_date(date: calendar.date(byAdding: .day, value: -1, to: envi.date_pick)!)
                    }
                }))
        }
    }
}

struct CalTypeView_Day_Previews: PreviewProvider {
    static var previews: some View {
        CalTypeView_Day()
    }
}
