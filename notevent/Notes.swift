//
//  Notes.swift
//  notevent
//
//  Created by InSTEDD on 8/4/14.
//  Copyright (c) 2014 InSTEDD. All rights reserved.
//

import Foundation

class Notes {
    var data: Array<Note> = []
    
    init(){
        
    }
    
    init(note: Note) {
        self.data.append(note)
    }
    
    func add(note:Note) {
        self.data.append(note)
    }
    
    var length: Int {
        return self.data.count
    }
    
    func count() -> Int {
        return self.length
    }
}
