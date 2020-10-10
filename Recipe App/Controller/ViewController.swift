//
//  ViewController.swift
//  Recipe App
//
//  Created by Syimyk on 10/9/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    

    let array : [Dish] = [
        Dish(titleOfDish: "Egg Drop Soup", image: UIImage(named: "EggDropSoup")!),
        Dish(titleOfDish: "Corba", image: UIImage(named: "corba")!),
        Dish(titleOfDish: "Shakshuka", image: UIImage(named: "shakshuka")!),
        Dish(titleOfDish: "Dundee Cake", image: UIImage(named: "DundeeCake")!),
        Dish(titleOfDish: "Sugar Pie", image: UIImage(named: "SugarPie")!),
        Dish(titleOfDish: "Poutine", image: UIImage(named: "poutine")!),
        Dish(titleOfDish: "Tamiya", image: UIImage(named: "tamiya")!),
        Dish(titleOfDish: "Hot and Sour Soup", image: UIImage(named: "HotAndSour")!),
        Dish(titleOfDish: "Kentucky Fried Chicken", image: UIImage(named: "KentuckyFriedChicken")!),
        Dish(titleOfDish: "Shawarma", image: UIImage(named: "shawarma")!)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.myImage.image = array[indexPath.row].image
        cell.titleFood.text = array[indexPath.row].titleOfDish
        cell.myView.backgroundColor = .lightGray
        return cell
    }
}
 
    


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var food = array[indexPath.row].titleOfDish
        print(food)
    }
}
