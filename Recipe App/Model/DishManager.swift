//
//  DishManager.swift
//  Recipe App
//
//  Created by Syimyk on 10/11/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import Foundation

protocol  dishManagerDelegate{
       func didUpdateDish(_ dishManager: DishManager, dish : DishModel)
       func didFailWithError(error: Error)
   }

struct DishManager {
    
    var delegate : dishManagerDelegate?
    
    let dishURL = "https://www.themealdb.com/api/json/v1/1/search.php?s="
    
    func fetchDish(named food : String){
        let urlString = "\(dishURL)\(food)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString : String){
        //1.create a url
        if let url = URL(string: urlString){
            //2.create a URLsession
            let session = URLSession(configuration: .default)
            //3.give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let food = self.parseJSON(safeData){
                        self.delegate?.didUpdateDish(self, dish: food)
                    }
                }
            }
            //4.start the task
            task.resume()

        }
    }
    
    
    func parseJSON(_ dishData : Data) -> DishModel?{
        let decoder = JSONDecoder()
        do{
            var decodedData = try decoder.decode(DishData.self, from: dishData)
            let instruction = decodedData.meals[0].strInstructions
            let dict = decodedData.meals[0].returnIngredientsAndMeasure()
            
            let dish = DishModel(instruction: instruction, ingredientsAndMeasure: dict)
            
            return dish
        }
        catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
