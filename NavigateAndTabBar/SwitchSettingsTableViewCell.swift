//
//  SettingsTableViewCell.swift
//  NavigateAndTabBar
//
//  Created by Apple on 17/09/2021.
//

import UIKit

class SwitchSettingsTableViewCell: UITableViewCell {
static let identifier = "SwitchSettingsTableViewCell"
    private let iconContainerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    
    
    private let iconImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
       let label = UILabel ()
        label.numberOfLines = 1
        return label
    }()
    
    private let mySwitch: UISwitch = {
       let mySwitch = UISwitch ()
        mySwitch.onTintColor = UIColor(red: 0.01, green: 0.88, blue: 0.93, alpha: 1.00)
        return mySwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainerView)
        contentView.addSubview(iconImageView)
        contentView.addSubview(mySwitch)
        contentView.clipsToBounds = true
        accessoryType = .none
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainerView.frame = CGRect(x: 15, y: 6, width: size, height: size)
        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)
        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(x: contentView.frame.size.width - mySwitch.frame.size.width - 20,
                                y: (contentView.frame.size.height - mySwitch.frame.size.height)/2,
                                width: mySwitch.frame.size.width,
                                height: mySwitch.frame.size.height)
        label.frame = CGRect(x: 25 + iconContainerView.frame.size.width,
                             y: 0,
                             width:   contentView.frame.size.width - 15 - iconContainerView.frame.size.width,
                             height: contentView.frame.size.height)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconImageView.backgroundColor = nil
        mySwitch.isOn = false
    }
    public func configure(with model: SettingsSwitchOptions) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainerView.backgroundColor = model.iconBackgroundcolor
        mySwitch.isOn = model.isOn
    }
}
