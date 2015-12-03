//
//  ModListSearch.swift
//  CKAN
//
//  Created by Calvin Mlynarczyk on 2015-11-19.
//  Copyright © 2015 KSP-CKAN. All rights reserved.
//

import Foundation

class ModListSearch {
    class func NameSearch(name: String, searchValue: String?) -> Bool {
        return searchValue == nil || searchValue!.isEmpty || name.capitalizedString.containsString(searchValue!.capitalizedString)
    }
    
    class func AuthorsSearch(authors: [String]?, searchValue: String?) -> Bool {
        return searchValue == nil || searchValue!.isEmpty || (authors != nil && authors!.contains({ author in
            author.capitalizedString.containsString(searchValue!.capitalizedString)
        }))
    }
}
