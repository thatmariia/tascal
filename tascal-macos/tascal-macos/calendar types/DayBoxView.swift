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
        ZStack {
            /* bg here */
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    DateButtonBoxView(date: date)
                    Divider()
                    
                    TaskLevelTxtView(txt: "Must")
                    TaskList(tasks: musttasks)
                    
                    TaskLevelTxtView(txt: "Should")
                    TaskList(tasks: shouldtasks)
                    
                    TaskLevelTxtView(txt: "Want")
                    TaskList(tasks: wanttasks)
                    
                    Spacer()
                }.padding()
            }
            
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
