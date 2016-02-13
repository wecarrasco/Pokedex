//
//  Pokemon.swift
//  Pokedex
//
//  Created by CFPAPP on 13/2/16.
//  Copyright © 2016 wecarrasco. All rights reserved.
//

import UIKit


enum PokemonType {
    case Grass, Water, Fire, Electric
}

struct pokemonAnimationFrame {
    var maxFrames : Int
    var duration : Double
    var repeatCount : Int
}

let hpPerLevel = 10

class Pokemon : NSObject {
    var animationsFrames = [String : pokemonAnimationFrame]()
    var name : String
    var type : PokemonType
    var level = 5 {
        didSet {
            maxhealth = level * hpPerLevel
        }
    }
    var health = 0 {
        didSet {
            if health > maxhealth {
                health = maxhealth
            }
        }
    }
    var maxhealth = 0
    var attack1 : Attack!
    var attack2 : Attack!
    
    //MARK: - Inits
    init (name : String, type : PokemonType) {
        self.name = name
        self.type = type
        
        maxhealth = level * hpPerLevel
        health = maxhealth
    }
    
    //MARK: - Methods
    
    func levelUp () {
        level++
        health = health + 20
        
    }
    
    func attack (numAtaque : Int) -> Double {
        if numAtaque == 1 {
            print(name + " ataca con " +  attack1.name)
            return attack1.power
        }
        
        if numAtaque == 2 {
            print(name + " ataca con " +  attack2.name)
            return attack2.power
        }
        
        return 0
    }
    
    func accion(pokemonImage : UIImageView, animationKey : String){
        var animation = [UIImage]()
        if let key = animationsFrames[animationKey]{
        for i in 1 ... key.maxFrames{
            let ceroextra = i < 10 ? "0" : ""
            if let currentImage = UIImage(named: "\(name)_\(animationKey)_00\(ceroextra)\(i).png"){
                animation.append(currentImage)
            }
        }
        pokemonImage.animationImages = animation
        pokemonImage.animationDuration = key.duration
        pokemonImage.animationRepeatCount = key.repeatCount
        pokemonImage.startAnimating()

        }
    }
}

class OwnedPokemon: Pokemon {
    
    var owner : String
    
    init(name: String, type: PokemonType, owner : String) {
        self.owner = owner
        super.init(name: name, type: type)
    }
}