//
//  UITextView+Ext.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/28/20.
//

import UIKit

extension UITextView {
    
    func isPresentational() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isEditable = false
        self.isScrollEnabled = false
        self.isSelectable = false
        self.isUserInteractionEnabled = false
    }
    
}

