//
//  UIApplication+Extension.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/23.
//

import UIKit

public extension UIApplication {
    var topSafeAreaInsets: CGFloat {
        if #available(iOS 11, *) {
            let window = UIApplication.shared.keyWindow
            return window?.safeAreaInsets.top ?? 0
        }
        return 20
    }
    
    var bottomSafeAreaInsets: CGFloat {
        if #available(iOS 11, *) {
            let window = UIApplication.shared.keyWindow
            return window?.safeAreaInsets.bottom ?? 0
        }
        return 0
    }
}
