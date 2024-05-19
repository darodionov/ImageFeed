import UIKit

final class ProfileViewController: UIViewController {
    var profileImageView: UIImageView?
    
    override func viewDidLoad() {
        setProfileImageView()
        setExitButton()
        setLabels()
    }
    
    private func setProfileImageView() {
        let profileImage = UIImage(named: "Photo")
        let profileImageView = UIImageView(image: profileImage)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        profileImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 76).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        profileImageView.tintColor = .gray
        self.profileImageView = profileImageView
    }
    
    private func setExitButton() {
        guard let exitButtonImage = UIImage(named: "Exit") else { return }
        let exitButton = UIButton.systemButton(with: exitButtonImage, target: self, action: nil)
        
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exitButton)
        
        exitButton.tintColor = UIColor(named: "YP Red")
        exitButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        if let profileImageView = profileImageView {
            exitButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        } else {
            exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 89).isActive = true
        }
    }
    
    private func setLabels() {
        let nameLabel = UILabel()
        let loginNameLabel = UILabel()
        let descriptionLabel = UILabel()
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        loginNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        view.addSubview(loginNameLabel)
        view.addSubview(descriptionLabel)
        
        nameLabel.text = "Екатерина Новикова"
        loginNameLabel.text = "@ekaterina_nov"
        descriptionLabel.text = "Hello, world!"
        
        nameLabel.font = UIFont(name: "SF Pro", size: 23)
        nameLabel.textColor = UIColor(named: "YP White (iOS)")
        loginNameLabel.font = UIFont(name: "SF Pro", size: 13)
        loginNameLabel.textColor = UIColor(named: "YP Gray")
        descriptionLabel.font = UIFont(name: "SF Pro", size: 13)
        descriptionLabel.textColor = UIColor(named: "YP White (iOS)")
        
        if let profileImageView = profileImageView {
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor,
                                           constant: 8).isActive = true
        } else {
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: (76 + 70 + 8)).isActive = true
        }
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            loginNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            loginNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: loginNameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: loginNameLabel.leadingAnchor)
                                    ])
        
    }
    
}
