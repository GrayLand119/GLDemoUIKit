//
//  GLBaseTableView.swift
//  SmartHeater
//
//  Created by GrayLand on 2020/3/31.
//  Copyright © 2020 GrayLand119. All rights reserved.
//

import UIKit

class GLBaseTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.separatorStyle = .none
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    // MARK: - Override
    
    // MARK: - Public
    
    // MARK: - Private
    
    // MARK: - OnEvent
    
    // MARK: - Custom Delegate
    
    // MARK: - Setter
    
    // MARK: - Getter

}