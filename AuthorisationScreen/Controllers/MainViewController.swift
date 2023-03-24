//
//  MainViewController.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 11.03.2023.
//

import UIKit
import SnapKit
import Combine

class MainViewController: UIViewController  {
  
    let mainView = MainView()
    let customColor: UIColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha: 1)

    let viewModel = MainViewModel()

    var cancellables = Set<AnyCancellable>()

    let network: NetworkService = NetworkServiceImpl()

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
    
    lazy var bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = .white
        return bottomView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mainView)
        self.mainView.frame = self.view.bounds
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.navigationBar.layer.zPosition = -1
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        let array = tabBarController?.customizableViewControllers
            for controller in array! {
                controller.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -5, right: 0)
            }
        self.tabBarController?.tabBar.frame = CGRect(x: 1.2, y: 748, width: self.view.frame.width-3.5, height: 63)
        setupTableView()
        setBottomView()
        getData()
    }
    
    func setupTableView() {
        mainView.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(mainView.categoryCollection.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(mainView.snp.bottom)
        }
    }
    
    func setBottomView() {
        self.view.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(34)
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }

    func getData() {
        let combined = Publishers.Zip(network.getLatest(), network.getFlash())
        combined.map { (latest, flash) in
            self.viewModel.latestArray.value = latest.latest
            self.viewModel.flashArray.value = flash.flashSale ?? []
        }.receive(on: RunLoop.main)
        .sink { _ in
        } receiveValue: { [weak self] _ in
            self?.mainTableView.reloadData()
        }
        .store(in: &cancellables)
    }
}

