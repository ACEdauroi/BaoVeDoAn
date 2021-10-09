//
//  ContentViewController.swift
//  ShareSheet
//
//  Created by Apple on 01/10/2021.
//

import UIKit
import BLTNBoard

struct CustomData {
    var title: String
    var url: String
    var backgroundImage: UIImage
}

class ContentViewController: UIViewController {

    
    
    let nameLabel: UILabel = {
        let label = UILabel ()
        label.text = "Welcome to Son La"
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.attributedText = NSAttributedString(string: "Welcome to Son La", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.frame = CGRect(x: 70, y: 320 , width: 250, height: 75)
        
        return label
    }()
    
    let FieldLabel: UILabel = {
        let label = UILabel ()
        label.text = "   Son La is a mountain province located in the heart of the Northwest of Vietnam, over 300 km from Hanoi, the northern borders of the provinces of Yen Bai, Lao Cai, in the east by Phu Tho, Hoa Binh, in the west by Lai Chau, Dien Bien, Thanh Hoa province on the south. the province has 250km of borderline with the People's Democratic Republic of Laos. a population of over 1 million people with 12 ethnic groups live, ethnic minorities make up more than 80 %, natural area of 14 thousand km2.This geographical location gives the advantage of Son La  transit point the tourist itinerary link Hanoi with the mountain northwestern provinces and Laos. The highway system connecting the provinces of Son La in the region has been upgraded and greatly improved, especially national highway linking Hanoi with six northwestern provinces.Na San Airport to Son La city center 18 km in the process of upgrading, when completed, will actively support tourism development.Accommodation system is distributed fairly reasonable in northwestern tourist routes, are investing to upgrade from standard to three stars to meet the increasingly diverse needs of travelers with a total of 1300 rooms with 2500 bed rest.Natural tourism resources and humanity of the Son La is rich and has gradually been exploited for the development of tourism resources in it. Moc Chau Plateau is 1.050 meters compared to sea level . cool climate, fresh with lots of beautiful scenery such as caves, waterfalls, grassy prairies, hills  tea immense , known as special milk and dairy products, Moc suong tea,  Shan tuyet tea Moc Chau, vegetables, temperate zone fruits and only 170km away from Hanoi is the address for sightseeing tours and resort attractions. ethnic communities living in Son la,including 12 ethnic groups. In particular, the Thai ethnic majority (54%), followed by the Kinh (18%), Mong (12%), Muong, Xinh Mun, La Ha, Dao, Hoa, Laos, Tay. . Overall the recent years material life and spirit of the majority of the ethnic communities  in Son La province has been gradually improved. Manners and customs, traditional activities of each ethnic group are focused on conservation in the context of acquiring a new cultural values​​. Thai ethnic culture and on to the Mong culture, Muong be seen as typical culture Son La province, but in 12 ethnic group living in the province, each nation has culture is unique, has potential value for exploit, to sever Son La tourism"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
        label.frame = CGRect(x: 20, y: 380 , width: 330, height: 500)
        label.numberOfLines = 50
        
        return label
    }()
    
    fileprivate let data = [
        CustomData(title: "The Islands!", url: "maxcodes.io/enroll", backgroundImage: #imageLiteral(resourceName: "SonLa")),
        CustomData(title: "Subscribe to maxcodes boiiii!", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "Euro")),
        CustomData(title: "StoreKit Course!", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "phuot")),
        CustomData(title: "Collection Views!", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "images6")),
        CustomData(title: "MapKit!", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "Africa")),
    ]
    
    fileprivate let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    
    private lazy var boardManager: BLTNItemManager = {
       let item = BLTNPageItem(title: "Save to your list")
        item.image = UIImage(named: "love")
        item.actionButtonTitle = "Add to your list "
        item.alternativeButtonTitle = "Oh, No thanks"
        item.descriptionText = "Useful for you ? "
        
        item.actionHandler = { _ in
            ContentViewController.didTapBoardContinue()
        }
        
        item.alternativeHandler = { _ in
            ContentViewController.didTapBoardSkip ()
        }
        item.appearance.actionButtonColor = UIColor(red: 0.30, green: 0.83, blue: 0.95, alpha: 1.00)
        item.appearance.alternativeButtonTitleColor = .red
        return BLTNItemManager(rootItem:  item)
    }()
    
    
   
   
    
   
    
    var isState: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        
        
        navigationItem.title = "Son La"
        
        let favoriteButton = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .done, target: self, action: #selector(heartPress))
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up.fill"), style: .done, target: self, action: #selector(presentSheet))
        
        
        navigationItem.rightBarButtonItems = [ favoriteButton, shareButton]
        navigationController?.navigationBar.tintColor = UIColor(red: 0.30, green: 0.83, blue: 0.95, alpha: 1.00)
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        
        view.addSubview(nameLabel)
        view.addSubview(FieldLabel)
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 520).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.width/1.5).isActive = true
        
        }
    
    
    
    @objc func heartPress(){
        print("Heart")
        boardManager.showBulletin(above: self)
    }
    
    static func didTapBoardContinue () {
        print ("Did tap continue")
    }
    
    static func didTapBoardSkip () {
        print ("Did tap skip")
    }
    
    
    @objc func presentSheet(_ sender: Any) {
        let websiteURL = "https://github.com/NguyNnThnh71"
        let activityVC = UIActivityViewController(activityItems: [websiteURL], applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.saveToCameraRoll]
        activityVC.popoverPresentationController?.sourceView = sender as? UIView
        self.present(activityVC, animated: true, completion: nil)
        print("Share")
    }
    

}
extension ContentViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}

extension ContentViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.item]
        return cell
    }
}


class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.backgroundImage
            
        }
    }
    
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
                iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        


        
        contentView.addSubview(bg)

        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

