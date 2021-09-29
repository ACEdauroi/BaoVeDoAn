//
//  PhotoCollectionViewCell.swift
//  NavigateAndTabBar
//
//  Created by Apple on 18/09/2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let indentifier = "PhotoCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView ()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init (frame:CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
       let images = [
            UIImage(named: "images3"),
        UIImage(named: "images4"),
        UIImage(named: "images5"),
        UIImage(named: "images6")
       ].compactMap({ $0 })
        imageView.image = images.randomElement()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil 
    }
}
