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
            // cal type buttons
            HStack {
                CalManagerButtonView(type: CalType.year)
                CalManagerButtonView(type: CalType.days)
            }
            .modifier(ToolbarStyleModifier())
            
            Spacer().frame(width: 40)
            
            // prev day button
            Button(action: {
                dates.drag_update(on: MoveCommandDirection.left, with: .days)
            }, label: {
                Image(systemName: "arrowtriangle.left.fill")
                    .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
                    .modifier(ToolbarStyleModifier())
            })
            .buttonStyle(PlainButtonStyle())
            
            // today button
            Button(action: {
                dates.update_date(date: dates.today.date)
            }) {
                Text("Today")
                    .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
                    .modifier(ToolbarStyleModifier())
            }
            .buttonStyle(PlainButtonStyle())
            
            // next day button
            Button(action: {
                dates.drag_update(on: MoveCommandDirection.right, with: .days)
            }, label: {
                Image(systemName: "arrowtriangle.right.fill")
                    .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
                    .modifier(ToolbarStyleModifier())
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
