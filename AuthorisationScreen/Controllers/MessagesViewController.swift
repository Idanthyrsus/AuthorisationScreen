import UIKit

class MessagesViewController: UIViewController {
    
    lazy var bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = .white
        return bottomView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Messages"
        self.view.backgroundColor = .orange
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
