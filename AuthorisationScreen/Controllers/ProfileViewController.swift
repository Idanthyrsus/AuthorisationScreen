import UIKit

protocol PickPhotoDelegate {
    func pickPhoto()
}

class ProfileViewController: UIViewController, PickPhotoDelegate {
    
    enum Navigation {
        case profileName
        case imageName
        
        var description: String {
            switch self {
            case .profileName:
                return "Profile"
            case .imageName:
                return "arrow.left"
            }
        }
    }
    
    enum AlertActions {
        case chooseImage
        case gallery
        case takePhoto
        case cancel
        
        var description: String {
            switch self {
            case .chooseImage:
                return "Choose profile image"
            case .gallery:
                return "Choose from gallery"
            case .takePhoto:
                return "Take photo"
            case .cancel:
                return "Cancel"
            }
        }
    }

    let profileView = ProfileView()
    let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Navigation.profileName.description
        self.view.addSubview(profileView)
        profileView.frame = self.view.bounds
        profileView.tableView.delegate = self
        profileView.tableView.dataSource = self
        profileView.delegate = self
        let leftButton = UIBarButtonItem(image: UIImage(systemName: Navigation.imageName.description) , style: .plain, target: self, action: #selector(goToSignIn))
        leftButton.tintColor = .black
        profileView.uploadItemButton.addTarget(self, action: #selector(choosePicture), for: .touchUpInside)
        navigationItem.leftBarButtonItem = leftButton
    }
    
    func pickPhoto() {
        
        let alertController = UIAlertController(title: AlertActions.chooseImage.description, message: nil, preferredStyle: .actionSheet)
        let chooseImage = UIAlertAction(title: AlertActions.gallery.description, style: .default) { _ in
            self.chooseImagePickerAction(source: .photoLibrary)
        }
        let takePhoto = UIAlertAction(title: AlertActions.takePhoto.description, style: .default) { _ in
            self.chooseImagePickerAction(source: .camera)
        }
        let cancel = UIAlertAction(title: AlertActions.cancel.description, style: .cancel, handler: nil)
        alertController.addAction(chooseImage)
        alertController.addAction(takePhoto)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func chooseImagePickerAction(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
// MARK: - Selector
    
    @objc func goToSignIn() {
        let viewController = SignInViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    @objc func choosePicture() {
        pickPhoto()
    }
}

