//
//  SettingsViewController.swift
//  NavigateAndTabBar
//
//  Created by Apple on 15/09/2021.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}
enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOptions)
}
struct SettingsSwitchOptions {
    let title: String
    let icon: UIImage?
    let iconBackgroundcolor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundcolor: UIColor
    let handler: (() -> Void)
}
class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView: UITableView = {
        let table = UITableView (frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier )
        table.register(SwitchSettingsTableViewCell.self, forCellReuseIdentifier: SwitchSettingsTableViewCell.identifier)
        return table
    }()
    
    var models = [Section] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        let avaImage = UIImageView(frame: CGRect(x: 295, y: -50, width: 40, height: 40))
        avaImage.image = UIImage(named:"man")
        
        let button = UIButton(frame: CGRect(x: 120, y: 520, width: 141, height: 48))
        button.backgroundColor = UIColor(red: 0.01, green: 0.88, blue: 0.93, alpha: 1.00)
        button.setTitle("Sign out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(didTapSignOut), for: .touchUpInside)
    
        configure()
        title = "Settings"
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.addSubview(avaImage)
        tableView.addSubview(button)
        tableView.frame = view.bounds
    }
    
    @objc func didTapSignOut () {
        self.dismiss(animated: true, completion: nil)
    }
    
    func configure() {
        
        models.append(Section(title: "Alert", options: [
        .switchCell(model: SettingsSwitchOptions(title: "New for you", icon: UIImage(named: "icons8-news-50"), iconBackgroundcolor: .systemGreen,handler: {
            }, isOn: true)),
        .switchCell(model: SettingsSwitchOptions(title: "Notification", icon: UIImage(named: "icons8-bell-50"), iconBackgroundcolor: .systemRed,handler: {
            }, isOn: true)),
        .switchCell(model: SettingsSwitchOptions(title: "Opportunity", icon: UIImage(named: "icons8-opportunity-50"), iconBackgroundcolor: .systemOrange,handler: {
            }, isOn: true)),
        ]))
        
        
        
        
        models.append(Section(title: "Account", options: [
            .staticCell(model: SettingsOption(title: "Change Password", icon: UIImage(named: "icons8-password-reset-50"), iconBackgroundcolor: .systemTeal){
                
            }),
            .staticCell(model:SettingsOption(title: "Content settings", icon: UIImage(named: "icons8-content-50"), iconBackgroundcolor: .systemPink){
            
        }),
            .staticCell(model:SettingsOption(title: "Language", icon: UIImage(named: "icons8-language-50"), iconBackgroundcolor: .systemYellow){
            
        }),
            .staticCell(model:SettingsOption(title: "Social", icon: UIImage(named: "icons8-social-network-64"), iconBackgroundcolor: .systemBlue){
            
        }),
            .staticCell(model:SettingsOption(title: "Private & Security", icon: UIImage(named: "icons8-private-64"), iconBackgroundcolor: .systemIndigo){
            
        }),
        
        ]))
        
        
            view.backgroundColor = .white
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.barTintColor = .white
            navigationItem.title = "Settings "
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let model = models[section]
        return model.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else {
                return UITableViewCell ()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchSettingsTableViewCell.identifier, for: indexPath) as? SwitchSettingsTableViewCell else {
                return UITableViewCell ()
            }
            cell.configure(with: model)
            return cell
        }
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
        
    }
}
