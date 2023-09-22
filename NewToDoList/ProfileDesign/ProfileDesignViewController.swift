

import Foundation
import UIKit

class ProfileDesginViewController: UIViewController {
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("<", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "RtanImage")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "nabaecamp"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let menuButton: UIButton = {
        let button =  UIButton(type: .system)
        button.setImage(UIImage(named: "Menu"), for: .normal)
        //button.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        return button
    }()
    
    private let followButton: UIButton = {
        let button = UIButton(type: .system)
        
        if let messageImage = UIImage(named: "Follow")?.withRenderingMode(.alwaysOriginal) {
                button.setImage(messageImage, for: .normal)
            }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let messageButton: UIButton = {
        let button = UIButton(type: .system)
        if let messageImage = UIImage(named: "Message")?.withRenderingMode(.alwaysOriginal) {
                button.setImage(messageImage, for: .normal)
            }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton(type: .system)
        if let messageImage = UIImage(named: "More")?.withRenderingMode(.alwaysOriginal) {
                button.setImage(messageImage, for: .normal)
            }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let gridImage: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "Grid"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    
    
    
    private lazy var customCollectionView: CustomCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            let collectionView = CustomCollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            return collectionView
        }()
    
    
    private let postCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postLabel: UILabel = {
        let label = UILabel()
        label.text = "post"
        label.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let followerCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let followerLabel: UILabel = {
        let label = UILabel()
        label.text = "follower"
        label.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let followCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let followLabel: UILabel = {
        let label = UILabel()
        label.text = "following"
        label.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    private let introductionLabel: UILabel = {
        let label = UILabel()
        label.text = "르탄이"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer🍎"
        label.numberOfLines = 0 
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let linkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("spartacodingclub.kr", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal) // 하이퍼링크처럼 파란색으로
        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func openLink() {
        if let url = URL(string: "https://spartacodingclub.kr") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "nabaecamp"
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(titleLabel)
        view.addSubview(profileImageView)
        view.addSubview(postCountLabel)
        postCountLabel.text = "\(customCollectionView.numberOfItems)"
        
        view.addSubview(postLabel)
        view.addSubview(followerCountLabel)
        view.addSubview(followerLabel)
        view.addSubview(followCountLabel)
        view.addSubview(followLabel)
        
        view.addSubview(introductionLabel)
        view.addSubview(detailLabel)
        view.addSubview(linkButton)
        
        view.addSubview(menuButton)
        view.addSubview(followButton)
        view.addSubview(messageButton)
        view.addSubview(moreButton)
        
        view.addSubview(gridImage)
        view.addSubview(customCollectionView)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            
            profileImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            
            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            menuButton.widthAnchor.constraint(equalToConstant: 24),
            menuButton.heightAnchor.constraint(equalToConstant: 24),
            
            postCountLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 60),
            postCountLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            postLabel.centerXAnchor.constraint(equalTo: postCountLabel.centerXAnchor),
            postLabel.topAnchor.constraint(equalTo: postCountLabel.bottomAnchor, constant: 10),
            
            followerCountLabel.leadingAnchor.constraint(equalTo: postCountLabel.trailingAnchor, constant: 70),
            followerCountLabel.centerYAnchor.constraint(equalTo: postCountLabel.centerYAnchor),
            followerLabel.centerXAnchor.constraint(equalTo: followerCountLabel.centerXAnchor),
            followerLabel.topAnchor.constraint(equalTo: followerCountLabel.bottomAnchor, constant: 10),
            
            followCountLabel.leadingAnchor.constraint(equalTo: followerCountLabel.trailingAnchor, constant: 70),
            followCountLabel.centerYAnchor.constraint(equalTo: followerCountLabel.centerYAnchor),
            followLabel.centerXAnchor.constraint(equalTo: followCountLabel.centerXAnchor),
            followLabel.topAnchor.constraint(equalTo: followCountLabel.bottomAnchor, constant: 10),
            
            introductionLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            introductionLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            
            detailLabel.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 10),
            detailLabel.leadingAnchor.constraint(equalTo: introductionLabel.leadingAnchor),
            
            linkButton.topAnchor.constraint(equalTo: detailLabel.bottomAnchor),
            linkButton.leadingAnchor.constraint(equalTo: detailLabel.leadingAnchor),
            
            followButton.topAnchor.constraint(equalTo: linkButton.bottomAnchor, constant: 5),
            followButton.leadingAnchor.constraint(equalTo: linkButton.leadingAnchor),
            followButton.widthAnchor.constraint(equalToConstant: 150),
            
            messageButton.leadingAnchor.constraint(equalTo: followButton.trailingAnchor, constant: 10),
            messageButton.centerYAnchor.constraint(equalTo: followButton.centerYAnchor),
            messageButton.widthAnchor.constraint(equalTo: followButton.widthAnchor),
            messageButton.heightAnchor.constraint(equalTo: followButton.heightAnchor),
            
            moreButton.leadingAnchor.constraint(equalTo: messageButton.trailingAnchor, constant: 10),
            moreButton.centerYAnchor.constraint(equalTo: messageButton.centerYAnchor),
            moreButton.widthAnchor.constraint(equalToConstant: 30),
            moreButton.heightAnchor.constraint(equalTo: messageButton.heightAnchor),
            
            gridImage.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 10),
            gridImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            customCollectionView.topAnchor.constraint(equalTo: gridImage.bottomAnchor, constant: 10),
            customCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
