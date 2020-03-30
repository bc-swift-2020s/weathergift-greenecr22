//
//  DailyTableViewCell.swift
//  WeatherGift
//
//  Created by Christopher Greene on 3/30/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import UIKit

class DailyTableViewCell: UITableViewCell {

    @IBOutlet weak var dailyImageView: UIImageView!
    @IBOutlet weak var dailyHighLabel: UILabel!
    @IBOutlet weak var dailyLowLabel: UILabel!
    @IBOutlet weak var dailyWeekdayLabel: UILabel!
    @IBOutlet weak var dailySummaryView: UITextView!
    
    var dailyWeather: DailyWeather! {
        didSet {
            dailyImageView.image = UIImage(named:dailyWeather.dailyIcon)
            dailyHighLabel.text = String(dailyWeather.dailyHigh)
            dailyLowLabel.text = String(dailyWeather.dailyLow)
            dailyWeekdayLabel.text = dailyWeather.dailyWeekday
            dailySummaryView.text = dailyWeather.dailySummary
            
        }
    }
}
