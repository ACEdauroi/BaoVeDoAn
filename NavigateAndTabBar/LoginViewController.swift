//
//  LoginViewController.swift
//  NavigateAndTabBar
//
//  Created by Apple on 22/09/2021.
//
import FBSDKLoginKit
import UIKit
import FSCalendar
class LoginViewController: UIViewController, LoginButtonDelegate {

    private let userField : UITextField = {
       let field = UITextField ()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = true
        field.keyboardType = .namePhonePad
        field.placeholder = "User name..."
        field.textColor =  .black
        field.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        field.leftView = UIView(frame: CGRect (x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
       return field
}()
    private let passwordField : UITextField = {
        let pass = UITextField()
        pass.autocapitalizationType = .none
        pass.autocorrectionType = .no
        pass.returnKeyType = .continue
        pass.layer.borderColor = UIColor.lightGray.cgColor
        pass.translatesAutoresizingMaskIntoConstraints = true
        pass.keyboardType = .namePhonePad
        pass.placeholder = "Password..."
        pass.textColor =  .black
        pass.layer.cornerRadius = 10
        pass.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        pass.leftView = UIView(frame: CGRect (x: 0, y: 0, width: 5, height: 0))
        pass.leftViewMode = .always
        pass.isSecureTextEntry = true
    return pass
    
        
    }()
    
    private let button : UIButton = {
        let uiButton = UIButton ()
        uiButton.setTitle("Login", for: .normal)
        uiButton.setTitleColor(.white, for: .normal)
        uiButton.backgroundColor = UIColor(red: 0.00, green: 0.82, blue: 1.00, alpha: 1.00)
        uiButton.layer.cornerRadius = 10
    return uiButton
    
    }()
    
    private let label : UILabel = {
       let labelAsk = UILabel ()
        labelAsk.text = "Don't have account yet?"
        labelAsk.textColor = UIColor(red: 0.69, green: 0.69, blue: 0.69, alpha: 1.00)
        labelAsk.font = .boldSystemFont(ofSize: 15)
        labelAsk.attributedText = NSAttributedString(string: "Don't have account yet?", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        return labelAsk
    }()
    
    private let label2 : UIButton = {
       let labelAsk2 = UIButton ()
        labelAsk2.setTitle("Sign-up", for: .normal)
        labelAsk2.setTitleColor(.black, for: .normal)
        
        return labelAsk2
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(passwordField)
        view.addSubview(userField)
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(label2)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        label2.addTarget(self, action: #selector(RegisterTappaed), for: .touchUpInside)
        userField.delegate = self
        passwordField.delegate = self
        
        
        
        
        
        let labelLogin = UILabel (frame: CGRect(x: 105, y: 40, width: 200, height: 100))
        labelLogin.text = "WELCOME BACK"
        labelLogin.textColor = .black
        labelLogin.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(labelLogin)
        
        let image = UIImageView (frame: CGRect(x: 80, y: 140, width: 210, height: 210))
        image.image = UIImage(named: "Logo")
        view.addSubview(image)
        
        if let token = AccessToken.current,
                !token.isExpired {
            let token = token.tokenString
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields":"email, name"], tokenString: token, version: nil, httpMethod: .get)
            request.start(completion: { connection, result, error in
                print("\(result)")
                
            })
            }
        else {
            let loginButton = FBLoginButton(frame: CGRect(x: 35, y: 640, width: 150, height: 50))
            loginButton.delegate = self
            loginButton.setTitle("Facebook", for: .normal)
            loginButton.layer.cornerRadius = 30
            loginButton.permissions = ["public_profile", "email"]
            view.addSubview(loginButton)
        }
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userField.frame = CGRect(x: 35, y: 400, width: 300, height: 50)
        passwordField.frame = CGRect(x: 35, y: 485, width: 300, height: 50)
        button.frame = CGRect(x: 35, y: 570, width: 300, height: 50)
        label.frame = CGRect(x: 70, y: 685, width: 300, height: 50)
        label2.frame = CGRect(x: 130, y: 685, width: 300, height: 50)
    }
    
    @objc private func loginButtonTapped () {
        userField.resignFirstResponder()
        passwordField.resignFirstResponder()
        guard let user = userField.text, let password = passwordField.text, !user.isEmpty, !password.isEmpty, password.count >= 6  else {
            alertUserLoginError()
            return
        }
        
    
    }
     func alertUserLoginError () {
        let alert = UIAlertController(title: "Woops", message: "Please fill-up your information, please", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dimiss", style: .destructive, handler: nil))
        present(alert, animated: true)
     }
    
    
    @objc func didTapButton () {
        userField.resignFirstResponder()
        passwordField.resignFirstResponder()
        let vc6 = SecondViewController ()
        self.navigationController?.pushViewController(vc6, animated: true)
    }
    
    
    @objc func RegisterTappaed () {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields":"email, name"], tokenString: token, version: nil, httpMethod: .get)
        request.start(completion: { connection, result, error in
            print("\(result)")
            
        })
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    
  
    
    
}

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            loginButtonTapped()
        }
        
        return true
    }
}

class SecondViewController : UIViewController  {
    let someImageView: UIImageView = {
           let theImageView = UIImageView()
           theImageView.image = UIImage(named: "bags_kit8-net 1")
           theImageView.translatesAutoresizingMaskIntoConstraints = false
           return theImageView
        }()
    let buttonWelcome: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = UIColor(red: 0.01, green: 0.88, blue: 0.93, alpha: 1.00)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(didTapMenu), for: .touchUpInside)
        return button
    }()
    
    let quotes: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "The world is a book and those who do not travel read only one page."
        
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor =  UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)

       

