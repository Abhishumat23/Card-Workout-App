//
//  CardSelectionVCViewController.swift
//  cardgame
//
//  Created by Abhishumat singh Beniwal on 14/12/23.
//

import UIKit

class CardSelectionVCViewController: UIViewController {
    
    @IBOutlet var cardimageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    var cards: [UIImage] = deck.allValues
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        
        for button in buttons{
            button.layer.cornerRadius=8
        }
    }
    
    override func viewWillDisappear( _ animated: Bool){
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
        
    @objc func showRandomImage(){
        cardimageView.image=cards.randomElement() ?? UIImage(named:"AH")
    }
    
    
    @IBAction func stoptapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func rulestapped(_ sender: UIButton) {
    }
    
    @IBAction func restarttapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}

