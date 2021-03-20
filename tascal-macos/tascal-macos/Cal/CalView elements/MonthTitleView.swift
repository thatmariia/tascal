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
            Text(dates.day.date_info.month).font(.system(size: 30)).fontWeight(.bold)
            Text(" '" + String(dates.day.date_info.year%100)).font(.system(size: 30)).fontWeight(.regular)
            Spacer()
        }
    }
}

