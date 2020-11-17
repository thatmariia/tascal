//
//  TodayButtonView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 17/11/2020.
//

import SwiftUI

struct TodayButtonView: View {
    
    @EnvironmentObject var dates: DatesSettings
    
    @State var hovering = false
    
    var body: some View {
        Button(action: {
            dates.update_date(date: dates.today.date)
        }) {
            Text("Today")
                .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
                .modifier(ToolbarStyleModifier(hovering: hovering))
        }
        .buttonStyle(PlainButtonStyle())
        .onHover { (hov) in
            hovering = hov
        }
    }
}

struct TodayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TodayButtonView()
    }
}
