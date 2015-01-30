//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Tyler Tessmann on 1/30/15.
//  Copyright (c) 2015 tylerOtto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    let myTigerNames = ["Tigger", "Tigress", "Jacob", "Spar"]
    let myTigerBreed = ["Bengal", "Indochinese Tiger", "Malayan Tiger", "Siberian Tiger"]
    let myTigerAge = [3,2,4,5]
    let myTigerImageName = ["BengalTiger.jpg", "IndochineseTiger.jpg", "MalayanTiger.jpg", "SiberianTiger.jpg"]
    
    var myTigers:[Tiger] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for x in 0...3 {
            println(x)
            var myTiger:Tiger
            myTiger = Tiger()
            myTiger.name = myTigerNames[x]//names array
            myTiger.breed = myTigerBreed[x]
            myTiger.age = myTigerAge[x]
            myTiger.image = UIImage(named: myTigerImageName[x])
            myTigers.append(myTiger)
        }
        
        println(myTigers)
      
        myImageView.image = myTigers[0].image
        nameLabel.text = myTigers[0].name
        ageLabel.text = "\(myTigers[0].age)"
        breedLabel.text = myTigers[0].breed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        let randomTiger = myTigers[randomIndex]
        myImageView.image = randomTiger.image
        nameLabel.text = randomTiger.name
        ageLabel.text = "\(randomTiger.age)"
        breedLabel.text = randomTiger.breed
        
    }

}

