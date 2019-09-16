//
//  Database.swift
//  DataPlatform
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import RxSwift
import RxRealm

protocol AbstractDatabase {
    associatedtype T
    func queryAll() -> Observable<[T]>
    func save(entity: T) -> Observable<Bool>
}

final class Database<T:RealmRepresentable>: AbstractDatabase where T == T.RealmType.DomainType, T.RealmType: Object {
    private let configuration: Realm.Configuration
    private let scheduler: RunLoopThreadScheduler
    
    private var realm: Realm {
        return try! Realm(configuration: self.configuration)
    }
    
    init(configuration: Realm.Configuration) {
        self.configuration = configuration
        let name = "fernandogallo.Database"
        self.scheduler = RunLoopThreadScheduler(threadName: name)
        print("File 📁 url: \(RLMRealmPathForFile("default.realm"))")
    }
    
    func queryAll() -> Observable<[T]> {
        return Observable.deferred {
            let realm = self.realm
            let objects = realm.objects(T.RealmType.self)
            
            return Observable.array(from: objects)
                .mapToDomain()
            }
            .subscribeOn(scheduler)
    }
    
    func save(entity: T) -> Observable<Bool> {
        do {
            try realm.write {
                realm.add(entity.asRealm(), update: .modified)
            }
            return Observable.just(true)
        } catch let error as NSError {
            return Observable.error(error)
        }
    }
    
}
