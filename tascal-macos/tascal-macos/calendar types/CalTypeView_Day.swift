//
//  CalTypeView_Day.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct CalTypeView_Day: View {
    
    @EnvironmentObject var envi: AppEnvironment
    
    var body: some View {
        
        ZStack {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    //TODO:: make just 7? days and detect action? // scrollViewDidScroll
                    ForEach(envi.dates_info) { date_info in
                        HStack {
                            DayBoxView(date_info: date_info)
                        }
                    }
                }
            }
        }
        
    }
}

struct CalTypeView_Day_Previews: PreviewProvider {
    static var previews: some View {
        CalTypeView_Day()
    }
}
