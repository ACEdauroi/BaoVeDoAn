//
//  ProfileViewController.swift
//  NavigateAndTabBar
//
//  Created by Apple on 18/09/2021.
//

import UIKit
import Floaty
class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private let collectionView = UICollectionView(frame: CGRect(x: 0, y: 375, width: 375, height: 350), collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        configure()
        view.backgroundColor =  UIColor(red: 0.01, green: 0.88, blue: 0.93, alpha: 1.00)
        let scrollMainView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 375, height: 3000))
       
        scrollMainView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        view.addSubview(scrollMainView)
        scrollMainView.contentSize = CGSize(width: 0, height: 3080)
        
        let profileImage = UIImageView(frame:CGRect(x: 0, y: -150, width: 375, height: 350))
        profileImage.image = UIImage(named: "paris")
        scrollMainView.addSubview(profileImage)
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 100, width: 375, height: 3000))
        scrollView.layer.cornerRadius = 75
        scrollView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        scrollMainView.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: 0, height: 0)
        
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 250))
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        scrollView.addSubview(contentView)
        
        let contentView2 = UIView(frame: CGRect(x: 0, y: 500, width: 375, height: 500))
        contentView2.backgroundColor = .blue
        contentView2.layer.cornerRadius = 5
        scrollView.addSubview(contentView2)
        
        let scrollView2 = UIScrollView(frame: CGRect(x: 0, y: 280, width: 500, height: 150))
        scrollView2.backgroundColor = .white
        scrollView.addSubview(scrollView2)
        scrollView2.contentSize = CGSize(width: view.frame.size.height , height: 0)
        
        let avaImage = UIImageView(frame: CGRect(x: 155 , y: 75, width: 70, height: 70))
                avaImage.image = UIImage(named:"man")
                scrollMainView.addSubview(avaImage)
        
        let label1 = UILabel(frame: CGRect(x: 10, y: 0, width: 110, height: 150))
        label1.backgroundColor = .white
        label1.layer.cornerRadius = 15
        scrollView2.addSubview(label1)
        
        let label2 = UILabel(frame: CGRect(x: 150, y: 0, width: 110, height: 150))
        label2.backgroundColor = .white
        label2.layer.cornerRadius = 15
        scrollView2.addSubview(label2)
        
        let label3 = UILabel(frame: CGRect(x: 300, y: 0, width: 110, height: 150))
        label3.backgroundColor = .white
        label3.layer.cornerRadius = 15
        scrollView2.addSubview(label3)
        
        let label4 = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 50))
        label4.text = "Post"
        label4.textColor = .black
        label4.font = .boldSystemFont(ofSize: 24)
        label4.backgroundColor = .white
        label4.layer.cornerRadius = 15
        collectionView.addSubview(label4)
        
        let imageHotel1 = UIImageView(frame: CGRect(x: 20 , y: 15, width: 70, height: 70))
        imageHotel1.layer.cornerRadius = 30
        imageHotel1.image = UIImage(named:"VinPearl")
        label1.addSubview(imageHotel1)
        
        let imageHotel2 = UIImageView(frame: CGRect(x: 15 , y: 15, width: 80, height: 70))
        imageHotel2.layer.cornerRadius = 30
        imageHotel2.image = UIImage(named:"GrandWorld")
        label2.addSubview(imageHotel2)
        
        let imageHotel3 = UIImageView(frame: CGRect(x: 15 , y: 15, width: 80, height: 70))
        imageHotel3.layer.cornerRadius = 30
        imageHotel3.image = UIImage(named:"Royal")
        label3.addSubview(imageHotel3)
        
        let postPic = UIImageView(frame: CGRect(x: 0 , y: 50, width: 125, height: 125))
        
        postPic.image = UIImage(named:"images3")
        collectionView.addSubview(postPic)
        
        let postPic2 = UIImageView(frame: CGRect(x: 125 , y: 50, width: 125, height: 125))
        
        postPic2.image = UIImage(named:"images4")
        collectionView.addSubview(postPic2)
        
        let postPic3 = UIImageView(frame: CGRect(x: 250 , y: 50, width: 125, height: 125))
        
        postPic3.image = UIImage(named:"images5")
        collectionView.addSubview(postPic3)
        
        let postPic4 = UIImageView(frame: CGRect(x: 0 , y: 175, width: 125, height: 125))
        
        postPic4.image = UIImage(named:"images6")
        collectionView.addSubview(postPic4)
        
        let postPic5 = UIImageView(frame: CGRect(x: 125 , y: 175, width: 250, height: 125))
        
        postPic5.image = UIImage(named:"images7")
        collectionView.addSubview(postPic5)
        
        let followButton1 = UIButton (frame: CGRect(x: 6, y: 100, width: 100, height: 40))
        followButton1.layer.cornerRadius = 20
        followButton1.setTitleColor(.white, for: .normal)
        followButton1.backgroundColor = UIColor(red: 0.30, green: 0.83, blue: 0.95, alpha: 1.00)
        followButton1.setTitle("Follow", for: .normal)
        label1.addSubview(followButton1)
        
        let followButton2 = UIButton (frame: CGRect(x: 6, y: 100, width: 100, height: 40))
        followButton2.layer.cornerRadius = 20
        followButton2.setTitleColor(.white, for: .normal)
        followButton2.backgroundColor = UIColor(red: 0.30, green: 0.83, blue: 0.95, alpha: 1.00)
        followButton2.setTitle("Follow", for: .normal)
        label2.addSubview(followButton2)
        
        let followButton3 = UIButton (frame: CGRect(x: 6, y: 100, width: 100, height: 40))
        followButton3.layer.cornerRadius = 20
        followButton3.setTitleColor(.white, for: .normal)
        followButton3.backgroundColor = UIColor(red: 0.30, green: 0.83, blue: 0.95, alpha: 1.00)
        followButton3.setTitle("Follow", for: .normal)
        label3.addSubview(followButton3)
                
        let labelName = UILabel(frame: CGRect(x: 65, y: 50, width: 250, height: 50))
        labelName.text = "Thành Nguyễn"
        labelName.textColor = .black
        labelName.textAlignment = .center
        labelName.font = UIFont.boldSystemFont(ofSize: 24)
        contentView.addSubview(labelName)
        
        let profile = UILabel(frame: CGRect(x: 65, y: 85, width: 250, height: 50))
        profile.text = "Hanoi,VietNam"
        profile.textColor = .lightGray
        profile.textAlignment = .center
        profile.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(profile)
        
        let profileButton = UIButton(frame: CGRect(x: 50, y: 140, width: 175, height: 48))
        profileButton.backgroundColor = UIColor(red: 0.30, green: 0.83, blue: 0.95, alpha: 1.00)
        profileButton.setTitle("      Edit Profile", for: .normal)
        profileButton.layer.cornerRadius = 12
        profileButton.setTitleColor(.white, for: .normal)
        contentView.addSubview(profileButton)
        
        let moreButton = UIButton(frame: CGRect(x: 255, y: 140, width: 50, height: 50))
        moreButton.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
        moreButton.setTitle("", for: .normal)
        moreButton.layer.cornerRadius = 12
        moreButton.setTitleColor(.white, for: .normal)
        contentView.addSubview(moreButton)
        
        let iconPen = UIImageView(frame: CGRect(x: 14 , y: 12, width: 25, height: 25))
        iconPen.image = UIImage(named:"pen-tool")
        profileButton.addSubview(iconPen)
        
        let dots = UIImageView(frame: CGRect(x: 12, y: 12, width: 25, height: 25))
        dots.image = UIImage(named:"more")
        moreButton.addSubview(dots)
        
        
        
        let item = FloatyItem()
        item.buttonColor = UIColor.blue
        item.title = "Custom item"
        Floaty.global.button.addItem(item: item)
        
        let floaty = Floaty(frame: CGRect(x: view.frame.size.width - 90, y: view.frame.size.height - 200, width: 60, height: 60))
        floaty.backgroundColor = .none
        floaty.buttonColor = .white
        floaty.layer.cornerRadius = 30
        floaty.itemButtonColor = .white
        floaty.tintColor = .white
        floaty.sticky = true
        floaty.addItem("Library", icon: UIImage(named: "icons8-camera-50")!)
        floaty.addItem("Review", icon: UIImage(named: "icoText"))
        floaty.addItem("Mail", icon: UIImage(named: "email"))
        self.view.addSubview(floaty)
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.indentifier)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        contentView2.addSubview(collectionView)
       
    }
    
    override func  viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4000
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.indentifier, for: indexPath)
        return cell
    }
    func configure() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .white
        
        navigationItem.title = ""
    }

}
