//
//  timerVC.swift
//  Timer
//
//  Created by Esmeralda Angeles on 12/18/18.
//  Copyright © 2018 Profuturo. All rights reserved.
//

import UIKit

class timerVC: UIViewController {
    
    @IBOutlet weak var seconds: UILabel!
    @IBOutlet weak var minuts: UILabel!
    
    var time: Timer?
    var counterSeconds = 0
    var counterMinuts = 0
    
    @IBOutlet weak var btnComenzar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        seconds.text = "00"
        
    }

    @IBAction func comenzar(_ sender: UIButton) {
        
        guard let nilTime = time else {
            btnComenzar.isEnabled = false
            btnComenzar.backgroundColor = UIColor.gray
            time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            return
        }
        
    }
    
    
    @IBAction func pausar(_ sender: UIButton) {
        btnComenzar.isEnabled = true
        btnComenzar.backgroundColor = UIColor.init(red: 207/255, green: 168/255, blue: 68/255, alpha: 1)
        time!.invalidate()
    }
    
    
    @IBAction func terminar(_ sender: Any) {
        
        terminar()
        
    }
    
    func terminar(){
        
        btnComenzar.isEnabled = true
        btnComenzar.backgroundColor = UIColor.init(red: 207/255, green: 168/255, blue: 68/255, alpha: 1)
        
        time!.invalidate()
        time = Timer()
        
        counterSeconds = 0
        seconds.text = "00"
        counterMinuts = 0
        minuts.text = "00"
        
    }
    
    @objc func updateTimer(){
        
        if (counterSeconds <= 58){
            counterSeconds += 1
            if counterSeconds < 10{
                seconds.text = "0" + String(counterSeconds)
            }else{
                seconds.text = String(counterSeconds)
            }
        }else if (counterMinuts <= 58){
            counterSeconds = 0
            seconds.text = "00"
            counterMinuts += 1
            if counterMinuts < 10{
                minuts.text = "0" + String(counterMinuts)
            }else{
                minuts.text = String(counterMinuts)
            }
        }else{
            terminar()
        }

    }
    
}
