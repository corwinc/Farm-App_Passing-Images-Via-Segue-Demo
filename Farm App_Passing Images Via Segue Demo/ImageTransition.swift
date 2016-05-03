//
//  ImageTransition.swift
//  Farm App_Passing Images Via Segue Demo
//
//  Created by Corwin Crownover on 3/7/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        // containerView mentioned above contains both VC's: the toVC and fromVC
        
        let farmViewController = fromViewController as! FarmViewController
        let animalViewController = toViewController as! AnimalViewController
        
        let movingImageView = UIImageView()
        movingImageView.frame = farmViewController.selectedImageView.frame
        movingImageView.image = farmViewController.selectedImageView.image
        movingImageView.clipsToBounds = farmViewController.selectedImageView.clipsToBounds
        movingImageView.contentMode = farmViewController.selectedImageView.contentMode
        
        containerView.addSubview(movingImageView)
        
        farmViewController.selectedImageView.alpha = 0
        animalViewController.animalImageView.alpha = 0
        
        toViewController.view.alpha = 0
        
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            
            movingImageView.frame = animalViewController.animalImageView.frame
            
            }) { (finished: Bool) -> Void in
                animalViewController.animalImageView.alpha = 1
                farmViewController.selectedImageView.alpha = 1
                movingImageView.removeFromSuperview()
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let animalViewController = fromViewController as! AnimalViewController
        let farmViewController = toViewController as! FarmViewController
        
        let movingImageView = UIImageView()
        movingImageView.frame = animalViewController.animalImageView.frame
        movingImageView.image = animalViewController.animalImageView.image
        movingImageView.clipsToBounds = animalViewController.animalImageView.clipsToBounds
        movingImageView.contentMode = animalViewController.animalImageView.contentMode
        
        containerView.addSubview(movingImageView)
        
        animalViewController.animalImageView.alpha = 0
        farmViewController.selectedImageView.alpha = 0

        fromViewController.view.alpha = 0
        toViewController.view.alpha = 1
        
        UIView.animateWithDuration(duration, animations: {
            movingImageView.frame = farmViewController.selectedImageView.frame
            
            }) { (finished: Bool) -> Void in
                animalViewController.animalImageView.alpha = 1
                farmViewController.selectedImageView.alpha = 1
                movingImageView.removeFromSuperview()
                self.finish()
        }
    }

}
