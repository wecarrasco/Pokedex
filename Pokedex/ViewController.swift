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
    @IBOutlet weak var Idle: UIButton!
   

    override func viewDidLoad() {
        var myPokemon : OwnedPokemon!
        pokemonImage.image = UIImage(named: "Attack1_0001")
        idle()
       
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Actions
    
    @IBAction func Attack1Action(sender: UIButton) {
        accion(51, animationKey: "Attack1_00")
    }
    
    
    func accion(frames : Int, animationKey : String){
        var animation = [UIImage]()
        
        for i in 1 ... frames{
            let ceroextra = i < 10 ? "0" : ""
            let currentImage = UIImage(named: "\(animationKey)\(ceroextra)\(i).png")
            if let currentImage = currentImage{
                animation.append(currentImage)
            }
        }
        pokemonImage.animationImages = animation
        pokemonImage.animationDuration = 1.0
        pokemonImage.animationRepeatCount = 1
        pokemonImage.startAnimating()
        setButtons(enable: false)
        NSTimer.scheduledTimerWithTimeInterval(1.2, target: self, selector: Selector("returnToIdle"), userInfo: nil, repeats: false)
    }
    

    @IBAction func Attack2Action(sender: UIButton) {
        accion(66, animationKey: "Attack_200")
    }


    
    func idle(){
        var animation = [UIImage]()
        
        for i in 1 ... 41 {
            let ceroextra = i < 10 ? "0" : ""
            let currentImage = UIImage(named: "Idle_00\(ceroextra)\(i).png")
            if let currentImage = currentImage{
                animation.append(currentImage)
            }
        }
        pokemonImage.animationImages = animation
        pokemonImage.animationDuration = 1.0
        pokemonImage.animationRepeatCount = 0
        pokemonImage.startAnimating()
    }
    
    
    func setButtons(enable enable : Bool){
        Attack1.enabled = enable
        Attack2.enabled = enable
    }
    
    func returnToIdle(){
        idle()
        setButtons(enable: true)
    }
}

