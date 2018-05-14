//
//  CakeOrderViewController.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 5/8/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import UIKit
import DropDown
import Kingfisher


class CakeOrderViewController: UIViewController,UITextFieldDelegate {

    //MARK:Properties
    @IBOutlet weak var sizeDropdown: UIButton!
    @IBOutlet weak var cakeDescription: UILabel!
    
    @IBOutlet weak var cakeImage: UIImageView!
    var cake:Cake? = nil
    var sizeIndex:Int?
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var notesTxt: UITextView!
    @IBOutlet weak var greetingTxt: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK:Dropdown
    let dropDown_size = DropDown()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = CGSize(width:self.view.frame.width,height: self.view.frame.height+100)
        
        notesTxt.layer.borderColor = UIColor.brown.cgColor
        notesTxt.layer.borderWidth = 1.0
        
        
        
        scrollView.contentSize = size
        textField.delegate = self
        setupDropdownSize()
        self.cakeDescription.text = cake?.description
        var urlString = cake?.imageURL
        var escapedString = urlString?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        print("Hasil Encoding : "+escapedString!)
        let url = URL(string: urlString!)!
        //cell.cakeImage.kf.setImage(with: url)
        let image = UIImage(named: "placeholder")
        self.cakeImage.kf.setImage(with: url, placeholder: image)
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text)
        let price = cake?.variant[sizeIndex!].price
        print(price)
        var totalPrice = price! * Int(textField.text!)!
        print(totalPrice)
        self.totalPriceLabel.text = "Rp."+String(totalPrice)
    }
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        // 1
        let nav = self.navigationController?.navigationBar
        
        // 2
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.brown
        // 5
        navigationItem.title = cake?.product
    }
    func setupDropdownSize()
    {
        dropDown_size.anchorView = sizeDropdown
        dropDown_size.bottomOffset = CGPoint(x: 0, y: sizeDropdown.bounds.height)
        var price = [String]()
        for element in cake!.variant {
            
            price.append(element.size)
            
        }
        dropDown_size.dataSource = price
        dropDown_size.selectionAction = { [weak self] (index, item) in
        self?.sizeDropdown.setTitle(item, for: .normal)
            self?.sizeIndex = index
            
        }
        
        dropDown_size.multiSelectionAction = { [weak self] (indices, items) in
            print("Muti selection action called with: \(items)")
            if items.isEmpty {
                self?.sizeDropdown.setTitle("", for: .normal)
            }
        }
    }

    @IBAction func choosePrice(_ sender: UIButton) {
        
        dropDown_size.show()
        
    }
    
    @IBAction func addToCartBtn(_ sender: UIButton) {
        print("Touch Add To Cart")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
