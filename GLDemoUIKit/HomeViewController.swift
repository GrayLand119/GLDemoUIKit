//
//  HomeViewController.swift
//  GLDemoUIKit
//
//  Created by GrayLand on 2020/6/12.
//  Copyright © 2020 GrayLand119. All rights reserved.
//

import UIKit
@_exported import SnapKit

enum DemoType: String {
    case AdaptDarkMode
    case PresentTransition
}

class HomeViewController: GLBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cellInfos: [DemoType] = []
    // MARK: - Lift Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.className()
        
        cellInfos = [DemoType.AdaptDarkMode,
                     DemoType.PresentTransition]
        
        setupViews()
        setupLayout()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage.init(color: DEFAULT_BG_COLOR.color), for: UIBarMetrics.default)
        
        tableView.reloadData()
    }
    
    // MARK: - Override
    override func setupViews() {
        view.addSubview(tableView)
    }
    
    override func setupLayout() {
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview().priority(ConstraintPriority.low)
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            }
        }
    }
    
    // MARK: - Public
    
    // MARK: - Private
    
    // MARK: - OnEvent
    
    // MARK: - Custom Delegate
    // MARK: - UITableViewDelegate, UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellInfos.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        cell?.backgroundColor = DEFAULT_BG_COLOR.color
        cell?.textLabel?.textColor = DEFAULT_TEXT_COLOR.color
        cell?.textLabel?.text = cellInfos[indexPath.row].rawValue
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch cellInfos[indexPath.row] {
        case .AdaptDarkMode:
            let vc = DarkModeViewController()
            let nvc = GLBaseNavigationController.init(vc)
            nvc.modalTransitionStyle = .coverVertical
//            nvc.modalPresentationStyle = .overFullScreen
            present(nvc, animated: true, completion: nil)
        case .PresentTransition:
            let vc = TransitionDemoViewController()
            let nvc = GLBaseNavigationController.init(vc)
            nvc.modalPresentationStyle = .overFullScreen
            present(nvc, animated: true, completion: nil)
            
        default:
            break
        }
        
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Setter
    
    // MARK: - Getter
    lazy var tableView: GLBaseTableView = {
        let tbv = GLBaseTableView.init()
        tbv.delegate = self
        tbv.dataSource = self
        tbv.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tbv
    }()
}
