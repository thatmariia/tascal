//
//  CloudKitHelper.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 13/11/2020.
//

import Foundation
import CloudKit
import SwiftUI

struct CloudKitHelper {
    
    // MARK: - record types
    struct RecordType {
        static let Tasks = "Tasks"
    }
    
    // MARK: - errors
    enum CloudKitHelperError: Error {
        case recordFailure
        case recordIDFailure
        case castFailure
        case cursorFailure
    }
    
    // MARK: - saving to CloudKit
    static func save(task: Task, completion: @escaping (Result<Task, Error>) -> ()) {
        let itemRecord = CKRecord(recordType: RecordType.Tasks)
        
        itemRecord["task_id"]           = task.task_id          as CKRecordValue
        itemRecord["date_created"]      = task.date_created     as CKRecordValue
        itemRecord["date_distributed"]  = task.date_distributed as CKRecordValue
        itemRecord["is_completed"]      = task.is_completed     as CKRecordValue
        itemRecord["is_repeating"]      = task.is_repeating     as CKRecordValue
        itemRecord["level"]             = task.level            as CKRecordValue
        itemRecord["time"]              = task.time             as CKRecordValue
        itemRecord["txt"]               = task.txt              as CKRecordValue
        
        CKContainer.default().privateCloudDatabase.save(itemRecord) { (record, err) in
            DispatchQueue.main.async {
                if let err = err {
                    completion(.failure(err))
                    return
                }
                guard let record = record else {
                    completion(.failure(CloudKitHelperError.recordFailure))
                    return
                }
                
                let record_id = record.recordID
                
                guard let task_id = record["task_id"] as? String else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let date_created = record["date_created"] as? Date else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let date_distributed = record["date_distributed"] as? Date else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let is_completed = record["is_completed"] as? Int else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let is_repeating = record["is_repeating"] as? Int else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let level = record["level"] as? Int else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let time = record["time"] as? Double else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let txt = record["txt"] as? String else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                let task = Task(task_id: task_id,
                                record_id: record_id,
                                date_created: date_created,
                                date_distributed: date_distributed,
                                is_completed: is_completed,
                                is_repeating: is_repeating,
                                level: level,
                                time: time,
                                txt: txt)
                
                completion(.success(task))
            }
        }
        
    }
    
    // MARK: - fetching from CloudKit
    static func fetch(completion: @escaping (Result<Task, Error>) -> ()) {
        let pred = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "creationDate", ascending: false)
        let query = CKQuery(recordType: RecordType.Tasks, predicate: pred)
        query.sortDescriptors = [sort]
        
        let operation = CKQueryOperation(query: query)
        operation.desiredKeys = ["task_id",
                                 "date_created",
                                 "date_distributed",
                                 "is_completed",
                                 "is_repeating",
                                 "level",
                                 "time",
                                 "txt"]
        operation.resultsLimit = 1000
         
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                let record_id = record.recordID
                guard let task_id = record["task_id"] as? String else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let date_created = record["date_created"] as? Date else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let date_distributed = record["date_distributed"] as? Date else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let is_completed = record["is_completed"] as? Int else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let is_repeating = record["is_repeating"] as? Int else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let level = record["level"] as? Int else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let time = record["time"] as? Double else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let txt = record["txt"] as? String else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                let task = Task(task_id: task_id,
                                record_id: record_id,
                                date_created: date_created,
                                date_distributed: date_distributed,
                                is_completed: is_completed,
                                is_repeating: is_repeating,
                                level: level,
                                time: time,
                                txt: txt)
                
                completion(.success(task))
            }
        }
        
        operation.queryCompletionBlock = { (/*cursor*/ _, err) in
            DispatchQueue.main.async {
                if let err = err {
                    completion(.failure(err))
                    return
                }
                //                guard let cursor = cursor else {
                //                    completion(.failure(CloudKitHelperError.cursorFailure))
                //                    return
                //                }
                //                print("Cursor: \(String(describing: cursor))")
            }
            
        }
        
        CKContainer.default().privateCloudDatabase.add(operation)
    }
    
    // MARK: - delete from CloudKit
    static func delete(recordID: CKRecord.ID, completion: @escaping (Result<CKRecord.ID, Error>) -> ()) {
        CKContainer.default().publicCloudDatabase.delete(withRecordID: recordID) { (recordID, err) in
            DispatchQueue.main.async {
                if let err = err {
                    completion(.failure(err))
                    return
                }
                guard let recordID = recordID else {
                    completion(.failure(CloudKitHelperError.recordIDFailure))
                    return
                }
                completion(.success(recordID))
            }
        }
    }
    
    // MARK: - modify in CloudKit
    static func modify(task: Task, completion: @escaping (Result<Task, Error>) -> ()) {
        guard let recordID = task.record_id else { return }
        CKContainer.default().privateCloudDatabase.fetch(withRecordID: recordID) { record, err in
            if let err = err {
                DispatchQueue.main.async {
                    completion(.failure(err))
                }
                return
            }
            guard let record = record else {
                DispatchQueue.main.async {
                    completion(.failure(CloudKitHelperError.recordFailure))
                }
                return
            }
            // task id and creation date can't change
            record["date_distributed"]  = task.date_distributed as CKRecordValue
            record["is_completed"]      = task.is_completed     as CKRecordValue
            record["is_repeating"]      = task.is_repeating     as CKRecordValue
            record["level"]             = task.level            as CKRecordValue
            record["time"]              = task.time             as CKRecordValue
            record["txt"]               = task.txt              as CKRecordValue
            
            CKContainer.default().privateCloudDatabase.save(record) { (record, err) in
                DispatchQueue.main.async {
                    if let err = err {
                        completion(.failure(err))
                        return
                    }
                    guard let record = record else {
                        completion(.failure(CloudKitHelperError.recordFailure))
                        return
                    }
            
                    let record_id = record.recordID
                    
                    guard let task_id = record["task_id"] as? String else {
                        completion(.failure(CloudKitHelperError.castFailure))
                        return
                    }
                    guard let date_created = record["date_created"] as? Date else {
                        completion(.failure(CloudKitHelperError.castFailure))
                        return
                    }
                    guard let date_distributed = record["date_distributed"] as? Date else {
                        completion(.failure(CloudKitHelperError.castFailure))
                        return
                    }
                    guard let is_completed = record["is_completed"] as? Int else {
                        completion(.failure(CloudKitHelperError.castFailure))
                        return
                    }
                    guard let is_repeating = record["is_repeating"] as? Int else {
                        completion(.failure(CloudKitHelperError.castFailure))
                        return
                    }
                    guard let level = record["level"] as? Int else {
                        completion(.failure(CloudKitHelperError.castFailure))
                        return
                    }
                    guard let time = record["time"] as? Double else {
                        completion(.failure(CloudKitHelperError.castFailure))
                        return
                    }
                    guard let txt = record["txt"] as? String else {
                        completion(.failure(CloudKitHelperError.castFailure))
                        return
                    }
                    let task = Task(task_id: task_id,
                                    record_id: record_id,
                                    date_created: date_created,
                                    date_distributed: date_distributed,
                                    is_completed: is_completed,
                                    is_repeating: is_repeating,
                                    level: level,
                                    time: time,
                                    txt: txt)
                    
                    completion(.success(task))
                }
            }
        }
    }
}
