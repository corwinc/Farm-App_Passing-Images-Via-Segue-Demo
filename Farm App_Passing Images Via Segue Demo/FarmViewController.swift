//
//  FarmViewController.swift
//  Farm App_Passing Images Via Segue Demo
//
//  Created by Corwin Crownover on 3/7/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class FarmViewController: UIViewController {
    
    var selectedImageView: UIImageView!
    var imageTransition: ImageTransition!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageTransition = ImageTransition()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // FUNCTIONS
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        
        performSegueWithIdentifier("animalSegue", sender: nil)
    }

    
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let animalViewController = segue.destinationViewController as! AnimalViewController
        
        animalViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        animalViewController.transitioningDelegate = imageTransition
        
        animalViewController.view.layoutIfNeeded()
        
        animalViewController.animalImageView.image = selectedImageView.image
    }

}
