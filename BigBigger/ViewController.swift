//
//  ViewController.swift
//  BigBigger
//
//  Created by Tiago Leichsenring on 07.09.18.
//  Copyright © 2018 Tiago Leichsenring. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }


    @IBOutlet weak var labeltitel: UILabel!
    
    @IBOutlet weak var LeftCardbutton: UIButton!
    @IBOutlet weak var RightCardbutton: UIButton!
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    var leftRandom = 0
    var rightRandom = 0
    
    var leftscore = 0
    var rightscore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    @IBAction func btntryit(_ sender: Any) {
        
         leftRandom = Int(arc4random_uniform(13) + 1)
        
         rightRandom = Int(arc4random_uniform(13) + 1)
        
        LeftCardbutton.setImage(UIImage (named: "card\(leftRandom)"), for: .normal)
        RightCardbutton.setImage(UIImage (named: "card\(rightRandom)"), for: .normal)
        
        
        
    }
    
    @IBAction func LeftCard(_ sender: Any) {
        
        if leftRandom > rightRandom {
            leftscore += 1
            leftScoreLabel.text = String(leftscore)
            let alert = UIAlertController(title: "Very Good", message: "you are right!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "next on", style: .default, handler: { action in
                self.leftRandom = Int(arc4random_uniform(13) + 1)
                
                self.rightRandom = Int(arc4random_uniform(13) + 1)
                
                self.LeftCardbutton.setImage(UIImage (named: "card\(self.leftRandom)"), for: .normal)
                self.RightCardbutton.setImage(UIImage (named: "card\(self.rightRandom)"), for: .normal)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else if rightRandom > leftRandom {
            rightscore += 1
            rightScoreLabel.text = String(rightscore)
            let alert = UIAlertController(title: "Sad", message: "that is wrong", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "next on", style: .default, handler: { action in
                self.leftRandom = Int(arc4random_uniform(13) + 1)
                
                self.rightRandom = Int(arc4random_uniform(13) + 1)
                
                self.LeftCardbutton.setImage(UIImage (named: "card\(self.leftRandom)"), for: .normal)
                self.RightCardbutton.setImage(UIImage (named: "card\(self.rightRandom)"), for: .normal)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else if leftRandom == rightRandom{
            leftscore += 0
            leftScoreLabel.text = String(leftscore)
            rightscore += 0
            rightScoreLabel.text = String(rightscore)
            let alert = UIAlertController(title: "But...", message: "they are the same!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "next on", style: .default, handler: { action in
                self.leftRandom = Int(arc4random_uniform(13) + 1)
                
                self.rightRandom = Int(arc4random_uniform(13) + 1)
                
                self.LeftCardbutton.setImage(UIImage (named: "card\(self.leftRandom)"), for: .normal)
                self.RightCardbutton.setImage(UIImage (named: "card\(self.rightRandom)"), for: .normal)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func RightCard(_ sender: Any) {
        
        
        if leftRandom < rightRandom {
            leftscore += 1
            leftScoreLabel.text = String(leftscore)
            let alert = UIAlertController(title: "Very Good", message: "you are right!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "next on", style: .default, handler: { action in
                self.leftRandom = Int(arc4random_uniform(13) + 1)
                
                self.rightRandom = Int(arc4random_uniform(13) + 1)
                
                self.LeftCardbutton.setImage(UIImage (named: "card\(self.leftRandom)"), for: .normal)
                self.RightCardbutton.setImage(UIImage (named: "card\(self.rightRandom)"), for: .normal)
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        else if rightRandom < leftRandom {
            rightscore += 1
            rightScoreLabel.text = String(rightscore)
            let alert = UIAlertController(title: "Sad", message: "that is wrong", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "next on", style: .default, handler: { action in
                self.leftRandom = Int(arc4random_uniform(13) + 1)
                
                self.rightRandom = Int(arc4random_uniform(13) + 1)
                
                self.LeftCardbutton.setImage(UIImage (named: "card\(self.leftRandom)"), for: .normal)
                self.RightCardbutton.setImage(UIImage (named: "card\(self.rightRandom)"), for: .normal)
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        else if leftRandom == rightRandom{
            let alert = UIAlertController(title: "But...", message: "they are the same!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "next on", style: .default, handler: { action in
                self.leftRandom = Int(arc4random_uniform(13) + 1)
                
                self.rightRandom = Int(arc4random_uniform(13) + 1)
                
                self.LeftCardbutton.setImage(UIImage (named: "card\(self.leftRandom)"), for: .normal)
                self.RightCardbutton.setImage(UIImage (named: "card\(self.rightRandom)"), for: .normal)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
   
    

}
