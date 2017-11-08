//
//  UIView+frame.swift
//  JTBaseClass
//
//  Created by jiangT on 2017/8/31.
//  Copyright © 2017年 jiangT. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    
    var originX : CGFloat {
        
        return self.frame.origin.x;
    }
    
    var originY : CGFloat {
        
        return self.frame.origin.y;
    }
    
    var origin : CGPoint {
        
        return self.frame.origin;
    }
    
    var width : CGFloat {
        
        return self.frame.width;
    }
    
    var height : CGFloat {
        
        return self.frame.height;
    }
    
    var size : CGSize {
        
        return self.frame.size;
    }
    
}
