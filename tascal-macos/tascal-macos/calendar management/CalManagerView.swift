//
//  CalManagerView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct CalManagerView: View {
    
    @EnvironmentObject var dates: DatesSettings
    
    var body: some View {
        HStack {
            CalManagerButtonView(type: CalType.year)
            CalManagerButtonView(type: CalType.week)
            CalManagerButtonView(type: CalType.days)
            CalManagerButtonView(type: CalType.day)
            
            Spacer().frame(width: 40)
            Button(action: {
                dates.update_date(date: dates.today.date)
            }) {
                Text("Today")
            }
        }.padding()
    }
}

struct CalManagerView_Previews: PreviewProvider {
    static var previews: some View {
        CalManagerView()
    }
}
