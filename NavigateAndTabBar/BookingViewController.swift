//
//  BookingViewController.swift
//  NavigateAndTabBar
//
//  Created by Apple on 19/09/2021.
//

import UIKit
import MapKit
import CoreLocation
class BookingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure ()
        
        let scrollMainView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 375, height: 3000))
        scrollMainView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        view.addSubview(scrollMainView)
        scrollMainView.contentSize = CGSize(width: 0, height: 3080)
        
        
        
        let avaImage = UIImageView(frame: CGRect(x: 295, y: 100, width: 40, height: 40))
        avaImage.image = UIImage(named:"man")
        
       
    
        
        let iconBooking = UIImageView(frame: CGRect(x: 5, y: 5 , width: 40, height: 40))
        iconBooking.image = UIImage(named:"booking")
        
        let labelBooking = UILabel(frame: CGRect(x: 30, y: 435, width: 150, height: 50))
        labelBooking.text = "Booking"
        labelBooking.font = .systemFont(ofSize: 14)
        scrollMainView.addSubview(labelBooking)
        
        let iconLike = UIImageView(frame: CGRect(x: 5, y: 5 , width: 40, height: 40))
        iconLike.image = UIImage(named:"love")
        
        let labelLike = UILabel(frame: CGRect(x: 125, y: 435, width: 150, height: 50))
        labelLike.text = "Like"
        labelLike.font = .systemFont(ofSize: 14)
        scrollMainView.addSubview(labelLike)
        
        let iconPlans = UIImageView(frame:CGRect(x: 5, y: 5 , width: 40, height: 40))
        iconPlans.image = UIImage(named:"plans")
        
        let labelPlan = UILabel(frame: CGRect(x: 215, y: 435, width: 150, height: 50))
        labelPlan.text = "Plans"
        labelPlan.font = .systemFont(ofSize: 14)
        scrollMainView.addSubview(labelPlan)
        
        let iconService = UIImageView(frame: CGRect(x: 5, y: 5 , width: 40, height: 40))
        iconService.image = UIImage(named:"service")
        
        let labelServices = UILabel(frame: CGRect(x: 295, y: 435, width: 150, height: 50))
        labelServices.text = "Services"
        labelServices.font = .systemFont(ofSize: 14)
        scrollMainView.addSubview(labelServices)
        
        let contentView = UIView(frame:CGRect(x: 0, y: -147, width: 375, height: 250))
        contentView.backgroundColor = UIColor(red: 0.00, green: 0.82, blue: 1.00, alpha: 1.00)
        scrollMainView.addSubview(contentView)
        
        let labelWelcome = UILabel(frame: CGRect(x: 20, y: 130, width: 150, height: 50))
        labelWelcome.text = "Hello,Thành Nguyễn !"
        labelWelcome.textColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        labelWelcome.attributedText = NSAttributedString(string: "  Hello,Thành Nguyễn!", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        labelWelcome.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(labelWelcome)
        
        let lineImage = UIImageView(frame: CGRect(x: 295, y: 100, width: 40, height: 40))
        lineImage.image = UIImage(named:"Line 29-1")
        
        
        
        
        let contentView2 = UIView(frame:CGRect(x: 30, y: 50, width: 315, height: 300))
        contentView2.backgroundColor = .white
        contentView2.layer.shadowOpacity = 0.15
        contentView2.layer.cornerRadius = 15
        scrollMainView.addSubview(contentView2)
        
        let buttonIcon1 = UIButton(frame:CGRect(x: 30, y: 400, width: 50, height: 50))
        buttonIcon1.backgroundColor = .white
        buttonIcon1.layer.borderWidth = 0.5
        buttonIcon1.layer.borderColor = UIColor.lightGray.cgColor
        buttonIcon1.layer.cornerRadius = 10
        scrollMainView.addSubview(buttonIcon1)
        buttonIcon1.addSubview(iconBooking)
        buttonIcon1.addTarget(self, action: #selector(didTapMyBooking), for: .touchUpInside)
        
        let buttonIcon2 = UIButton(frame:CGRect(x: 115, y: 400, width: 50, height: 50))
        buttonIcon2.backgroundColor = .white
        buttonIcon2.layer.borderWidth = 0.5
        buttonIcon2.layer.borderColor = UIColor.lightGray.cgColor
        buttonIcon2.layer.cornerRadius = 10
        scrollMainView.addSubview(buttonIcon2)
        buttonIcon2.addSubview(iconLike)
        buttonIcon2.addTarget(self, action: #selector(didTapMyLike), for: .touchUpInside)
        
        
        let buttonIcon3 = UIButton(frame:CGRect(x: 209, y: 400, width: 50, height: 50))
        buttonIcon3.backgroundColor = .white
        buttonIcon3.layer.borderWidth = 0.5
        buttonIcon3.layer.borderColor = UIColor.lightGray.cgColor
        buttonIcon3.layer.cornerRadius = 10
        scrollMainView.addSubview(buttonIcon3)
        buttonIcon3.addSubview(iconPlans)
        buttonIcon3.addTarget(self, action: #selector(didTapMyPlans), for: .touchUpInside)
        
        
        let buttonIcon4 = UIButton(frame:CGRect(x: 297, y: 400, width: 50, height: 50))
        buttonIcon4.backgroundColor = .white
        buttonIcon4.layer.borderWidth = 0.5
        buttonIcon4.layer.borderColor = UIColor.lightGray.cgColor
        buttonIcon4.layer.cornerRadius = 10
        scrollMainView.addSubview(buttonIcon4)
        buttonIcon4.addSubview(iconService)
        
   //     let buttonSearch = UIView(frame:CGRect(x: 150, y: 265, width: 75, height: 75))
     //   buttonSearch.backgroundColor = UIColor(red: 0.97, green: 0.83, blue: 0.33, alpha: 1.00)
       // buttonSearch.layer.borderWidth = 0.5
       // buttonSearch.layer.borderColor = UIColor.lightGray.cgColor
       // buttonSearch.layer.cornerRadius = 38
      //  scrollMainView.addSubview(buttonSearch)
        
        let labelList = UILabel(frame: CGRect(x: 20, y: 475, width: 150, height: 50))
        labelList.text = "Best deal"
        labelList.textColor = .black
        labelList.attributedText = NSAttributedString(string: "Best deal", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        labelList.font = UIFont.boldSystemFont(ofSize: 20)
        scrollMainView.addSubview(labelList)
        contentView.addSubview(avaImage)
        
        let labelFrom = UILabel(frame: CGRect(x: 20, y: 10, width: 150, height: 50))
        labelFrom.text = "From"
        labelFrom.textColor = UIColor(red: 0.69, green: 0.69, blue: 0.69, alpha: 1.00)
        labelFrom.font = UIFont.systemFont(ofSize: 18)
        contentView2.addSubview(labelFrom)
        
        let labelPlace = UILabel(frame: CGRect(x: 20, y: 50, width: 150, height: 50))
        labelPlace.text = "Hanoi"
        labelPlace.textColor = .black
        labelPlace.font = UIFont.boldSystemFont(ofSize: 20)
        contentView2.addSubview(labelPlace)
        
        let labelTo = UILabel(frame: CGRect(x: 180, y: 10, width: 150, height: 50))
        labelTo.text = "To"
        labelTo.textColor = UIColor(red: 0.69, green: 0.69, blue: 0.69, alpha: 1.00)
        labelTo.font = UIFont.systemFont(ofSize: 18)
        contentView2.addSubview(labelTo)
        
        let labelPlace2 = UILabel(frame: CGRect(x: 180, y: 50, width: 150, height: 50))
        labelPlace2.text = "Phu Quoc"
        labelPlace2.textColor = .black
        labelPlace2.font = UIFont.boldSystemFont(ofSize: 20)
        contentView2.addSubview(labelPlace2)
        
        let labelDate = UILabel(frame: CGRect(x: 20, y: 100, width: 150, height: 50))
        labelDate.text = "Date"
        labelDate.textColor = UIColor(red: 0.69, green: 0.69, blue: 0.69, alpha: 1.00)
        labelDate.font = UIFont.systemFont(ofSize: 18)
        contentView2.addSubview(labelDate)
        
        let labelDOB = UILabel(frame: CGRect(x: 20, y: 140, width: 150, height: 50))
        labelDOB.text = "01/07/2019"
        labelDOB.textColor = .black
        labelDOB.font = UIFont.boldSystemFont(ofSize: 20)
        contentView2.addSubview(labelDOB)
        
        
        let labelDateReturn = UILabel(frame: CGRect(x: 180, y: 100, width: 150, height: 50))
        labelDateReturn.text = "Return"
        labelDateReturn.textColor = UIColor(red: 0.69, green: 0.69, blue: 0.69, alpha: 1.00)
        labelDateReturn.font = UIFont.systemFont(ofSize: 18)
        contentView2.addSubview(labelDateReturn)
        
        let labelDOR = UILabel(frame: CGRect(x: 180, y: 140, width: 150, height: 50))
        labelDOR.text = "01/07/2019"
        labelDOR.textColor = .black
        labelDOR.font = UIFont.boldSystemFont(ofSize: 20)
        contentView2.addSubview(labelDOR)
        
        let labelPassenger = UILabel(frame: CGRect(x: 20, y: 190, width: 150, height: 50))
        labelPassenger.text = "Passenger"
        labelPassenger.textColor = UIColor(red: 0.69, green: 0.69, blue: 0.69, alpha: 1.00)
        labelPassenger.font = UIFont.systemFont(ofSize: 18)
        contentView2.addSubview(labelPassenger)
        
        let labelQuantity = UILabel(frame: CGRect(x: 20, y: 230, width: 150, height: 50))
        labelQuantity.text = "2 adults, 1 child"
        labelQuantity.textColor = .black
        labelQuantity.font = UIFont.boldSystemFont(ofSize: 20)
        contentView2.addSubview(labelQuantity)
        
        let labelClass = UILabel(frame: CGRect(x: 180, y: 190, width: 150, height: 50))
        labelClass.text = "Class"
        labelClass.textColor = UIColor(red: 0.69, green: 0.69, blue: 0.69, alpha: 1.00)
        labelClass.font = UIFont.systemFont(ofSize: 18)
        contentView2.addSubview(labelClass)
        
        let labelType = UILabel(frame: CGRect(x: 180, y: 230, width: 150, height: 50))
        labelType.text = "Family"
        labelType.textColor = .black
        labelType.font = UIFont.boldSystemFont(ofSize: 20)
        contentView2.addSubview(labelType)
        
        let list2 = UIView(frame:CGRect(x: 30, y: 550, width: 310, height: 114))
        list2.backgroundColor = .white
        list2.layer.cornerRadius = 15
        list2.layer.shadowOpacity = 0.1
        list2.layer.shadowOffset = .zero
        scrollMainView.addSubview(list2)
        
        let list3 = UIView(frame:CGRect(x: 30, y: 675, width: 310, height: 114))
        list3.backgroundColor = .white
        list3.layer.cornerRadius = 15
        list3.layer.shadowOpacity = 0.1
        list3.layer.shadowOffset = .zero
        scrollMainView.addSubview(list3)
        
        let image = UIImageView(frame: CGRect(x: 10, y: 15, width: 95, height: 80))
        image.image = UIImage(named: "paris-2")
        image.layer.cornerRadius = 15
        
        let labelName1 = UILabel(frame: CGRect(x: 120, y: 5, width: 70, height: 60))
        labelName1.text = "Paris"
        labelName1.font = .boldSystemFont(ofSize: 21)
        labelName1.textColor = .black
        
        let labelName2 = UILabel(frame: CGRect(x: 120, y: 40, width: 200, height: 60))
        labelName2.text = "From 50$ - 180$ "
        labelName2.font = .systemFont(ofSize: 18)
        labelName2.textColor = .black
        
        let imageLastLabel = UIImageView(frame: CGRect(x: 275, y: 40, width: 30, height: 30))
        imageLastLabel.image = UIImage(named: "icons8-back-30 1")
        list2.addSubview(imageLastLabel)
        
        list2.addSubview(labelName1)
        list2.addSubview(image)
        list2.addSubview(labelName2)
        
        let image2 = UIImageView(frame: CGRect(x: 10, y: 15, width: 95, height: 80))
        image2.image = UIImage(named: "bordeaux")
        image2.layer.cornerRadius = 15
       
        
        let labelName3 = UILabel(frame: CGRect(x: 120, y: 5, width: 150, height: 60))
        labelName3.text = "Bordeaux"
        labelName3.font = .boldSystemFont(ofSize: 21)
        labelName3.textColor = .black
        
        let labelName4 = UILabel(frame: CGRect(x: 120, y: 40, width: 200, height: 60))
        labelName4.text = "From 70$ - 210$ "
        labelName4.font = .systemFont(ofSize: 18)
        
        let imageLastLabel2 = UIImageView(frame: CGRect(x: 275, y: 40, width: 30, height: 30))
        imageLastLabel2.image = UIImage(named: "icons8-back-30 1")
        list3.addSubview(imageLastLabel2)
        
        list3.addSubview(image2)
        list3.addSubview(labelName3)
        list3.addSubview(labelName4)
        
        view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
       title = "Booking"
    }
   @objc func didTapMyBooking () {
    let vc = MBViewController ()
    self.navigationController?.pushViewController(vc, animated: true)
   }
    
    @objc func didTapMyLike () {
        let vc1 = LikeViewController ()
        self.navigationController?.pushViewController(vc1, animated: true)
    }
    @objc func didTapMyPlans () {
        let vc2 = JourneyViewController ()
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    func configure() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Search "
    }
   

}
class MBViewController: UIViewController, UIViewControllerTransitioningDelegate {
    override func viewDidLoad() {
           super.viewDidLoad()
        view.backgroundColor = .white
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 375, height: 3000))
        scrollView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: 0, height: 500)
        
        let myBookingLabel = UILabel (frame: CGRect(x: 20, y: -50, width: 200, height: 100))
        myBookingLabel.textColor = .black
        myBookingLabel.text = "My booking"
        myBookingLabel.font = .boldSystemFont(ofSize: 30)
        scrollView.addSubview(myBookingLabel)
        
        let image = UIImageView (frame: CGRect(x: 40, y: 70, width: 300, height: 150))
        image.image = UIImage(named: "SaiGon-1")
        image.layer.cornerRadius = 50
        scrollView.addSubview(image)
        
        let icon3dot = UIImageView (frame: CGRect(x: 250, y: 100, width: 20, height: 20))
        icon3dot.image = UIImage(named: "3dots")
        icon3dot.layer.cornerRadius = 50
        image.addSubview(icon3dot)
        
        let rect = UIImageView (frame: CGRect(x: 25, y: 90, width: 100, height: 40))
        rect.image = UIImage(named: "rect")
        rect.layer.cornerRadius = 50
        image.addSubview(rect)
        
        let labelImage = UILabel (frame: CGRect(x: 25, y: 5, width: 100, height: 50))
        labelImage.text = "Sài Gòn"
        labelImage.textColor = .white
        labelImage.font = .boldSystemFont(ofSize: 24)
        image.addSubview(labelImage)
        
        let labelImage1 = UILabel (frame: CGRect(x: 25, y: 30, width: 200, height: 50))
        labelImage1.text = "20 September 2021,12:00PM"
        labelImage1.textColor = .white
        labelImage1.font = .systemFont(ofSize: 15)
        image.addSubview(labelImage1)
        
        let labelStatus = UILabel (frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        labelStatus.text = "In progress"
        labelStatus.textColor =  UIColor(red: 0.97, green: 0.83, blue: 0.33, alpha: 1.00)
        labelStatus.font = .systemFont(ofSize: 15)
        labelStatus.textAlignment = .center
        rect.addSubview(labelStatus)
        
    }
    
    
}
class LikeViewController : UIViewController {
    override func viewDidLoad() {
           super.viewDidLoad()
        view.backgroundColor = .white
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 375, height: 3000))
        scrollView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: 0, height: 500)
        
        let myBookingLabel = UILabel (frame: CGRect(x: 20, y: -50, width: 200, height: 100))
        myBookingLabel.textColor = .black
        myBookingLabel.text = "Like list"
        myBookingLabel.font = .boldSystemFont(ofSize: 30)
        scrollView.addSubview(myBookingLabel)
        
        let image = UIImageView (frame: CGRect(x: 40, y: 70, width: 300, height: 120))
        image.image = UIImage(named: "train")
        scrollView.addSubview(image)
        
        let image2 = UIImageView (frame: CGRect(x: 40, y: 200, width: 300, height: 120))
        image2.image = UIImage(named: "plane")
        scrollView.addSubview(image2)
        
        let trainImage = UIImageView (frame: CGRect(x: 200, y: 30, width: 75, height: 75))
        trainImage.image = UIImage(named: "icons8-train-100")
        image.addSubview(trainImage)
        
        let planeImage = UIImageView (frame: CGRect(x: 200, y: 30, width: 75, height: 75))
        planeImage.image = UIImage(named: "icons8-plane-100")
        image2.addSubview(planeImage)
        
        
        let rect = UIImageView (frame: CGRect(x: 30, y: 65, width: 100, height: 40))
        rect.image = UIImage(named: "rect")
        rect.layer.cornerRadius = 30
        image.addSubview(rect)
        
        let labelImage = UILabel (frame: CGRect(x: 30, y: 5, width: 100, height: 50))
        labelImage.text = "Sài Gòn"
        labelImage.textColor = .white
        labelImage.font = .boldSystemFont(ofSize: 24)
        image.addSubview(labelImage)
        
        let labelStatus = UILabel (frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        labelStatus.text = "1 saves"
        labelStatus.textColor =  .black
        labelStatus.font = .systemFont(ofSize: 15)
        labelStatus.textAlignment = .center
        rect.addSubview(labelStatus)
        
       
        
        let rect1 = UIImageView (frame: CGRect(x: 30, y: 65, width: 100, height: 40))
        rect1.image = UIImage(named: "rect")
        rect1.layer.cornerRadius = 30
        image2.addSubview(rect1)
        
        let labelImage2 = UILabel (frame: CGRect(x: 30, y: 5, width: 100, height: 50))
        labelImage2.text = "Sài Gòn"
        labelImage2.textColor = .white
        labelImage2.font = .boldSystemFont(ofSize: 24)
        image2.addSubview(labelImage2)
        
        
        
        let labelStatus2 = UILabel (frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        labelStatus2.text = "1 saves"
        labelStatus2.textColor =  .black
        labelStatus2.font = .systemFont(ofSize: 15)
        labelStatus2.textAlignment = .center
        rect1.addSubview(labelStatus2)
        
    }
    
}



