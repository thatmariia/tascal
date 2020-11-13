//
//  DayBoxView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct DayBoxView: View {
    
    @EnvironmentObject var task_types: TaskTypesSettings
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: CloudKitTask.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \CloudKitTask.is_completed, ascending: true)]) var all_tasks: FetchedResults<CloudKitTask>
    
    var date: CalDate
    
    var tasks: [CloudKitTask] {
        all_tasks.filter{ calendar.isDate($0.date_distributed ?? Date(), inSameDayAs: date.date) }
    }
    
    var body: some View {
        
        VStack {
            DateButtonBoxView(date: date)
            
            List{
                ForEach(0..<task_types.types.count) { i in
                    Section(header: TaskLevelTxtView(i: i)) {
                        TaskList(tasks: tasks.filter { $0.level == i })
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
    
    fileprivate func TaskList(tasks: [CloudKitTask]) -> some View {
        return VStack{
            ForEach(tasks) { task in
                CalTaskView(task: task)
                
            }
        }
    }
}
