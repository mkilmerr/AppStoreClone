//
//  UIColor.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 15/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit


extension UIColor{
    convenience init(r: CGFloat,g:CGFloat,b:CGFloat){
        self.init(red:r/255, green: g/255, blue: b/255, alpha:1)
    }
    
    static let blueGetButton = UIColor(r: 0, g: 118, b: 244)
    static let grayGetButton = UIColor(white: 0.95, alpha: 1)
    static let bottomLine = UIColor(r: 158, g: 158, b: 158)
    
    convenience init(hexString: String) {
      let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
      var int = UInt64()
      Scanner(string: hex).scanHexInt64(&int)
      let a, r, g, b: UInt64
      switch hex.count {
      case 3: (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
      case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
      case 8: (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
      default: (a, r, g, b) = (255, 0, 0, 0)
      }
      self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
}
