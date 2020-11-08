//
//  TasksEnvironment.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import Foundation

class TasksEnvironment : ObservableObject {
    @Published var tasks: [String] = ["Ryan Scott Bradley (born November 17, 1983) is an American former competitive figure skater. He is the 2008 Skate Canada International silver medalist, the 2009 Skate America bronze medalist, the 2011 U.S. national champion, and a three-time U.S. Collegiate champion.", "new task1","new task2","new task3","new task4","new task5"]
        
        /*["Ryan Scott Bradley (born November 17, 1983) is an American former competitive figure skater. He is the 2008 Skate Canada International silver medalist, the 2009 Skate America bronze medalist, the 2011 U.S. national champion, and a three-time U.S. Collegiate champion.","new task1","new task2","new task3","new task4","new task5","new task6","new task7","new task8","new task9","new task10","new task11","new task12","new task13","new task14","new task15","new task16","new task17","new task18","new task19","new task20","new task21","new task22","new task23","new task24","new task25","new task26","new task27","new task28","new task29","new task30","new task31","new task32","new task33","new task34","new task35","new task36","new task37","new task38","new task39","new task40","new task41","new task42","new task43","new task44","new task45","new task46","new task47","new task48","new task49","new task50","new task51","new task52","new task53","new task54","new task55","new task56","new task57","new task58","new task59","new task60","new task61","new task62","new task63","new task64","new task65","new task66","new task67","new task68","new task69","new task70","new task71","new task72","new task73","new task74","new task75","new task76","new task77","new task78","new task79","new task80","new task81","new task82","new task83","new task84","new task85","new task86","new task87","new task88","new task89","new task90","new task91","new task92","new task93","new task94","new task95","new task96","new task97","new task98","new task99"]*/
    
    @Published var bins                             = 3
    @Published var distributed_tasks: [[String]]    = []
    @Published var distributed_sizes: [Int]         = []
    
    @Published var task_height: CGFloat = 28
    
    func distribute_tasks() {
        var dt: [[String]]  = []
        var ds: [Int]       = []
        
        for _ in 0..<self.bins {
            dt.append([])
            ds.append(0)
        }
        dt[0].append("")
        ds[0] += 1
        for i in 0..<tasks.count {
            dt[(i+1)%self.bins].append(tasks[i])
            ds[(i+1)%self.bins] += 1
        }
        
        self.distributed_tasks = dt
        self.distributed_sizes = ds
        
        print(ds)
        print(dt)
        
        //return dt
    }
}
