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
        
        GeometryReader { geom in
            VStack {
                
                MonthTitleView()
                
                HStack {
                    
                    if geom.size.width < 600 {
                        ForEach(0..<1) { i in
                            DayBoxView(date: dates.days[i])
                            if (i != 1-1) { Spacer() }
                        }
                    } else if geom.size.width < 1000 {
                        ForEach(0..<2) { i in
                            DayBoxView(date: dates.days[i])
                            if (i != 2-1) { Spacer() }
                        }
                    } else {
                        ForEach(0..<3) { i in
                            DayBoxView(date: dates.days[i])
                            if (i != 3-1) { Spacer() }
                        }
                    }
                }
            }
        }
    }
}

