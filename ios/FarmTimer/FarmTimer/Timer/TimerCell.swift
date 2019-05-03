//
//  TimerCell.swift
//  FarmTimer
//
//  Created by eyemac on 21/04/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import UIKit

class TimerCell: UICollectionViewCell {
    
    @IBOutlet weak var timerLabel: UILabel!

    var model: TimerViewModel? {
        didSet {
            guard let model = model else { return }
            bind(model)
        }
    }

    func bind(_ model: TimerViewModel) {
        timerLabel.text = model.timeString
        model.refresh { [weak self] in
            guard let self = self else { return }
            guard let model = self.model else { return }
            self.timerLabel.text = model.timeString
        }
    }
}
