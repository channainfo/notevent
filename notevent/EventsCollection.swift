//
//  EventsCollection.swift
//  notevent
//
//  Created by InSTEDD on 7/30/14.
//  Copyright (c) 2014 InSTEDD. All rights reserved.
//

import Foundation

class EventsCollection {
    var events: Array<Event>!
    
    init(){
        self.events = []
    }
    
    init(event: Event) {
        self.events = [event]
    }
    
    init(events: Array<Event>) {
        self.events = events
    }
    
    
}