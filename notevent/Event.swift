//
//  Event.swift
//  notevent
//
//  Created by InSTEDD on 7/30/14.
//  Copyright (c) 2014 InSTEDD. All rights reserved.
//

import Foundation

class Event {
    var title: String!
    var description: String!
    var tags: Array<String>!
    
    
    init(){
      self.title = ""
      self.description = ""
      self.tags = []
    }
    
    init(title:String, description: String, tags: Array<String>){
        self.title = title
        self.description = description
        self.tags = tags
    }
    
}
