//
//  UIView.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 15/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

//MARK:- Extension to define autolayout
extension UIView{
    
    func setAutoLayoutProperties(top:NSLayoutYAxisAnchor?,trailing:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,leading:NSLayoutXAxisAnchor?,padding:UIEdgeInsets = .zero, size:CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant:  -padding.bottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        setHeightAndWidth(size: .init(width: size.width, height: size.height))
        
    }
    
    func fillAllScreen(padding:UIEdgeInsets = .zero){
        setAutoLayoutProperties(top: superview?.topAnchor, trailing: superview?.trailingAnchor, bottom: superview?.bottomAnchor, leading: superview?.leadingAnchor,padding: padding)
    }
    
    func centralizeView(size:CGSize = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        if let centerY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        if let centerX = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        setHeightAndWidth(size: .init(width: size.width, height: size.height))
        
    }
    
    
    
    func setHeightAndWidth(size:CGSize = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
}
