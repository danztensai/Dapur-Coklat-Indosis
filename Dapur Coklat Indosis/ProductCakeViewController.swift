//
//  ProductCakeViewController.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 4/16/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import UIKit

class ProductCakeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cellCake"
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "CakeCategoryTableViewCell"/*Identifier*/, for: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CakeCategoryTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CellCakeTableViewCell.")
        }
        //cell.textLabel?.text = cake_category[indexPath.row]
        
        return cell
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
