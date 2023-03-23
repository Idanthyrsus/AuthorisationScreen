
import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LatestTableViewCell.reuseIdentifier, for: indexPath) as? LatestTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FlashSaleTableViewCell.reuseIdentifier, for: indexPath) as? FlashSaleTableViewCell else {
                return UITableViewCell()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 165
        case 1:
            return 225
        case 2:
            return 160
        default:
            return UITableView.automaticDimension
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let background = UIView(frame: view.bounds)
        background.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha: 1)
        
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MainHeaderView.reuseIdentifier) as? MainHeaderView else {
            return UITableViewHeaderFooterView()
        }
        
        switch section {
        case 0:
            header.apply(leftLabel: HeaderModel.headerArray[section].leftLabel)
            header.apply(rightLabel: HeaderModel.headerArray[section].rightLabel)
            header.backgroundView = background
            return header
        case 1:
            header.apply(leftLabel: HeaderModel.headerArray[section].leftLabel)
            header.apply(rightLabel: HeaderModel.headerArray[section].rightLabel)
            header.backgroundView = background
            return header
        case 2:
            header.apply(leftLabel: HeaderModel.headerArray[section].leftLabel)
            header.apply(rightLabel: HeaderModel.headerArray[section].rightLabel)
            header.backgroundView = background
            return header
        default:
            header.backgroundView = background
            return header
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        HeaderModel.headerArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
}

