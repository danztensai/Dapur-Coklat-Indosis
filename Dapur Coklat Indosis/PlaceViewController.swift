//
//  PlaceViewController.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 5/14/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //Mark : Properties
    @IBOutlet weak var tableView: UITableView!
    
    //Mark : Variable
     let animals = ["Cat", "Dog", "Cow", "Mulval"]
     let placeName = ["Kebayoran","Menteng","Greenville","Kelapa Gading","Tebet","Alam Sutera"]
     let placeImageURL = ["http://122.129.112.169/portal/BAW_DESIGN/dapur_cokelat/images/dc-dahlan1_630.jpg","http://122.129.112.169/portal/BAW_DESIGN/dapur_cokelat/images/dc-menteng_630.jpg?","http://122.129.112.169/portal/BAW_DESIGN/dapur_cokelat/images/dc-greenvile_630.jpg","http://122.129.112.169/portal/BAW_DESIGN/dapur_cokelat/images/dc-greenvile_630.jpg","http://122.129.112.169/portal/BAW_DESIGN/dapur_cokelat/images/dc-gading_630.jpg","http://122.129.112.169/portal/BAW_DESIGN/dapur_cokelat/images/dc-tebet1_630-crop-u132122.jpg","http://122.129.112.169/portal/BAW_DESIGN/dapur_cokelat/images/dc-gading_630.jpg"]
    let placeAddress = ["Jl. K.H. Ahmad Dahlan No. 12 Jakarta Selatan 12130",
                        "Jl. H.O.S. Cokroaminoto No. 62A Jakarta Pusat 10310",
                        "Jl. K.H. Ahmad Dahlan No. 12 Jakarta Selatan 12130",
                        "Jl. Kelapa Nias Raya blok QE-1 no. 3 Kelapa Gading Jakarta Utara 14240",
                        "Jl. Tebet Barat Dalam no. 43 Jakarta Selatan 12810",
                        "JRuko Town Center 10B no.6 Alam Sutera - Serpong 15235"]
   
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 130.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cellPlace"
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "CakeCategoryTableViewCell"/*Identifier*/, for: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlaceTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        //cell.textLabel?.text = cake_category[indexPath.row]
       // animals.cakeLabel.text = animals[indexPath.row]
        //animals.cakeDescription.text = animals[indexPath.row]
        //animals.cakeImage.image = animals[indexPath.row]
        cell.placeName.text = placeName[indexPath.row]
        let urlString = placeImageURL[indexPath.row]
        var escapedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)

        let url = URL(string: urlString)!
        //cell.cakeImage.kf.setImage(with: url)
        let image = UIImage(named: "placeholder")
        cell.placeImage.kf.setImage(with: url, placeholder: image)
        cell.placeAddress.text = placeAddress[indexPath.row]
        cell.placeWorkingHours.text = "Everyday 8am - 10pm"
        return cell
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
