//
//  RecordedAudio.swift
//  pitch_is_perfect
//
//  Created by Hector Otero on 6/23/15.
//  Copyright (c) 2015 Larsen & McDermott Enterprises, LLC. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    
    //Initializer for title, filePathUrl
    init(a: NSURL, b: String) {
        self.filePathUrl = a
        self.title = b
    }
}