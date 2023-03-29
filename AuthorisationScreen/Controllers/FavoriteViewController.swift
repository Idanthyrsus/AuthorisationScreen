import UIKit

class FavoriteViewController: UIViewController {
    
    lazy var bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = .white
        return bottomView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Favorite"
        self.view.backgroundColor = .cyan
        setBottomView()
    }
    
    func setBottomView() {
        self.view.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(34)
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }
}
