//
//  ViewController.swift
//  ImageSlideshow
//
//  Created by Petr Zvoníček on 30.07.15.
//  Copyright (c) 2015 Petr Zvonicek. All rights reserved.
//

import UIKit
import ImageSlideshow

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var slideshow: ImageSlideshow!
    
    
    let cake_category = ["Regular Cakes","Praline","Snack","Chocolate Corner"]
    let cake_description = ["A Whole of Happiness you can share with others","All Kind of Chocolate with various paste and lovely taste","Your True Friend For Every Situation","A Unique & Outstanding for your special events"];
    let cake_image = [UIImage(named: "regular cake"),UIImage(named: "praline"),UIImage(named: "snack"),UIImage(named: "chocolateCorner")]
    
    let localSource = [ImageSource(imageString: "img1")!, ImageSource(imageString: "img2")!, ImageSource(imageString: "img3")!, ImageSource(imageString: "img4")!]
    let afNetworkingSource = [AFURLSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AFURLSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AFURLSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    let alamofireSource = [AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    let sdWebImageSource = [SDWebImageSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    let kingfisherSource = [KingfisherSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let session_key = defaults.object(forKey: "key_session") as! String
        
        print("Session Key From Persistence : "+session_key)
        
        slideshow.backgroundColor = UIColor.white
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = PageControlPosition.underScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        slideshow.pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.currentPageChanged = { page in
            print("current page:", page)
        }
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideshow.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(MainViewController.didTap))
        slideshow.addGestureRecognizer(recognizer)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cake_category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CakeCategoryTableViewCell"
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "CakeCategoryTableViewCell"/*Identifier*/, for: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CakeCategoryTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        //cell.textLabel?.text = cake_category[indexPath.row]
        cell.cakeLabel.text = cake_category[indexPath.row]
        cell.cakeDescription.text = cake_description[indexPath.row]
        cell.cakeImage.image = cake_image[indexPath.row]
        return cell
    }
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    override func viewDidAppear(_ animated: Bool) {
        // 1
        let nav = self.navigationController?.navigationBar
        
        // 2
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow
        
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        // 4
        let image = UIImage(named: "logo-dapur-coklat")
        imageView.image = image
        
        // 5
        navigationItem.titleView = imageView
    }
    
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
}