class JourneyViewController: UIViewController {
    

    override func viewDidLoad() {
           super.viewDidLoad()
        view.backgroundColor = .white
        
        
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 375, height: 3000))
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: 0, height: 2000)
        
        let scrollView1 = UIScrollView(frame: CGRect(x: 0, y: -10, width: 500, height: 60))
        scrollView1.backgroundColor = .white
        scrollView.addSubview(scrollView1)
        scrollView1.contentSize = CGSize(width: 500, height: 0)
        
        let buttonAdd = UIButton(frame: CGRect(x: 10, y: 0, width: 170, height: 60))
        buttonAdd.layer.cornerRadius = 20
        buttonAdd.layer.borderWidth = 0.5
        buttonAdd.backgroundColor = .white
        buttonAdd.layer.borderColor = UIColor(red: 0.00, green: 0.82, blue: 1.00, alpha: 1.00).cgColor
        buttonAdd.setTitle("       Add places", for: .normal)
        buttonAdd.setTitleColor(.black, for: .normal)
        scrollView1.addSubview(buttonAdd)
        buttonAdd.addTarget(self, action: #selector(TapListAdd), for: .touchUpInside)
        let iconAddPlace = UIImageView(frame: CGRect(x: 10, y: 10 , width: 40, height: 40))
        iconAddPlace.image = UIImage(named:"icons8-add-image-48")
        buttonAdd.addSubview(iconAddPlace)
        
        
        let buttonMap = UIButton(frame: CGRect(x: 200, y: 0, width: 170, height: 60))
        buttonMap.layer.cornerRadius = 20
        buttonMap.layer.borderWidth = 0.5
        buttonMap.backgroundColor = UIColor(red: 0.00, green: 0.82, blue: 1.00, alpha: 1.00)
        buttonMap.layer.borderColor = UIColor(red: 0.00, green: 0.82, blue: 1.00, alpha: 1.00).cgColor
        buttonMap.setTitle("        View Map", for: .normal)
        buttonMap.setTitleColor(.white, for: .normal)
        scrollView1.addSubview(buttonMap)
        buttonMap.addTarget(self, action: #selector(TapMap), for: .touchUpInside)
        
        let iconViewMap = UIImageView(frame: CGRect(x: 10, y: 10 , width: 40, height: 40))
        iconViewMap.image = UIImage(named:"icons8-location-64")
        buttonMap.addSubview(iconViewMap)
        
        let image1 = UIImageView(frame: CGRect(x: -5, y: 100, width: 375, height: 300))
        image1.image = UIImage(named: "city")
        scrollView.addSubview(image1)
    }
    @objc func TapMap () {
        let vc1 = MapViewController ()
        self.navigationController?.pushViewController(vc1, animated: true)
    }
    @objc func TapListAdd () {
        let vc2 = ListViewController ()
        self.navigationController?.pushViewController(vc2, animated: true)
    }
}
class MapViewController: UIViewController {
    
