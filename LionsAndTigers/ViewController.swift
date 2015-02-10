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
    @IBOutlet weak var randomFactLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    let myTigerNames = ["Tigger", "Tigress", "Jacob", "Spar"]
    let myTigerBreed = ["Bengal", "Indochinese Tiger", "Malayan Tiger", "Siberian Tiger"]
    let myTigerAge = [3,2,4,5]
    let myTigerImageName = ["BengalTiger.jpg", "IndochineseTiger.jpg", "MalayanTiger.jpg", "SiberianTiger.jpg"]
    
    var currentAnimal = (species:"Tiger", index:0)
    var myTigers:[Tiger] = []
    var myLions:[Lion] = []
    var myLionCubs:[LionCub] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for x in 0...3 {
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
        //myTigers[0].chuffANumberOfTimes(3)
        //myTigers[1].chuffANumberOfTimes(5, isLoud: false)
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        myLions += [lion,lioness]
        myLions[0].isAlphaMale = true
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.isAlphaMale = true
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        
        lionCub.roar()
      
        var lionessCub = LionCub()
        lionessCub.age = 1
        lionessCub.name = "Nala"
        lionessCub.isAlphaMale = false
        lionessCub.image = UIImage(named: "LionCub2.jpeg")
        lionessCub.subspecies = "Masai"
        
        myLionCubs += [lionCub, lionessCub]
        lionessCub.roar()
        
        
        myImageView.image = myTigers[0].image
        nameLabel.text = myTigers[0].name
        ageLabel.text = "\(myTigers[0].age)"
        breedLabel.text = myTigers[0].breed
        randomFactLabel.text = myTigers[0].randomFact()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
        
    }
    
    func updateAnimal () {
        switch currentAnimal {
        case ("Tiger", _):
            var randomIndex = Int(arc4random_uniform(UInt32(myLions.count)))
            currentAnimal = ("Lion",randomIndex)
        case ("LionCub", _):
            var randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger",randomIndex)
        default:
            var randomIndex = Int(arc4random_uniform(UInt32(myLionCubs.count)))
            currentAnimal = ("LionCub",randomIndex)
        
        }
    
    }
    
    func updateView () {
        UIView.transitionWithView(self.view, duration: 0.25, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:{
            
            if self.currentAnimal.species == "Tiger" {
                let currentTiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = currentTiger.image
                self.nameLabel.text = currentTiger.name
                self.ageLabel.text = "\(currentTiger.age)"
                self.breedLabel.text = currentTiger.breed
                self.randomFactLabel.text = currentTiger.randomFact()

            } else if self.currentAnimal.species == "Lion" {
                let currentLion = self.myLions[self.currentAnimal.index]
                
                self.myImageView.image = currentLion.image
                self.nameLabel.text = currentLion.name
                self.ageLabel.text = "\(currentLion.age)"
                self.breedLabel.text = currentLion.subspecies
                self.randomFactLabel.text = currentLion.randomFact()
                
            } else if self.currentAnimal.species == "LionCub" {
                let currentCub = self.myLionCubs[self.currentAnimal.index]
                
                self.myImageView.image = currentCub.image
                self.nameLabel.text = currentCub.name
                self.ageLabel.text = "\(currentCub.age)"
                self.breedLabel.text = currentCub.subspecies
                self.randomFactLabel.text = currentCub.randomFact()
                
            }
            
            self.randomFactLabel.hidden = false
            
            }, completion: {
                (finished: Bool) -> () in
        })

    }

}

