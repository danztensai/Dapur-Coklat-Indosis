//
//  CakeViewController.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 4/17/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import os.log

class CakeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //MARK : Properties
    let animals = ["Cat", "Dog", "Cow", "Mulval"]
    
    var cakeArray = [Cake]()
    var cakeCategory:String = ""
    
    
    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cakeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CakeTableViewCell"
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "CakeCategoryTableViewCell"/*Identifier*/, for: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CakeTableViewCell  else {
            fatalError("The dequeued cell is not an instance of cakeViewCell.")
        }
        //cell.textLabel?.text = cake_category[indexPath.row]
        let cakeObj = cakeArray[indexPath.row]
        cell.cakeLabel.text = cakeObj.product
        print(cakeObj.imageURL)
        var urlString = cakeObj.imageURL
        var escapedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        print("Hasil Encoding : "+escapedString!)
        let url = URL(string: urlString)!
        //cell.cakeImage.kf.setImage(with: url)
        let image = UIImage(named: "placeholder")
        cell.cakeImage.kf.setImage(with: url, placeholder: image)
        print(cakeObj.product)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Load Initial Data")
        print("From Segue "+cakeCategory)
        loadInitialDataFromJson(category : cakeCategory)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadInitialDataFromJson(category:String)
    {
        APIManager.sharedInstance.getCakeByCategory(category: category, onSuccess: {json in DispatchQueue.main.async {
            let status = json["status"].stringValue
            //let message = json["message"].stringValue
            
            
            if status == "OK"
            {
                
                for (key, subJson) in json["list_produk"] {
                    //print(subJson["id_product"])
                    var arrayVariant = [Variant]()
                    for(key,subsJson) in subJson["data"]{
                        arrayVariant.append(Variant(size:subsJson["size"].stringValue,price:subsJson["price"].intValue)!)
                        //print(subsJson["size"].stringValue)
                    }
                    self.cakeArray.append(Cake(id_product:subJson["id_product"].stringValue,product:subJson["product"].stringValue,description:subJson["description"].stringValue,imageURL:subJson["images"].stringValue,variant:arrayVariant)!)
                    
                }
                
                self.tableView.reloadData()
            }else{
                print("Not Ok")
            }
            
            }}, onFailure: {error in let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.show(alert, sender: nil)
        })
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 124.0;//Choose your custom row height
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "orderCake" :
            print("Inside cake Order Segue")
            guard let CakeOrderViewController = segue.destination as? CakeOrderViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedMealCell = sender as? CakeTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
          //  let selectedCake = cake_category[indexPath.row]
                let cakeArraySend = self.cakeArray[indexPath.row]
          //  CakeViewController.cakeCategory = selectedCake;
                CakeOrderViewController.cake = cakeArraySend
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
            
        }
    }
    

}
