//
//  RealmRepresentable.swift
//  DataPlatform
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

protocol RealmRepresentable {
    associatedtype RealmType: DomainConvertibleType
    
    var id: Int {get}
    
    func asRealm() -> RealmType
}
