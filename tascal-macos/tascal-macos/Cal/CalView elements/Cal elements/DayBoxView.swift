//
//  DayBoxView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct DayBoxView: View {
    
    @EnvironmentObject var task_types: TaskTypesSettings
    
    var date: CalDate
    
    var body: some View {
        
        VStack {
            DateButtonBoxView(date: date)
            
            List{
                ForEach(0..<task_types.types.count) { i in
                    Section(header: TaskLevelTxtView(i: i)) {
                        TaskList(tasks: task_types.tasks[i])
                    }
                }
            }
            .onNSView(added: { nsview in
                let root = nsview.subviews[0] as! NSScrollView
                root.hasVerticalScroller = false
                root.hasHorizontalScroller = false
            })
            .modifier(DayBoxViewModifier())
            
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
