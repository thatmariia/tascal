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
            // cal type buttons
            HStack {
                CalManagerButtonView(type: CalType.year)
                CalManagerButtonView(type: CalType.days)
            }
            //.frame(minWidth: 40)
            .modifier(ToolbarStyleModifier(is_arrow: false))
            
            Spacer().frame(width: 40)
            
            // prev day button
            Button(action: {
                dates.drag_update(on: MoveCommandDirection.left, with: .days)
            }, label: {
                Image(systemName: "arrowtriangle.left.circle.fill")
                    .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
                    //.modifier(ToolbarStyleModifier(is_arrow: true))
            })
            .buttonStyle(PlainButtonStyle())
            
            // today button
            Button(action: {
                dates.update_date(date: dates.today.date)
            }) {
                Text("Today")
                    .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
                    .modifier(ToolbarStyleModifier(is_arrow: false))
            }
            .buttonStyle(PlainButtonStyle())
            //.frame(minWidth: 100)
            
            // next day button
            Button(action: {
                dates.drag_update(on: MoveCommandDirection.right, with: .days)
            }, label: {
                Image(systemName: "arrowtriangle.right.circle.fill")
                    .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
                    //.modifier(ToolbarStyleModifier(is_arrow: true))
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer().frame(width: 40)
            
            // search field
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
