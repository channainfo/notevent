//
//  Note.swift
//  notevent
//
//  Created by InSTEDD on 8/4/14.
//  Copyright (c) 2014 InSTEDD. All rights reserved.
//

import Foundation

class Note {
    var title: String!
    var description: String!
    
    init(){
      self.title = ""
      self.description = ""
    }
    
    init(title: String, description:String) {
        self.title = title
        self.description = description
    }
    
    
}
