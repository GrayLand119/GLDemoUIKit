//
//  DarkModeViewController.swift
//  GLDemoUIKit
//
//  Created by GrayLand on 2020/6/17.
//  Copyright © 2020 GrayLand119. All rights reserved.
//

import UIKit

class DarkModeViewController: GLBaseViewController {
    
    // MARK: - Lift Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
    // MARK: - Override
    override func setupViews() {
        view.addSubview(darkModeBtn)
    }
    
    override func setupLayout() {
        darkModeBtn.snp.makeConstraints { (make) -> Void in
            make.center.equalToSuperview()
        }
    }
    // MARK: - Public
    
    // MARK: - Private
    
    // MARK: - OnEvent
    @objc func onChangeModeBtn(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            if overrideUserInterfaceStyle == .light {
                overrideUserInterfaceStyle = .dark
            }else {
                overrideUserInterfaceStyle = .light
            }
        }
    }
    
    // MARK: - Custom Delegate
    
    // MARK: - Setter
    
    // MARK: - Getter
    lazy var darkModeBtn: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(BTN_TITLE_COLOR.color, for: UIControl.State.normal)
        btn.setTitle("ChangeMode", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(self.onChangeModeBtn(_:)), for: UIControl.Event.touchUpInside)
        return btn
    }()
}
