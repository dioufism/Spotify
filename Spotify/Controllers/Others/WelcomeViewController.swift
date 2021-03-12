//
//  WelcomeViewController.swift
//  Spotify
//
//  Created by ousmane diouf on 3/10/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
//MARK: UI Components
    private let signedInbutton: UIButton =  {
        let button =  UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign in with spotify", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Spotify"
        view.backgroundColor = .green
        view.addSubview(signedInbutton)
        print(AuthManager.shared.signInURL?.absoluteString)

        signedInbutton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signedInbutton.frame = CGRect(x: 20,
                                      y: view.height-50-view.safeAreaInsets.bottom,
                                      width: view.width-40,
                                      height: 50)
    }
//MARK: IBAction
    @objc func didTapSignIn() {
        let vc =  AuthViewController()
        vc.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
            
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }

    private func handleSignIn(success: Bool) {
        // log user in or handle error
    }

}
