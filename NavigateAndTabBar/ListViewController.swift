//
//  ListViewController.swift
//  NavigateAndTabBar
//
//  Created by Apple on 08/10/2021.
//

import UIKit

    class ListViewController: UIViewController {
           
            

            let cellId = "cellId"
            var tempArray = ["Bãi Dài", "VinWonders Phú Quốc - Thiên đường vui chơi giải trí", "Vinpearl Safari Phú Quốc - Trải nghiệm “Nhốt người thả thú” có 1 - 0 - 2", "Gành Dầu - Nơi có bãi biển cong hình lưỡi liềm ", "Đảo Đồi Mồi", "Vườn tiêu Phú Quốc - Tham quan và tìm hiểu vườn tiêu cùng bà con", " Hòn Một - Địa điểm du lịch tại Phú Quốc mới mẻ", "Trại ong Phú Quốc - Trải nghiệm và mua mật ong về làm quà","Bãi Ông Lang - Nơi lý tưởng cho những chuyến picnic", "Bãi Sao - Bãi biển đẹp nhất Phú Quốc", "Cáp treo Hòn Thơm - Chiêm ngưỡng đảo ngọc từ trên cao", "Bãi Khem - Cảm nhận sự yên bình ", "Nhà tù Phú Quốc" ,"Thiền viện Trúc Lâm - Địa điểm du lịch tâm linh ở Phú Quốc"," Lặn ngắm rạn san hô Nam đảo","Suối Tranh - Khung cảnh bước ra từ trong tranh ","Nhà thùng nước mắm - Tìm hiểu quy trình tạo nên nước mắm Phú Quốc nổi danh","Khu nuôi cấy ngọc trai","Hòn Móng Tay, Hòn Mây Rút, Hòn Dăm Ngang - 3 hòn đảo xinh đẹp đáng đến","Chợ đêm Phú Quốc - Địa điểm thích mê của những tín đồ “nghiền hải sản","Chợ đêm Dinh Cậu","Câu mực đêm - Hoạt động thú vị đáng thử","Quán cafe Chuồn Chuồn - View bao quát toàn cảnh thị trấn Dương Đông"," Coco Bar - Thưởng thức những ly cocktail ngon nổi tiếng", "Nhà hát múa rối nước Đảo Ngọc","Rạp chiếu phim ngoài trời House No.1 Bar club","PH Rooftop Bar & Lounge - Relax tuyệt vời với đồ uống ngon và không gian mở", "BoBa Beer Club", "Rory’s Beach Bar"]
            var filteredArray = [String]()
            var isSearching = false
            
            lazy var mainTable: UITableView = {
               let table = UITableView()
                table.translatesAutoresizingMaskIntoConstraints = false
                table.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
                return table
            }()
            
            let mainSearchBar = MainSearchViewController()
            
            fileprivate func setupView(){
                view.addSubview(mainSearchBar)
                view.addSubview(mainTable)
                view.backgroundColor = .white
                mainSearchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
                mainSearchBar.heightAnchor.constraint(equalToConstant: 100).isActive = true
                mainSearchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
                mainSearchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
                mainSearchBar.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
            
                mainTable.topAnchor.constraint(equalTo: mainSearchBar.bottomAnchor, constant: 0).isActive = true
                mainTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
                mainTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
                mainTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
                mainTable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            }

            override func viewDidLoad() {
                super.viewDidLoad()
                setupView()
                mainTable.delegate = self
                mainTable.dataSource = self
                mainSearchBar.delegate = self
                mainSearchBar.returnKeyType = UIReturnKeyType.done
                
                UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
                
            }
        }
