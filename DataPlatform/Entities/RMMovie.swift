//
//  RMMovie.swift
//  DataPlatform
//
//  Created by Fernando Gallo on 15/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Domain
import RealmSwift

final class RMMovie: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var posterPath: String = ""
    @objc dynamic var rating: Double = 0.0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

extension RMMovie: DomainConvertibleType {
    func asDomain() -> Movie {
        return Movie(id: id,
                     title: title,
                     overview: overview,
                     posterPath: posterPath,
                     rating: rating)
    }
}

extension Movie: RealmRepresentable {
    func asRealm() -> RMMovie {
        return RMMovie.build { object in
            object.id = id
            object.title = title
            object.overview = overview
            object.posterPath = posterPath ?? ""
            object.rating = rating
        }
    }
}
