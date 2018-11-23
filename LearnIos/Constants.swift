//
//  Constants.swift
//  LearnIos
//
//  Created by 杜李 on 2018/11/23.
//  Copyright © 2018 杜李. All rights reserved.
//

import Foundation
class Constants{
    static var DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("file")
}
