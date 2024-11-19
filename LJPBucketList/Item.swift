//
//  Item.swift
//  LJPBucketList
//
//  Created by Tine Ramos on 19/11/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