    var locationManager: CLLocationManager!
    var mapView: MKMapView!
    
    let centerMapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "pen-tool").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleCenterLocation), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationManager()
        configureMapView()
        enableLocationServices()
        
        
    }
    @objc func handleCenterLocation() {
        centerMapOnUserLocation()
        centerMapButton.alpha = 0
    }
    func configureLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
    
    
    func configureMap() {
        mapView = MKMapView ()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
    
    
    func configureMapView() {
        mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.userTrackingMode = .follow
        
        view.addSubview(mapView)
        mapView.frame = view.frame
        
        view.addSubview(centerMapButton)
        centerMapButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44).isActive = true
        centerMapButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        centerMapButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        centerMapButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        centerMapButton.layer.cornerRadius = 50 / 2
        centerMapButton.alpha = 0
    }
    
    func centerMapOnUserLocation() {
        guard let coordinate = locationManager.location?.coordinate else { return }
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 0, longitudinalMeters: 0)
        mapView.setRegion(region, animated: true)
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.centerMapButton.alpha = 1
        }
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    func enableLocationServices() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            print("Location auth status is NOT DETERMINED")
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location auth status is RESTRICTED")
        case .denied:
            print("Location auth status is DENIED")
        case .authorizedAlways:
            print("Location auth status is AUTHORIZED ALWAYS")
        case .authorizedWhenInUse:
            print("Location auth status is AUTHORIZED WHEN IN USE")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard locationManager.location != nil else { return }
        centerMapOnUserLocation()
    }
    
}
