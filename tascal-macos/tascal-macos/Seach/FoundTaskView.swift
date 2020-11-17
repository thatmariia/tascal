//
//  FoundTaskView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 17/11/2020.
//

import SwiftUI

struct FoundTaskView: View {
    
    @EnvironmentObject var dates: DatesSettings
    
    var task: Task
    @State var hovering = false
    
    var body: some View {
        
        Button(action: {
            dates.update_date(date: task.date_distributed)
        }, label: {
            
            HStack{
                Text(task.txt)
                    .lineLimit(1)
                
                Spacer()
                
                if hovering {
                    Divider()
                    //DividerView(editing: editing)
                    
                    Text(String(task.time) + " h")
                        .multilineTextAlignment(.trailing)
                        .frame(width: 50)
                }
            }
            .onHover { (hov) in
                hovering = hov
            }
            .modifier(TaskViewModifier(editing: false))
            
        })
        .buttonStyle(PlainButtonStyle())
        
    }
}
