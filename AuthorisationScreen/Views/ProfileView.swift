import Foundation
import UIKit
import SnapKit

final class ProfileView: UIView {
    
    var imagePicker = UIImagePickerController()
    var delegate: PickPhotoDelegate?
    let customColor: UIColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha: 1)

   lazy var profileImageView: UIImageView = {
        let picture = UIImageView()
        picture.image = UIImage(named: "ProfileImage")
        picture.contentMode = .scaleAspectFill
        picture.clipsToBounds = true
        picture.layer.borderWidth = 2
        picture.layer.borderColor = UIColor.lightGray.cgColor
        picture.layer.cornerRadius = 32
        picture.layer.masksToBounds = true
        return picture
    }()
    
    private lazy var changePhotoButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.init(white: 0, alpha: 0.8), for: .highlighted)
        button.setTitleColor(.init(white: 0, alpha: 1.5), for: .selected)
        button.setTitle("Change photo", for: .normal)
        var descriptor = UIFontDescriptor(name: "Montserrat", size: 10)
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits : [UIFontDescriptor.TraitKey.weight : UIFont.Weight.bold]])
        button.titleLabel?.font = UIFont(descriptor: descriptor, size: 10)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Satria Adhi Pradana"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var uploadItemButton: CustomButton = {
        let button = CustomButton(buttonTitle: .upload)
        var configuration = CustomButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 100)
        configuration.image = UIImage(systemName: "square.and.arrow.up")
        configuration.imagePadding = 60
        configuration.imagePlacement = .leading
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            return outgoing
        })
        
        configuration.titleAlignment = .center
        var symbolConfiguration = UIImage.SymbolConfiguration(paletteColors: [.white])
        symbolConfiguration = symbolConfiguration.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 12, weight: .bold)))
        configuration.preferredSymbolConfigurationForImage = symbolConfiguration
        button.configuration = configuration
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = customColor
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CustomProfileCell.self, forCellReuseIdentifier: CustomProfileCell.reuseIdentifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = customColor
    }
    
    @objc func didTapButton() {
        delegate?.pickPhoto()
    }
    
    // MARK: - Setup elements
    
    private func setupElements() {
        self.addSubviews([
            profileImageView,
            changePhotoButton,
            nameLabel,
            uploadItemButton,
            tableView
        ])
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(135)
            make.centerX.equalToSuperview()
            make.leading.equalTo(self.snp.leading).offset(162)
            make.trailing.equalTo(self.snp.trailing).offset(-162)
            make.bottom.equalTo(self.snp.bottom).offset(-645)
        }
        
        changePhotoButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(changePhotoButton.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        uploadItemButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(uploadItemButton.snp.bottom).offset(6)
            make.leading.equalTo(self.snp.leading).offset(26)
            make.trailing.equalTo(self.snp.trailing).offset(-26)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}
