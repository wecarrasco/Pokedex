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
        
        pokemonImage.image = UIImage(named: "Attack1_0001")
        
       
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Actions
    
    @IBAction func Attack1Action(sender: UIButton) {
        var animation = [UIImage]()
        
        for i in 1 ... 51 {
            let ceroextra = i < 10 ? "0" : ""
            let currentImage = UIImage(named: "Attack1_00\(ceroextra)\(i).png")
            if let currentImage = currentImage{
                animation.append(currentImage)
            }
        }
        pokemonImage.animationImages = animation
        pokemonImage.animationDuration = 1.0
        pokemonImage.animationRepeatCount = 1
        pokemonImage.startAnimating()
    }
    

    @IBAction func Attack2Action(sender: UIButton) {
        var animation = [UIImage]()
        
        for i in 1 ... 66 {
            let ceroextra = i < 10 ? "0" : ""
            let currentImage = UIImage(named: "Attack_200\(ceroextra)\(i).png")
            if let currentImage = currentImage{
                animation.append(currentImage)
            }
        }
        pokemonImage.animationImages = animation
        pokemonImage.animationDuration = 1.0
        pokemonImage.animationRepeatCount = 1
        pokemonImage.startAnimating()

    }
    
    @IBAction func IdleAction(sender: UIButton) {
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
        pokemonImage.animationRepeatCount = 1
        pokemonImage.startAnimating()
    }
}

