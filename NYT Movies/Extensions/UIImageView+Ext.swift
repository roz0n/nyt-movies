//
//  UIImageView+Ext.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/30/20.
//

import UIKit

extension UIImageView {
    
    func loadRemote(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data.init(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        self?.heightAnchor.constraint(equalToConstant: image.size.height).isActive = true
                        self?.widthAnchor.constraint(equalToConstant: image.size.width).isActive = true
                    }
                }
            }
        }
    }
    
}
