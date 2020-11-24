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
    @EnvironmentObject var tasks: TasksEnvironment
    
    var body: some View {
        HStack {
            
            Spacer()
            
            Group{

                RefreshTasksButtonView()
                
                Spacer().frame(width: 20)
                
                SideCalendarButtonView()
                
                Spacer().frame(width: 20)
                
                HStack(spacing: 0) {
                    DayArrowButtonView(left: true)
                    TodayButtonView()
                    DayArrowButtonView(left: false)
                }
                
                Spacer().frame(width: 20)
                
                SettingsView()
                
                Spacer().frame(width: 20)
                
                SearchTextFieldView()
                
                Spacer().frame(width: 20)
            }
        }

    }
}

struct CalManagerView_Previews: PreviewProvider {
    static var previews: some View {
        CalManagerView()
    }
}
