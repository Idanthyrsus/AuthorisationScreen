//
//  ProfileViewController+Extensions.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 11.03.2023.
//

import Foundation
import UIKit
import Combine

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.publisher.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomProfileCell.reuseIdentifier, for: indexPath) as? CustomProfileCell else {
            return UITableViewCell()
        }
        cell.apply(image: viewModel.publisher.value[indexPath.row].image)
        cell.apply(text: viewModel.publisher.value[indexPath.row].category)
        cell.balanceLabel.text = "$ \(String(describing: ProfileDataSource.balanceDataSource))"  
        
        switch indexPath.row {
        case 2:
            cell.rightElementImageView.removeFromSuperview()
            cell.addSubview(cell.balanceLabel)
            
        default:
            cell.apply(rightElement: viewModel.publisher.value[indexPath.row].rightElement ?? "")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6 {
            let vc = SignInViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let selectedImage = info[.editedImage] as? UIImage
            self.profileView.profileImageView.image = selectedImage
            self.dismiss(animated: true, completion: nil)
        }
}
