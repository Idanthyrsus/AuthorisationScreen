//
//  MainViewController.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 11.03.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController  {
  
    let mainView = MainView()
    let customColor: UIColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha: 1)
    
    lazy var mainTableView: UITableView = {
         let table = UITableView()
         table.separatorStyle = .none
         table.allowsSelection = false
         table.showsVerticalScrollIndicator = false
         table.register(LatestTableViewCell.self, forCellReuseIdentifier: LatestTableViewCell.reuseIdentifier)
         table.register(FlashSaleTableViewCell.self, forCellReuseIdentifier: FlashSaleTableViewCell.reuseIdentifier)
         table.register(MainHeaderView.self, forHeaderFooterViewReuseIdentifier: MainHeaderView.reuseIdentifier)
         table.backgroundColor = customColor
         return table
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mainView)
        self.mainView.frame = self.view.bounds
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.navigationBar.layer.zPosition = -1
        mainTableView.delegate = self
        mainTableView.dataSource = self
        self.tabBarController?.tabBar.frame = CGRect(x: 2, y: 762, width: self.view.frame.width-2, height: 95)
        setupTableView()
       
    }
    
    func setupTableView() {
        mainView.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(mainView.categoryCollection.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(mainView.snp.bottom)
        }
    }
}

