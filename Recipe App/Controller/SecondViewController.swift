//
//  SecondViewController.swift
//  Recipe App
//
//  Created by Syimyk on 10/10/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    var foodName : String = ""
    
    var newName : String{
        var delimiter = " "
        var newFoodName = foodName.components(separatedBy: delimiter)
        return newFoodName.first!
    }
    
    
    var foodImage : UIImage?
    
    @IBOutlet weak var imageFood: UIImageView!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var instructions: UITextView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var dictionary = [String : String]()
    
    var dishManager = DishManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        dishManager.delegate = self
        dishManager.fetchDish(named : newName)
        tableView.dataSource = self
        
        imageFood.image = foodImage!
        self.title = foodName
        
        
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//MARK: - dishManagerDelegate


extension SecondViewController : dishManagerDelegate{
    func didUpdateDish(_ dishManager: DishManager, dish: DishModel) {
        DispatchQueue.main.async {
            self.instructions.text = dish.instruction
            self.dictionary = dish.ingredientsAndMeasure
            self.tableView.reloadData()
        }
        
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
 //MARK: - UITableViewDataSource

extension SecondViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return dictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newCell", for: indexPath)
        
        var allIngredients = dictionary.keys
        var allMeasures = dictionary.values
        
        
        var newListOfIngredients = [String]()
        for keys in allIngredients{
            newListOfIngredients.append(keys)
        }
        
        var newListOfMeasures = [String]()
        for values in allMeasures{
            newListOfMeasures.append(values)
        }
        
        cell.textLabel?.text = "\(indexPath.row + 1) - \(newListOfIngredients[indexPath.row]) \(newListOfMeasures[indexPath.row])"
        return cell
    }
    
    
}
