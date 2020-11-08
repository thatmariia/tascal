//
//  DayBoxView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct DayBoxView: View {
    
    var date: CalDate
    
    var body: some View {
        VStack {
            DateButtonBoxView(date: date)

            ScrollView(.vertical, showsIndicators: true) {
                TaskLevelTxtView(txt: "Must")
                TaskList(tasks: musttasks)
                
                TaskLevelTxtView(txt: "Should")
                TaskList(tasks: shouldtasks)
                
                TaskLevelTxtView(txt: "Want")
                TaskList(tasks: wanttasks)
            }.modifier(DayBoxViewModifier())
            Spacer()
        }.padding(EdgeInsets(top: 3, leading: 15, bottom: 3, trailing: 15))
        
        
    }
    
    fileprivate func TaskList(tasks: [String]) -> some View {
        return VStack{
            ForEach(tasks, id: \.self) {task in
                CalTaskView(txt: task)
            }
        }
    }
}
