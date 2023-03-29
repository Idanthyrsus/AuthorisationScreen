
import Foundation
import UIKit
import SnapKit
import Combine

class FlashSaleTableViewCell: UITableViewCell {

    var models: [FlashSaleElement] = []

    lazy var flashsaleCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 6)
        layout.itemSize = CGSize(width: 190, height: 220)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(FlashsaleCollectionViewCell.self, forCellWithReuseIdentifier: FlashsaleCollectionViewCell.reuseIdentifier)
        collection.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha: 1)
        collection.isScrollEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.bounces = true
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        flashsaleCollection.delegate = self
        flashsaleCollection.dataSource = self
        setupUI()
    }
    
    func setupUI() {
        contentView.addSubview(flashsaleCollection)
        flashsaleCollection.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }

    func setup(models: [FlashSaleElement]) {
        self.models = models
        flashsaleCollection.reloadData()
    }
}


