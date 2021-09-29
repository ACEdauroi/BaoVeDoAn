//
//  ViewController.swift
//  NavigateAndTabBar
//
//  Created by Apple on 15/09/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configure ()
        
        title = "Home"
        view.backgroundColor = .white
        
        let label1 = UILabel(frame: CGRect(x: 1, y: 0, width: 210, height: 100))
        label1.backgroundColor = UIColor(red: 0.86, green: 0.74, blue: 0.49, alpha: 1.00)
        label1.textColor = .white
        label1.font = UIFont.boldSystemFont(ofSize: 15)
        label1.textAlignment = .natural
        label1.layer.cornerRadius = 15
        label1.text = "Sale off 90%"
        
        let labelCate = UILabel(frame: CGRect(x: 40, y: 475, width: 150, height: 50))
        labelCate.text = "Be Inspried"
        labelCate.attributedText = NSAttributedString(string: "Be Inspried", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        labelCate.font = UIFont.boldSystemFont(ofSize: 20)
        labelCate.textColor = .black
        
        let labelMain = UILabel(frame: CGRect(x: 40, y: 850, width: 150, height: 50))
        labelMain.text = "Something new"
        labelMain.attributedText = NSAttributedString(string: "Something new", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        labelMain.font = UIFont.boldSystemFont(ofSize: 20)
        labelMain.textColor = .black
        
        let labelRecommend = UILabel(frame: CGRect(x: 40, y: 675, width: 200, height: 50))
        labelRecommend.text = "All sale off this week"
        labelRecommend.attributedText = NSAttributedString(string: "All sale off this week", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        labelRecommend.font = UIFont.boldSystemFont(ofSize: 20)
        labelRecommend.textColor = .black
        
        let labelHint = UILabel(frame: CGRect(x: 110, y: 70, width: 200, height: 50))
        labelHint.text = "Discover in Son La"
        labelHint.font = UIFont.boldSystemFont(ofSize: 20)
        labelHint.textColor = .white
        
        
        let labelHint2 = UILabel(frame: CGRect(x: 110, y: 70, width: 200, height: 50))
        labelHint2.text = "Make plans"
        
        labelHint2.font = UIFont.boldSystemFont(ofSize: 20)
        labelHint2.textColor = .white
        
        let labelHint3 = UILabel(frame: CGRect(x: 110, y: 70, width: 200, height: 50))
        labelHint3.text = "It's time for moutain"
        
        labelHint3.font = UIFont.boldSystemFont(ofSize: 20)
        labelHint3.textColor = .white
        
        let labelHint4 = UILabel(frame: CGRect(x: 10, y: 50, width: 300, height: 300 ))
        labelHint4.text = "Mortocycle trip in Lai Chau"
        labelHint4.numberOfLines = 4
        labelHint4.font = UIFont.boldSystemFont(ofSize: 40)
        labelHint4.textColor = .white
        
        let labelHint5 = UILabel(frame: CGRect(x: 10, y: 150, width: 300, height: 300 ))
        labelHint5.text = "Lai Chau is the first tourist destination of the Northwest region that I would like to introduce to you. With mainly mountainous terrain and highlands, Lai Chau becomes the ideal backpacking destination near Hanoi for young people."
        labelHint5.numberOfLines = 4
        labelHint5.font = UIFont.systemFont(ofSize: 15)
        labelHint5.textColor = .white
        
        
        let labelHint6 = UILabel(frame: CGRect(x: 10, y: 150, width: 300, height: 300 ))
        labelHint6.text = "The last tourist destination of the Northwest region that I would like to introduce to you is Hoa Binh Tourist Area. With diverse natural terrain, Hoa Binh owns many caves and spectacular waterfalls."
        labelHint6.numberOfLines = 4
        labelHint6.font = UIFont.systemFont(ofSize: 15)
        labelHint6.textColor = .white
        
        let labelHint7 = UILabel(frame: CGRect(x: 10, y: 20, width: 300, height: 300 ))
        labelHint7.text = "The ideal tourist and virtual living place in Hoa Binh"
        labelHint7.numberOfLines = 4
        labelHint7.font = UIFont.boldSystemFont(ofSize: 40)
        labelHint7.textColor = .white
        
        let buttonReadMore = UIButton(frame: CGRect(x: 10, y: 375, width: 150, height: 50))
        buttonReadMore.layer.cornerRadius = 20
        buttonReadMore.backgroundColor = .white
        buttonReadMore.setTitle("Read more", for: .normal)
        buttonReadMore.setTitleColor(.black, for: .normal)
        
        let buttonReadMore2 = UIButton(frame: CGRect(x: 10, y: 375, width: 150, height: 50))
        buttonReadMore2.layer.cornerRadius = 20
        buttonReadMore2.backgroundColor = .white
        buttonReadMore2.setTitle("Read more", for: .normal)
        buttonReadMore2.setTitleColor(.black, for: .normal)
        
        let imageBlog = UIImageView(frame: CGRect(x: 0, y: 1150, width: 450, height: 450))
        imageBlog.image = UIImage(named:"phuot")
            
        let imageBlog2 = UIImageView(frame: CGRect(x: 0, y: 1650, width: 450, height: 450))
        imageBlog2.image = UIImage(named:"HoaBinh")
        
        let imageVoucher = UIImageView(frame: CGRect(x: 100, y: 0, width: 110, height: 100))
        imageVoucher.image = UIImage(named: "Vinholidays")
            
        let scrollMainView = UIScrollView(frame: CGRect(x: 0, y: -150, width: 375, height: 3000))
        scrollMainView.backgroundColor = .white
        view.addSubview(scrollMainView)
        scrollMainView.contentSize = CGSize(width: 0, height: 4500)
        
        let contentBackgroundView = UIView(frame:CGRect(x: 0, y: -147, width: 375, height: 600))
        contentBackgroundView.backgroundColor = UIColor(red: 0.00, green: 0.82, blue: 1.00, alpha: 1.00)
        contentBackgroundView.layer.cornerRadius = 50
        scrollMainView.addSubview(contentBackgroundView)
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 900, width: 500, height: 200))
        scrollView.backgroundColor = .white
        scrollMainView.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.size.height + 500, height: 0)
        
        let scrollView2 = UIScrollView(frame: CGRect(x: 0, y: 730, width: 500, height: 100))
        scrollView2.backgroundColor = .white
        scrollMainView.addSubview(scrollView2)
        scrollView2.contentSize = CGSize(width: view.frame.size.height , height: 0)
        
        
        let scrollView3 = UIScrollView(frame: CGRect(x: 0, y: 400, width: 500, height: 120))
        scrollView3.backgroundColor =  UIColor(red: 0.00, green: 0.82, blue: 1.00, alpha: 1.00)
        contentBackgroundView.addSubview(scrollView3)
        scrollView3.contentSize = CGSize(width: view.frame.size.height + 225 , height: 0)
        
        let buttonCircle = UIButton(frame: CGRect(x: 10, y: 5, width: 75, height: 75))
        buttonCircle.layer.cornerRadius = 35.5
        buttonCircle.backgroundColor = .white
        buttonCircle.layer.shadowOpacity = 0.3
        buttonCircle.layer.shadowColor = .none
        buttonCircle.layer.shadowOffset = .zero
        scrollView3.addSubview(buttonCircle)
        
        let labelIcon = UILabel(frame: CGRect(x: 22, y: 70, width: 75, height: 50))
        labelIcon.text = "Rental"
        labelIcon.font = UIFont.boldSystemFont(ofSize: 17)
        labelIcon.textColor = .white
        scrollView3.addSubview(labelIcon)
        
        let iconRental = UIImageView(frame: CGRect(x: 20, y: 15 , width: 40, height: 40))
        iconRental.image = UIImage(named:"icons8-lease-50")
        buttonCircle.addSubview(iconRental)
        
        let buttonCircle1 = UIButton(frame: CGRect(x: 120, y: 5, width: 75, height: 75))
        buttonCircle1.layer.cornerRadius = 35.5
        buttonCircle1.layer.shadowOpacity = 0.3
        buttonCircle1.layer.shadowOffset = .zero
        buttonCircle1.backgroundColor = .white
        scrollView3.addSubview(buttonCircle1)
        
        let labelIcon2 = UILabel(frame: CGRect(x: 140, y: 70, width: 75, height: 50))
        labelIcon2.text = "Taxi"
        labelIcon2.font = UIFont.boldSystemFont(ofSize: 17)
        labelIcon2.textColor = .white
        scrollView3.addSubview(labelIcon2)
        
        let iconTaxi = UIImageView(frame: CGRect(x: 18, y: 10 , width: 40, height: 40))
        iconTaxi.image = UIImage(named:"icons8-taxi-50")
        buttonCircle1.addSubview(iconTaxi)
    
        
        let buttonCircle2 = UIButton(frame: CGRect(x: 230, y: 5, width: 75, height: 75))
        buttonCircle2.layer.cornerRadius = 35.5
        buttonCircle2.layer.shadowOpacity = 0.3
        buttonCircle2.layer.shadowOffset = .zero
        buttonCircle2.backgroundColor = .white
        scrollView3.addSubview(buttonCircle2)
        
        let labelIcon3 = UILabel(frame: CGRect(x: 235, y: 70, width: 75, height: 50))
        labelIcon3.text = "Booking"
        labelIcon3.font = UIFont.boldSystemFont(ofSize: 17)
        labelIcon3.textColor = .white
        scrollView3.addSubview(labelIcon3)
        
        let iconBooking = UIImageView(frame: CGRect(x: 18, y: 20 , width: 40, height: 40))
        iconBooking.image = UIImage(named:"icons8-ticket-50")
        buttonCircle2.addSubview(iconBooking)
        
        let buttonCircle3 = UIButton(frame: CGRect(x: 340, y: 5, width: 75, height: 75))
        buttonCircle3.layer.cornerRadius = 35.25
        buttonCircle3.backgroundColor = .white
        buttonCircle3.layer.shadowOpacity = 0.3
        buttonCircle3.layer.shadowOffset = .zero
        scrollView3.addSubview(buttonCircle3)
        
        let labelIcon4 = UILabel(frame: CGRect(x: 355, y: 70, width: 75, height: 50))
        labelIcon4.text = "Hottel"
        labelIcon4.font = UIFont.boldSystemFont(ofSize: 17)
        labelIcon4.textColor = .white
        scrollView3.addSubview(labelIcon4)
        
        let iconHottle = UIImageView(frame: CGRect(x: 18, y: 20 , width: 40, height: 40))
        iconHottle.image = UIImage(named:"icons8-hotel-50")
        buttonCircle3.addSubview(iconHottle)
        
        let labelIcon5 = UILabel(frame: CGRect(x: 460, y: 70, width: 75, height: 50))
        labelIcon5.text = "Explore"
        labelIcon5.font = UIFont.boldSystemFont(ofSize: 17)
        labelIcon5.textColor = .white
        scrollView3.addSubview(labelIcon5)
        
        let buttonCircle4 = UIButton(frame: CGRect(x: 450, y: 5, width: 75, height: 75))
        buttonCircle4.layer.cornerRadius = 35.5
        buttonCircle4.backgroundColor = .white
        buttonCircle4.layer.shadowOpacity = 0.3
        buttonCircle4.layer.shadowOffset = .zero
        scrollView3.addSubview(buttonCircle4)
        
        let iconExplore =  UIImageView(frame: CGRect(x: 18, y: 20 , width: 40, height: 40))
        iconExplore.image = UIImage(named:"icons8-compass-50")
        buttonCircle4.addSubview(iconExplore)
        
        let labelIcon6 = UILabel(frame: CGRect(x: 570, y: 70, width: 75, height: 50))
        labelIcon6.text = "History"
        labelIcon6.font = UIFont.boldSystemFont(ofSize: 17)
        labelIcon6.textColor = .white
        scrollView3.addSubview(labelIcon6)
        
        let buttonCircle5 = UIButton(frame: CGRect(x: 560, y: 5, width: 75, height: 75))
        buttonCircle5.layer.cornerRadius = 35.5
        buttonCircle5.backgroundColor = .white
        buttonCircle5.layer.shadowOpacity = 0.3
        buttonCircle5.layer.shadowOffset = .zero
        scrollView3.addSubview(buttonCircle5)
        
        let iconHistory =  UIImageView(frame: CGRect(x: 18, y: 20 , width: 40, height: 40))
        iconHistory.image = UIImage(named:"icons8-clock-settings-50")
        buttonCircle5.addSubview(iconHistory)
        
        let buttonCircle6 = UIButton(frame: CGRect(x: 670, y: 5, width: 75, height: 75))
        buttonCircle6.layer.cornerRadius = 35.5
        buttonCircle6.backgroundColor = .white
        buttonCircle6.layer.shadowOpacity = 0.3
        buttonCircle6.layer.shadowOffset = .zero
        scrollView3.addSubview(buttonCircle6)
        
        let labelIcon7 = UILabel(frame: CGRect(x: 690, y: 70, width: 75, height: 50))
        labelIcon7.text = "Cash"
        labelIcon7.font = UIFont.boldSystemFont(ofSize: 17)
        labelIcon7.textColor = .white
        scrollView3.addSubview(labelIcon7)
        
        let iconCash =  UIImageView(frame: CGRect(x: 18, y: 20 , width: 40, height: 40))
        iconCash.image = UIImage(named:"icons8-get-cash-50")
        buttonCircle6.addSubview(iconCash)
        
        let buttonCircle7 = UIButton(frame: CGRect(x: 780, y: 5, width: 75, height: 75))
        buttonCircle7.layer.cornerRadius = 35.5
        buttonCircle7.backgroundColor = .white
        buttonCircle7.layer.shadowOpacity = 0.3
        buttonCircle7.layer.shadowOffset = .zero
        scrollView3.addSubview(buttonCircle7)
        
        let labelIcon8 = UILabel(frame: CGRect(x: 800, y: 70, width: 75, height: 50))
        labelIcon8.text = "Map"
        labelIcon8.font = UIFont.boldSystemFont(ofSize: 17)
        labelIcon8.textColor = .white
        scrollView3.addSubview(labelIcon8)
        
        let iconMap =  UIImageView(frame: CGRect(x: 18, y: 20 , width: 40, height: 40))
        iconMap.image = UIImage(named:"icons8-map-50")
        buttonCircle7.addSubview(iconMap)
        
        let avaImage = UIImageView(frame: CGRect(x: 290, y: 245, width: 45, height: 45))
        avaImage.image = UIImage(named: "man")
        contentBackgroundView.addSubview(avaImage)
        
        let image1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        image1.image = UIImage(named: "Moutains")
        image1.layer.cornerRadius = 15
        
        
        let image2 = UIImageView(frame: CGRect(x: 400, y: 0, width: 400, height: 200))
        image2.image = UIImage(named: "SonLa")
        image2.layer.cornerRadius = 15
        
        let image3 = UIImageView(frame: CGRect(x: 800, y: 0, width: 400, height: 200))
        image3.image = UIImage(named: "Maps")
        image3.layer.cornerRadius = 15
        
        let list = UIButton(frame:CGRect(x: 30, y: 550, width: 310, height: 75))
        list.backgroundColor = .white
        list.layer.cornerRadius = 15
        list.layer.shadowOpacity = 0.1
        list.layer.shadowOffset = .zero
        
        let imageInspired = UIImageView(frame: CGRect(x: 10, y: 12, width: 50, height: 50))
        imageInspired.image = UIImage(named: "icons8-globe-50")
        list.addSubview(imageInspired)
        scrollMainView.addSubview(list)
        
        let titleLabel = UILabel(frame: CGRect(x: 70, y: 2, width: 200, height: 50))
        titleLabel.text = "Need help where to go ?"
        titleLabel.font = .systemFont(ofSize: 17)
        titleLabel.textColor = .lightGray
        list.addSubview(titleLabel)
        
        let titleLabel2 = UILabel(frame: CGRect(x: 70, y: 24, width: 200, height: 50))
        titleLabel2.text = "Find great destination"
        titleLabel2.font = .boldSystemFont(ofSize: 17)
        titleLabel2.textColor = .black
        list.addSubview(titleLabel2)
        
        let imageLastLabel = UIImageView(frame: CGRect(x: 270, y: 22, width: 30, height: 30))
        imageLastLabel.image = UIImage(named: "icons8-back-30 1")
        list.addSubview(imageLastLabel)
       
        
        
        title = "Home"
        
        scrollView.addSubview(image1)
        scrollView.addSubview(image2)
        scrollView.addSubview(image3)
        imageBlog.addSubview(labelHint4)
        imageBlog.addSubview(labelHint5)
        imageBlog.addSubview(buttonReadMore)
        imageBlog2.addSubview(labelHint6)
        imageBlog2.addSubview(labelHint7)
        imageBlog2.addSubview(buttonReadMore2)
        scrollMainView.addSubview(imageBlog2)
        scrollMainView.addSubview(labelCate)
        scrollMainView.addSubview(labelMain)
        scrollMainView.addSubview(labelRecommend)
        scrollMainView.addSubview(scrollView2)
        
        scrollMainView.addSubview(imageBlog)
        scrollView2.addSubview(label1)
        label1.addSubview(imageVoucher)
        image2.addSubview(labelHint)
        image3.addSubview(labelHint2)
        image1.addSubview(labelHint3)
        
        
       
    }
    func configure() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Home"
    }
   
}
