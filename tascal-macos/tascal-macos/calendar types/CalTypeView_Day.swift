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
        Text("\(DateInfo(date: envi.date_pick).weekday)")
    }
}

struct CalTypeView_Day_Previews: PreviewProvider {
    static var previews: some View {
        CalTypeView_Day()
    }
}
