//
//  JsonSerializationError.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/20.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

enum JsonSerializationError: Error {
    case missing(String)
    case invalid(String, Any)
    case incomplete
}
