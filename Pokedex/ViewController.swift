//
//  ViewController.swift
//  Pokedex
//
//  Created by CFPAPP on 12/2/16.
//  Copyright © 2016 wecarrasco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var Attack1: UIButton!
    @IBOutlet weak var Attack2: UIButton!
    @IBOutlet weak var pokemon2Image: UIImageView!
    @IBOutlet weak var labelTurno: UILabel!
    
    var myPokemon : OwnedPokemon = OwnedPokemon(name: "bulbasaur", type : PokemonType.Grass, owner : "Wal-e")
    var myPokemon2 : OwnedPokemon = OwnedPokemon(name: "bulbasaur2", type : PokemonType.Grass, owner : "Wal-e2")

    override func viewDidLoad() {
        inicializarPokemon(myPokemon)
        inicializarPokemon(myPokemon2)
        myPokemon.accion(pokemonImage, animationKey: "idle")
        myPokemon2.accion(pokemon2Image, animationKey: "idle")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func inicializarPokemon(pokemon : OwnedPokemon){
        pokemon.animationsFrames["idle"] = pokemonAnimationFrame(maxFrames: 41, duration: 1.0, repeatCount: 0)
        pokemon.animationsFrames["attack1"] = pokemonAnimationFrame(maxFrames: 51, duration: 1.0, repeatCount: 1)
        pokemon.animationsFrames["attack2"] = pokemonAnimationFrame(maxFrames: 66, duration: 1.0, repeatCount: 1)
        pokemon.attack1 = Attack(name: "Latigo", power: 50)
        pokemon.attack2 = Attack(name: "Roar", power: 10)
        pokemonImage.image = UIImage(named: "bulbasaur_idle_0001")
        pokemon2Image.image = UIImage(named: "bulbasaur_idle_0001")
        pokemon.accion(pokemonImage, animationKey: "idle")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Actions
    
    @IBAction func Attack1Action(sender: UIButton) {
        myPokemon.attack(1)
        myPokemon.accion(pokemonImage, animationKey: "attack1")
        setButtons(enable: false)
        NSTimer.scheduledTimerWithTimeInterval(1.2, target: self, selector: Selector("returnToIdle"), userInfo: nil, repeats: false)
        //accion(51, animationKey: "Attack1_00")
    }
    

    @IBAction func Attack2Action(sender: UIButton) {
        myPokemon.attack(2)
        myPokemon.accion(pokemonImage, animationKey: "attack2")
        setButtons(enable: false)
        NSTimer.scheduledTimerWithTimeInterval(1.2, target: self, selector: Selector("returnToIdle"), userInfo: nil, repeats: false)
    }
    
    
    func setButtons(enable enable : Bool){
        Attack1.enabled = enable
        Attack2.enabled = enable
    }
    
    func returnToIdle(){
        myPokemon.accion(pokemonImage, animationKey: "idle")
        setButtons(enable: true)
    }
}

