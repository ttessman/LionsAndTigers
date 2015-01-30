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
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for x in 0...3 {
            println(x)
            var myTiger:Tiger
            myTiger = Tiger()
            myTiger.name = myTigerNames[x]//names array
            myTiger.breed = myTigerBreed[x]
            myTiger.age = myTiger.ageInTigerYearsFromAge(myTigerAge[x])
            myTiger.image = UIImage(named: myTigerImageName[x])
            myTigers.append(myTiger)
        }
        
        println(myTigers)
        //myTigers[0].chuff();
        myTigers[0].chuffANumberOfTimes(3)
        myTigers[1].chuffANumberOfTimes(5, isLoud: false)
      
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
        
        var randomIndex:Int
        
        do {
         randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while currentIndex == randomIndex
        
        currentIndex = randomIndex
        
        let randomTiger = myTigers[randomIndex]
        
        //UIViewAnimationOptions.TransitionCrossDissolve
        //UIViewAnimationOptions.TransitionCurlUp
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:{
            self.myImageView.image = randomTiger.image
            self.nameLabel.text = randomTiger.name
            self.ageLabel.text = "\(randomTiger.age)"
            self.breedLabel.text = randomTiger.breed
            }, completion: {
                (finished: Bool) -> () in
        })
        
    }

}

