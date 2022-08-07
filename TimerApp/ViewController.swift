//
//  ViewController.swift
//  TimerApp
//
//  Created by Felipe Augusto Correia on 07/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var selectedTimeLabel: UILabel!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func okButtonClicked(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCounter), userInfo: nil, repeats: true)
        
    }
    @IBAction func stopButtonClicked(_ sender: Any) {
        timeSlider.value = 0
        timeLabel.text = "0"
        timer.invalidate()
    }
    
    @objc func timeCounter() {
        timeLabel.text = "Time Left: \(Int(timeSlider.value))"
        timeSlider.value = timeSlider.value - 1
        
        if timeSlider.value == 0 {
            timer.invalidate()
            makeAlert()
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        selectedTimeLabel.text = String(format: "%.0f", timeSlider.value)
        timer.invalidate()
    }
    
    func makeAlert() {
        let alert = UIAlertController(title: "Done", message: "Time is over!", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

