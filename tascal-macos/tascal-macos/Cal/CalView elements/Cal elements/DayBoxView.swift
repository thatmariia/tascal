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
            
            //ScrollView(.vertical, showsIndicators: false) {
            
            List{
                Section(header: TaskLevelTxtView(txt: "Must")) {
                    TaskList(tasks: musttasks)
                }
                
                Section(header: TaskLevelTxtView(txt: "Should")) {
                    TaskList(tasks: shouldtasks)
                }
                
                Section(header: TaskLevelTxtView(txt: "Want")) {
                    TaskList(tasks: wanttasks)
                }
            }
            .onNSView(added: { nsview in
                let root = nsview.subviews[0] as! NSScrollView
                root.hasVerticalScroller = false
                root.hasHorizontalScroller = false
            })
            .modifier(DayBoxViewModifier())
            /*TaskLevelTxtView(txt: "Must")
             TaskList(tasks: musttasks)
             Spacer().frame(height: 10)
             
             TaskLevelTxtView(txt: "Should")
             TaskList(tasks: shouldtasks)
             Spacer().frame(height: 10)
             
             TaskLevelTxtView(txt: "Want")
             TaskList(tasks: wanttasks)
             Spacer().frame(height: 10)*/
            
            //}.modifier(DayBoxViewModifier())
            
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
