//
//  SideMenuControllerViewController.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 3/20/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import UIKit

class SideMenuControllerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
   

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var tableViewSideMenu: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu_title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellTabSideMenu"
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "CakeCategoryTableViewCell"/*Identifier*/, for: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SideMenuTableViewCell  else {
            fatalError("The dequeued cell is not an instance of cellTabSideMenu.")
        }
        //cell.textLabel?.text = cake_category[indexPath.row]
        cell.titleSideMenu.text = menu_title[indexPath.row]
        
        return cell
    }
    
    
    let menu_title = ["Profile","History Order","Settings","Help & Support","Terms & Condition","Log Out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.roundedImage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
