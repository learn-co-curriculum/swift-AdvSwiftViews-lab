//
//  WeatherViewController.swift
//  AdvSwiftViewFun
//
//  Created by Jim Campagno on 6/30/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var rightWeatherLabel: UILabel!
    @IBOutlet weak var leftWeatherLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    @IBOutlet weak var mondayImageView: UIImageView!
    @IBOutlet weak var tuesdayImageView: UIImageView!
    @IBOutlet weak var wednesdayImageView: UIImageView!
    @IBOutlet weak var thursdayImageView: UIImageView!
    @IBOutlet weak var fridayImageView: UIImageView!
    @IBOutlet weak var saturdayImageView: UIImageView!
    @IBOutlet weak var sundayImageView: UIImageView!
    
    var imageViews: [UIImageView] = []
    var monthOfFebruary: [[Weather]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViews = [
            mondayImageView,
            tuesdayImageView,
            wednesdayImageView,
            thursdayImageView,
            fridayImageView,
            saturdayImageView,
            sundayImageView
        ]
        
        monthOfFebruary  = [Weather.dummyMonth(), Weather.dummyMonth(), Weather.dummyMonth(), Weather.dummyMonth()]
        
    }

    @IBAction func weekButtonTapped(sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text, week = Int(buttonTitle) else { return }
        
        let chosenWeek = monthOfFebruary[week - 1]
        let weatherReport = Weather.produceWeatherReportWithWeek(chosenWeek)
        weatherDescriptionLabel.text = weatherReport
        
        switch Weather.isItASunnyWeek(chosenWeek) {
        case true: sunnydays()
        case false: cloudyDays()
        }
        
        displayWeatherImagesForWeek(chosenWeek)
    }
    
    func displayWeatherImagesForWeek(week: [Weather]) {
        for (index, day) in week.enumerate() {
            let imageView = imageViews[index]
            imageView.image = day.image
        }
    }
    
    
    func sunnydays() {
        rightWeatherLabel.text = "☀️"
        leftWeatherLabel.text = "☀️"
    }
    
    func cloudyDays() {
        rightWeatherLabel.text = "☁️"
        leftWeatherLabel.text = "☁️"
    }
   

}
