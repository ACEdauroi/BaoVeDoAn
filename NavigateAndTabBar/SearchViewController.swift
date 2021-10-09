//
//  SearchViewController.swift
//  NavigateAndTabBar
//
//  Created by Apple on 15/09/2021.
//

import UIKit
import TTGTags
class SearchViewController: UIViewController, UISearchResultsUpdating{
let searchContronller = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        configure ()
        
      
        
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 00, width: view.frame.size.height - 20, height: view.frame.size.height - 20))
        scrollView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: 0, height: 1350)
        title = "Search"
        searchContronller.searchResultsUpdater = self
        navigationItem.searchController = searchContronller
        
        let tagView = TTGTextTagCollectionView.init(frame: CGRect.init(x: 16, y: 50, width: UIScreen.main.bounds.width - 32, height: 120))
        tagView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        scrollView.addSubview(tagView)
        
        let strings = ["Active Adventure Tours","Family Tours","National Parks Tours","Religious Tours","Themed or Special Event Vacations"]
        
        for text in strings {
            let content = TTGTextTagStringContent.init(text: text)
            content.textColor = UIColor.black
            content.textFont = UIFont.systemFont(ofSize: 18)
            
            let normalStyle = TTGTextTagStyle.init()
            normalStyle.backgroundColor = UIColor.white
            normalStyle.extraSpace = CGSize.init(width: 8, height: 8)
            
            let selectedStyle = TTGTextTagStyle.init()
            selectedStyle.backgroundColor = UIColor(red: 0.30, green: 0.83, blue: 0.95, alpha: 1.00)
            selectedStyle.extraSpace = CGSize.init(width: 8, height: 8)
            
            let tag = TTGTextTag.init()
            tag.content = content
            tag.style = normalStyle
            tag.selectedStyle = selectedStyle
            
            tagView.addTag(tag)
            
            let image = UIImageView(frame: CGRect(x: 35, y: 200, width: 300, height: 300))
            image.image = UIImage(named:"Asian")
            image.layer.cornerRadius = 50
            image.layer.shadowOpacity = 0.15
            image.layer.shadowOffset = .zero
            scrollView.addSubview(image)
            
            let Label1 = UILabel(frame: CGRect(x: 100, y: 0, width: 300, height: 300))
            Label1.text = "Asian"
            Label1.textColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
            Label1.layer.shadowOpacity = 0.2
            Label1.font = .boldSystemFont(ofSize: 35)
            image.addSubview(Label1)
            
            
            let image2 = UIImageView(frame: CGRect(x: 35, y: 550, width: 300, height: 300   ))
            image2.image = UIImage(named:"Euro")
            image2.layer.shadowOpacity = 0.15
            image2.layer.shadowOffset = .zero
            image2.layer.cornerRadius = 50
            scrollView.addSubview(image2)

            let Label2 = UILabel(frame: CGRect(x: 110, y: 5, width: 300, height: 300))
            Label2.text = "Euro"
            Label2.textColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
            Label2.layer.shadowOpacity = 0.2
            Label2.font = .boldSystemFont(ofSize: 35)
            image2.addSubview(Label2)

            let image3 = UIImageView(frame: CGRect(x: 35, y: 900, width: 300, height: 300))
            image3.image = UIImage(named:"Africa")
            image3.layer.shadowOpacity = 0.15
            image3.layer.shadowOffset = .zero
            image3.layer.cornerRadius = 50
            scrollView.addSubview(image3)

            let avaImage = UIImageView(frame: CGRect(x: 300, y: -115, width: 40, height: 40))
            avaImage.image = UIImage(named:"man")
            scrollView.addSubview(avaImage)
            
        }
        tagView.reload()
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchContronller.searchBar.text else {
            return
        }
        print (text)
    }
    func configure() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.title = "Search "
    }
    

}
