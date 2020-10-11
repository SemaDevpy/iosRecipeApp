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
    var foodImage : UIImage?
    
    @IBOutlet weak var imageFood: UIImageView!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var instructions: UITextView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var dishManager = DishManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dishManager.delegate = self
        tableView.dataSource = self
        imageFood.image = foodImage!
        self.title = foodName
        dishManager.fetchDish(named : foodName)
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


extension SecondViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1) - Assalamu Alaikum world."
        return cell
    }
    
    
}


extension SecondViewController : dishManagerDelegate{
    func didUpdateDish(_ dishManager: DishManager, dish: DishModel) {
        DispatchQueue.main.async {
            self.instructions.text = dish.instruction
        }
        
       
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
