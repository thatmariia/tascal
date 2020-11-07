//
//  CalView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct CalView: View {
    
    @EnvironmentObject var dates: DatesSettings
    
    var body: some View {
        ZStack {
            switch dates.cal_type {
            case .year:
                CalTypeView_Year()
            case .week:
                CalTypeView_Week()
            case .days:
                CalTypeView_Days()
            case .day:
                CalTypeView_Day()
            }
        }
    }
}

struct CalView_Previews: PreviewProvider {
    static var previews: some View {
        CalView()
    }
}
