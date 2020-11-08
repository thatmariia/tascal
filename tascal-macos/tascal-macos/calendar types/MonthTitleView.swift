//
//  MonthTitleView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import SwiftUI

struct MonthTitleView: View {
    
    @EnvironmentObject var dates: DatesSettings
    
    var body: some View {
        HStack{
            Text(dates.day.date_info.month + " '" + String(dates.day.date_info.year%100)).font(.largeTitle)
            Spacer()
        }
    }
}

struct MonthTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MonthTitleView()
    }
}
