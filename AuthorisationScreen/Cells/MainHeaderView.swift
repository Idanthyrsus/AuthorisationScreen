
import Foundation
import UIKit
import SnapKit

class MainHeaderView: UITableViewHeaderFooterView {
    
    lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
     lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupElements()
    }
    
    private func setupElements() {
        self.addSubviews([rightLabel, leftLabel])
        
        leftLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(6)
            make.trailing.equalTo(self.snp.trailing).offset(-280)
            make.top.bottom.equalToSuperview()
        }
        
        rightLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-3)
            make.leading.equalTo(self.snp.leading).offset(312)
            make.top.bottom.equalToSuperview()
        }
    }
}
