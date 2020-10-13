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
    @IBOutlet weak var field: UITextField!
    
    var dishInfo = DishInfo()
    
    var filteredData = [Dish]()
    var filtered = false
    var textFieldIsEmpty = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.addTarget(self, action: #selector(FirstViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        tableView.delegate = self
        tableView.dataSource = self
        field.delegate = self
        
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text{
            if text == ""{
                textFieldIsEmpty = true
                tableView.reloadData()
            }else{
                textFieldIsEmpty = false
                tableView.reloadData()
            }
        }
    }
    
    
    
    
}
//MARK: - UITableViewDataSource
extension FirstViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty && textFieldIsEmpty == false{
            print("Im here")
            return filteredData.count
        }
        
        print("Im at last")
        return  dishInfo.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        if !filteredData.isEmpty && textFieldIsEmpty == false{
            cell.myImage.image = filteredData[indexPath.row].image
            cell.titleFood.text = filteredData[indexPath.row].titleOfDish
        }else{
            cell.myImage.image = dishInfo.array[indexPath.row].image
            cell.titleFood.text = dishInfo.array[indexPath.row].titleOfDish
        }
        
        
        
        
        cell.myView.backgroundColor = .lightGray
        return cell
    }
}



//MARK: - UITableViewDelegate
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

//MARK: - UITextFieldDelegate

extension FirstViewController : UITextFieldDelegate{
    
    
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text{
            
            filterText(text+string)
        }
        return true
    }
    
    
    func filterText(_ query: String){
        filteredData.removeAll()
        for item in dishInfo.array{
            if item.titleOfDish.lowercased().starts(with: query){
                filteredData.append(item)
            }
        }
        tableView.reloadData()
        filtered = true
    }
    
    
    
    
    
    
}


