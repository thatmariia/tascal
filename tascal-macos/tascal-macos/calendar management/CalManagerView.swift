//
//  CalManagerView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct CalManagerView: View {
    
    @EnvironmentObject var dates: DatesSettings
    @EnvironmentObject var envi: AppEnvironment
    
    var body: some View {
        HStack {
            Spacer()
            
            SideCalendarButtonView()
            
            Spacer().frame(width: 40)
            
            DayArrowButtonView(left: true)
            TodayButtonView()
            DayArrowButtonView(left: false)
            
            Spacer().frame(width: 40)
            
            SearchTextFieldView()
            
            Spacer().frame(width: 20)
        }//.padding()

    }
}

struct CalManagerView_Previews: PreviewProvider {
    static var previews: some View {
        CalManagerView()
    }
}
