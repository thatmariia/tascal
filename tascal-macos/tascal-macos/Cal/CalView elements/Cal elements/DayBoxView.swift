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

            ScrollView(.vertical, showsIndicators: false) {
                TaskLevelTxtView(txt: "Must")
                TaskList(tasks: musttasks)
                Spacer().frame(height: 10)
                
                TaskLevelTxtView(txt: "Should")
                TaskList(tasks: shouldtasks)
                Spacer().frame(height: 10)
                
                TaskLevelTxtView(txt: "Want")
                TaskList(tasks: wanttasks)
                Spacer().frame(height: 10)
            }.modifier(DayBoxViewModifier())
            
            Spacer()
        }
        
        
    }
    
    fileprivate func TaskList(tasks: [String]) -> some View {
        return VStack{
            ForEach(tasks, id: \.self) {task in
                CalTaskView(txt: task)
                
            }
        }
    }
}
