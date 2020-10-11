//
//  ViewController.swift
//  Recipe App
//
//  Created by Syimyk on 10/9/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    var dishInfo = DishInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    

}

extension FirstViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishInfo.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.myImage.image = dishInfo.array[indexPath.row].image
        cell.titleFood.text = dishInfo.array[indexPath.row].titleOfDish
        cell.myView.backgroundColor = .lightGray
        return cell
    }
}
 
    


extension FirstViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToFood", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SecondViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.foodName = dishInfo.array[indexPath.row].titleOfDish
            destinationVC.foodImage = dishInfo.array[indexPath.row].image
        }
    }
}
