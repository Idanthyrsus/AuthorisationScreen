
import Foundation
import UIKit
import SnapKit
import SDWebImage

class FlashsaleCollectionViewCell: UICollectionViewCell, FlashsaleCollectionViewCellProtocol {
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
     lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.backgroundColor = UIColor(white: 8, alpha: 0.8)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        return label
    }()
    
     lazy var discountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.backgroundColor = .red
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        return label
    }()
    
    lazy var brandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
    private lazy var plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.layer.cornerRadius = 18
        return imageView
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .gray
        let config = UIImage.SymbolConfiguration(weight: .semibold)
        imageView.image = UIImage(systemName: "plus", withConfiguration: config)
        return imageView
    }()
    
    private lazy var heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private lazy var heartIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .gray
        let config = UIImage.SymbolConfiguration(weight: .heavy)
        imageView.image = UIImage(systemName: "heart", withConfiguration: config)
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
       
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setupUI() {
        contentView.addSubviews([
        backgroundImageView,
        categoryLabel,
        discountLabel,
        brandLabel,
        priceLabel,
        plusImageView,
        iconImageView,
        heartImageView,
        heartIconImageView
        ])
        
        backgroundImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        discountLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(6)
            make.trailing.equalTo(contentView.snp.trailing).offset(-6)
            make.leading.equalTo(contentView.snp.leading).offset(125)
            make.bottom.equalTo(contentView.snp.bottom).offset(-175)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(100)
            make.height.equalTo(25)
            make.leading.equalTo(contentView.snp.leading).offset(6)
            make.trailing.equalTo(contentView.snp.trailing).offset(-120)
            make.bottom.equalTo(brandLabel.snp.top).offset(-6)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.bottom.equalTo(priceLabel.snp.top).offset(-20)
            make.leading.equalTo(contentView.snp.leading).offset(12)
            make.trailing.equalTo(contentView.snp.trailing).offset(-82)
            make.top.equalTo(categoryLabel.snp.bottom).offset(6)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-6)
            make.leading.equalTo(contentView.snp.leading).offset(12)
            make.trailing.equalTo(contentView.snp.trailing).offset(-100)
            make.top.equalTo(brandLabel.snp.bottom).offset(20)
        }
        
        plusImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(160)
            make.trailing.equalTo(contentView.snp.trailing).offset(-6)
            make.leading.equalTo(priceLabel.snp.trailing).offset(60)
            make.bottom.equalTo(contentView.snp.bottom).offset(-6)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(plusImageView.snp.top).offset(6)
            make.bottom.equalTo(plusImageView.snp.bottom).offset(-6)
            make.leading.equalTo(plusImageView.snp.leading).offset(6)
            make.trailing.equalTo(plusImageView.snp.trailing).offset(-6)
        }
        
        heartImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(170)
            make.trailing.equalTo(plusImageView.snp.leading).offset(-6)
            make.leading.equalTo(priceLabel.snp.trailing).offset(30)
            make.bottom.equalTo(contentView.snp.bottom).offset(-6)
        }
        
        heartIconImageView.snp.makeConstraints { make in
            make.top.equalTo(heartImageView.snp.top).offset(3)
            make.bottom.equalTo(heartImageView.snp.bottom).offset(-3)
            make.leading.equalTo(heartImageView.snp.leading).offset(3)
            make.trailing.equalTo(heartImageView.snp.trailing).offset(-3)
        }
    }
}