        return label
    }()
    
    let hello: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Hello"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor =  UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)

       

        return label
    }()
    
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
            
        
            
            view.backgroundColor = .white
            view.addSubview(someImageView)
            view.addSubview(buttonWelcome)
            view.addSubview(quotes)
            view.addSubview(hello)
            
           someImageViewConstraints()
    }
    func someImageViewConstraints() {
            someImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
            someImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
            someImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            someImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 28).isActive = true
            someImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.2).isActive = true
            someImageView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.8).isActive = true
        
            buttonWelcome.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            buttonWelcome.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 350).isActive = true
            buttonWelcome.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.55).isActive = true
            buttonWelcome.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.05).isActive = true
        
            quotes.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -275).isActive = true
            quotes.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
            quotes.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
            hello.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -320).isActive = true
            hello.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
            hello.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         
        
        
        }
    @objc func didTapMenu () {
        let tabBarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController ())
        let vc2 = UINavigationController(rootViewController: SearchViewController ())
        let vc3 = UINavigationController(rootViewController: ProfileViewController ())
        let vc4 = UINavigationController(rootViewController: BookingViewController ())
        let vc5 = UINavigationController(rootViewController: SettingsViewController ())
        
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "Profile"
        vc4.title = "Booking"
        vc5.title = "Settings"
        
        tabBarVC.setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: true)
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        let images = ["house", "magnifyingglass", "person", "airplane", "gearshape"]
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC,animated: true)
        
    }
}
class RegisterViewController : UIViewController {
    
    
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 0.1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "User Name..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        return field
    }()

    

    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 0.1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Address..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        return field
    }()
    
    private let phoneNumber: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 0.1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Number phone..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        field.keyboardType = .numberPad
        return field
    }()

    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 0.1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        field.isSecureTextEntry = true
        return field
    }()
    
    private let cfpasswordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 0.1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Confirm Password..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        field.isSecureTextEntry = true
        return field
    }()

    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor(red: 0.01, green: 0.88, blue: 0.93, alpha: 1.00)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return button
    }()
    
    private let imagePicker : UIImageView = {
       let image = UIImageView ()
        image.image = UIImage(named: "icons8-user-48")
        image.contentMode = .scaleAspectFill
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.layer.cornerRadius = 50
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imagePicker)
        view.addSubview(registerButton)
        view.addSubview(passwordField)
        view.addSubview(emailField)
        view.addSubview(firstNameField)
        view.addSubview(cfpasswordField)
        view.addSubview(phoneNumber)
        imagePicker.isUserInteractionEnabled = true 
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
        imagePicker.addGestureRecognizer(gesture)
    }
    @objc private func didTapChangeProfilePic () {
        presentPhotoActionSheet()
    }
    
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            registerButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            registerButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
            
            imagePicker.frame = CGRect(x: 140, y: 100, width: 100, height: 100)
            firstNameField.frame = CGRect(x: 35, y: 250, width: 300, height: 50)
            emailField.frame = CGRect(x: 35, y: 330, width: 300, height: 50)
            passwordField.frame = CGRect(x: 35, y: 410, width: 300, height: 50)
            cfpasswordField.frame = CGRect(x: 35, y: 490, width: 300, height: 50)
            phoneNumber.frame = CGRect(x: 35, y: 570, width: 300, height: 50)
            registerButton.frame = CGRect(x: 60, y: 650, width: 250, height: 50)
        }
    @objc func didTapButton () {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func loginButtonTapped () {
        firstNameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        guard let user = firstNameField.text, let password = passwordField.text, !user.isEmpty, !password.isEmpty, password.count >= 6  else {
            alertUserLoginError()
            return
    }
        func alertUserLoginError () {
           let alert = UIAlertController(title: "Woops", message: "Please fill-up your information, please", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Dimiss", style: .destructive, handler: nil))
           present(alert, animated: true)
        }
    }
    
    
}
extension RegisterViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet () {
        let actionSheet = UIAlertController(title: "Profile Picture", message: "Select Picture", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .destructive,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo",
                                            style: .default,
                                            handler: { [weak self] _ in
                                                self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo",
                                            style: .default,
                                            handler: { [weak self] _ in
                                                self?.presentPhotoPicker()
                                                
    }))
        present(actionSheet, animated: true )
    }
    func presentCamera() {
      let vc = UIImagePickerController ()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
    }
    func presentPhotoPicker() {
        let vc = UIImagePickerController ()
          vc.sourceType = .photoLibrary
          vc.delegate = self
          vc.allowsEditing = true
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        self.imagePicker.image = selectImage
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}

extension RegisterViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            loginButtonTapped()
        }
        
        return true
    }
}
