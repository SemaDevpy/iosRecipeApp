//
//  DishData.swift
//  Recipe App
//
//  Created by Syimyk on 10/11/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import Foundation



struct DishData : Codable {
    var meals : [Meals]
}


struct Meals : Codable {
    let strInstructions : String
    
    
    
    let strIngredient1 : String?
    let strIngredient2 : String?
    let strIngredient3 : String?
    let strIngredient4 : String?
    let strIngredient5 : String?
    let strIngredient6 : String?
    let strIngredient7 : String?
    let strIngredient8 : String?
    let strIngredient9 : String?
    let strIngredient10 : String?
    let strIngredient11 : String?
    let strIngredient12 : String?
    let strIngredient13 : String?
    let strIngredient14 : String?
    let strIngredient15 : String?
    let strIngredient16 : String?
    let strIngredient17 : String?
    let strIngredient18 : String?
    let strIngredient19 : String?
    let strIngredient20 : String?
    
    let strMeasure1 : String?
    let strMeasure2 : String?
    let strMeasure3 : String?
    let strMeasure4 : String?
    let strMeasure5 : String?
    let strMeasure6 : String?
    let strMeasure7 : String?
    let strMeasure8 : String?
    let strMeasure9 : String?
    let strMeasure10 : String?
    let strMeasure11 : String?
    let strMeasure12 : String?
    let strMeasure13 : String?
    let strMeasure14 : String?
    let strMeasure15 : String?
    let strMeasure16 : String?
    let strMeasure17 : String?
    let strMeasure18 : String?
    let strMeasure19 : String?
    let strMeasure20 : String?
    
    
    
    mutating func returnIngredientsAndMeasure() -> [String : String]{
        
        var ingredientsAndMeasure = [String : String]()

        
        if strIngredient1 != "" && strIngredient1 != nil{
            ingredientsAndMeasure[strIngredient1!] = strMeasure1
        }
        if strIngredient2 != "" && strIngredient2 != nil{
            ingredientsAndMeasure[strIngredient2!] = strMeasure2
        }
        
        if strIngredient3 != "" && strIngredient3 != nil{
            ingredientsAndMeasure[strIngredient3!] = strMeasure3
        }
        
        if strIngredient4 != "" && strIngredient4 != nil{
            ingredientsAndMeasure[strIngredient4!] = strMeasure4
        }
        
        if strIngredient5 != "" && strIngredient5 != nil{
            ingredientsAndMeasure[strIngredient5!] = strMeasure5
        }
        
        if strIngredient6 != "" && strIngredient6 != nil{
            ingredientsAndMeasure[strIngredient6!] = strMeasure6
        }
        
        if strIngredient7 != "" && strIngredient7 != nil{
            ingredientsAndMeasure[strIngredient7!] = strMeasure7
        }
        
        if strIngredient8 != "" && strIngredient8 != nil{
            ingredientsAndMeasure[strIngredient8!] = strMeasure8
        }
        
        if strIngredient9 != "" && strIngredient9 != nil{
            ingredientsAndMeasure[strIngredient9!] = strMeasure9
        }
        
        if strIngredient10 != "" && strIngredient10 != nil{
            ingredientsAndMeasure[strIngredient10!] = strMeasure10
        }
        
        if strIngredient11 != "" && strIngredient11 != nil{
            ingredientsAndMeasure[strIngredient11!] = strMeasure11
        }
        
        if strIngredient12 != "" && strIngredient12 != nil{
            ingredientsAndMeasure[strIngredient12!] = strMeasure12
        }
        
        if strIngredient13 != "" && strIngredient13 != nil{
            ingredientsAndMeasure[strIngredient13!] = strMeasure13
        }
        
        if strIngredient14 != "" && strIngredient14 != nil{
            ingredientsAndMeasure[strIngredient14!] = strMeasure14
        }
        
        if strIngredient15 != "" && strIngredient15 != nil{
            ingredientsAndMeasure[strIngredient15!] = strMeasure15
        }
        
        if strIngredient16 != "" && strIngredient16 != nil{
            ingredientsAndMeasure[strIngredient16!] = strMeasure16
        }
        
        if strIngredient17 != "" && strIngredient17 != nil{
            ingredientsAndMeasure[strIngredient17!] = strMeasure17
        }
        
        if strIngredient18 != "" && strIngredient18 != nil{
            ingredientsAndMeasure[strIngredient18!] = strMeasure18
        }
        
        if strIngredient19 != "" && strIngredient19 != nil{
            ingredientsAndMeasure[strIngredient19!] = strMeasure19
        }
        
        if strIngredient20 != "" && strIngredient20 != nil{
            ingredientsAndMeasure[strIngredient20!] = strMeasure20
        }
        
        return ingredientsAndMeasure
    }
}
