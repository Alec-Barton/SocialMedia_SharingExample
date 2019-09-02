//
//  ViewController.swift
//  TT2
//
//  Created by Alec Barton on 5/10/19.
//  Copyright © 2019 Alec Barton. All rights reserved.
//

import UIKit
import Photos
import Social

import SCSDKCreativeKit

let maxStringLen = 280

let pollBackgroundColor = UIColor(displayP3Red: 0.75, green: 0.75, blue: 0.75, alpha: 0.5)
let pollColor = UIColor(displayP3Red: 0.739, green: 0.656, blue: 0.747, alpha: 1.0)
let collegePurpleColor = UIColor(displayP3Red: 0.439, green: 0.356, blue: 0.447, alpha: 1.0)
let collegeGreenColor = UIColor(displayP3Red: 0.85, green: 0.95, blue: 0.81, alpha: 1.0)

let customFontAvenir = UIFont(name: "avenir", size: 30)!
let customFontCourier = UIFont(name: "courier", size: 30)!


let cap140 = "This is an example post for the college app.  This post can be shared to social media sites"
let cap280 = "Minecraft is a sandbox video game created by Swedish game developer Markus Persson and released by Mojang in 2011. The game allows players to build with a variety of different blocks in a 3D procedurally generated world, requiring creativity from players. Other activities ab, end"

class ViewController: UIViewController {
    
    var snapAPI : SCSDKSnapAPI!
    var snapPhoto : SCSDKSnapPhoto!
    var snapContent : SCSDKPhotoSnapContent!
    
    var documentController: UIDocumentInteractionController!
    
    var topContainerView: UIView = {
        let topContainerView = UIView()
        topContainerView.backgroundColor = UIColor.clear
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        return topContainerView
    }()
    let bottomContainerView:UIView = {
        let bottomContainerView = UIView()
        bottomContainerView.backgroundColor = .clear
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        return bottomContainerView
    }()
    let generatedImageContainer: UIView = {
        let generatedImageContainer = UIView()
        generatedImageContainer.backgroundColor = UIColor.orange
        generatedImageContainer.translatesAutoresizingMaskIntoConstraints = false
        return generatedImageContainer
    }()
    let radioContainerView: UIView = {
        let radioContainerView = UIView()
        radioContainerView.translatesAutoresizingMaskIntoConstraints = false
        return radioContainerView
    }()
    let inputContainerView: UIView = {
        let inputContainerView = UIView()
        inputContainerView.translatesAutoresizingMaskIntoConstraints = false
        return inputContainerView
    }()
    let buttonsContainerView: UIView = {
        let buttonsContainerView = UIView()
        buttonsContainerView.translatesAutoresizingMaskIntoConstraints = false
        return buttonsContainerView
    }()
    let inputField: UITextField = {
        let inputField = UITextField()
        inputField.backgroundColor = UIColor.white
        inputField.placeholder = "Enter Caption"
        inputField.font = UIFont.systemFont(ofSize: 18)
        inputField.borderStyle = UITextField.BorderStyle.roundedRect
        inputField.autocorrectionType = UITextAutocorrectionType.no
        inputField.keyboardType = UIKeyboardType.default
        inputField.returnKeyType = UIReturnKeyType.done
        inputField.clearButtonMode = UITextField.ViewMode.whileEditing
        inputField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        inputField.translatesAutoresizingMaskIntoConstraints = false
        inputField.addTarget(self, action: #selector(inputFieldDidChange), for: .editingChanged)
        return inputField
    }()
    let radioBtn1: UIButton = {
        let radioBtn1 = UIButton()
        let textFont = UIFont(name: "Avenir", size: 18)!
        let attributedTitle = NSAttributedString(string: "Text", attributes: [
            NSAttributedString.Key.font: textFont,
            ])
        radioBtn1.setAttributedTitle(attributedTitle, for: .normal)
        radioBtn1.backgroundColor = .white
        radioBtn1.layer.cornerRadius = 5
        radioBtn1.layer.borderWidth = 1
        radioBtn1.layer.borderColor = UIColor.lightGray.cgColor
        radioBtn1.addTarget(self, action: #selector(radioBtn1press), for: .touchUpInside)
        radioBtn1.translatesAutoresizingMaskIntoConstraints = false
        return radioBtn1
    }()
    let radioBtn2: UIButton = {
        let radioBtn2 = UIButton()
        let textFont = UIFont(name: "Avenir", size: 18)!
        let attributedTitle = NSAttributedString(string: "Image", attributes: [
            NSAttributedString.Key.font: textFont,
            ])
        radioBtn2.setAttributedTitle(attributedTitle, for: .normal)
        radioBtn2.backgroundColor = .white
        radioBtn2.layer.cornerRadius = 5
        radioBtn2.layer.borderWidth = 1
        radioBtn2.layer.borderColor = UIColor.lightGray.cgColor
        radioBtn2.addTarget(self, action: #selector(radioBtn2press), for: .touchUpInside)
        radioBtn2.translatesAutoresizingMaskIntoConstraints = false
        
        return radioBtn2
    }()
    let radioBtn3: UIButton = {
        let radioBtn3 = UIButton()
        let textFont = UIFont(name: "Avenir", size: 18)!
        let attributedTitle = NSAttributedString(string: "Poll", attributes: [
            NSAttributedString.Key.font: textFont,
            ])
        radioBtn3.setAttributedTitle(attributedTitle, for: .normal)
        radioBtn3.backgroundColor = .white
        radioBtn3.layer.cornerRadius = 5
        radioBtn3.layer.borderWidth = 1
        radioBtn3.layer.borderColor = UIColor.lightGray.cgColor
        radioBtn3.addTarget(self, action: #selector(radioBtn3press), for: .touchUpInside)
        radioBtn3.translatesAutoresizingMaskIntoConstraints = false
        return radioBtn3
    }()
    let socialBtn1: UIButton = {
        let socialBtn1 = UIButton()
        socialBtn1.setImage(UIImage(named: "socialInsta"), for:.normal)
        socialBtn1.contentMode = .scaleAspectFit
        socialBtn1.translatesAutoresizingMaskIntoConstraints = false
        socialBtn1.addTarget(self, action: #selector(socialBtn1press), for: .touchUpInside)
        return socialBtn1
    }()
    let socialBtn2: UIButton = {
        let socialBtn2 = UIButton()
        socialBtn2.setImage(UIImage(named: "socialSnap"), for:.normal)
        socialBtn2.contentMode = .scaleAspectFit
        socialBtn2.translatesAutoresizingMaskIntoConstraints = false
        socialBtn2.addTarget(self, action: #selector(socialBtn2press), for: .touchUpInside)
        return socialBtn2
    }()
    let socialBtn3: UIButton = {
        let socialBtn3 = UIButton()
        socialBtn3.setImage(UIImage(named: "socialTwitter"), for:.normal)
        socialBtn3.contentMode = .scaleAspectFit
        socialBtn3.translatesAutoresizingMaskIntoConstraints = false
        socialBtn3.addTarget(self, action: #selector(socialBtn3press), for: .touchUpInside)
        return socialBtn3
    }()
    let socialBtn4: UIButton = {
        let socialBtn4 = UIButton()
        socialBtn4.setImage(UIImage(named: "socialSave"), for:.normal)
        socialBtn4.contentMode = .scaleAspectFit
        socialBtn4.translatesAutoresizingMaskIntoConstraints = false
        socialBtn4.addTarget(self, action: #selector(socialBtn4press), for: .touchUpInside)
        return socialBtn4
    }()
    let socialBtn5: UIButton = {
        let socialBtn5 = UIButton()
        socialBtn5.setImage(UIImage(named: "socialEmpty"), for:.normal)
        socialBtn5.contentMode = .scaleAspectFit
        socialBtn5.translatesAutoresizingMaskIntoConstraints = false
        socialBtn5.addTarget(self, action: #selector(socialBtn5press), for: .touchUpInside)
        socialBtn5.isHidden = true
        return socialBtn5
    }()
    let socialBtn6: UIButton = {
        let socialBtn6 = UIButton()
        socialBtn6.setImage(UIImage(named: "socialEmpty"), for:.normal)
        socialBtn6.contentMode = .scaleAspectFit
        socialBtn6.translatesAutoresizingMaskIntoConstraints = false
        socialBtn6.addTarget(self, action: #selector(socialBtn6press), for: .touchUpInside)
        socialBtn6.isHidden = true
        return socialBtn6
    }()
    let socialBtn7: UIButton = {
        let socialBtn7 = UIButton()
        socialBtn7.setImage(UIImage(named: "socialEmpty"), for:.normal)
        socialBtn7.contentMode = .scaleAspectFit
        socialBtn7.translatesAutoresizingMaskIntoConstraints = false
        socialBtn7.addTarget(self, action: #selector(socialBtn7press), for: .touchUpInside)
        socialBtn7.isHidden = true
        return socialBtn7
    }()
    let socialBtn8: UIButton = {
        let socialBtn8 = UIButton()
        socialBtn8.setImage(UIImage(named: "socialEmpty"), for:.normal)
        socialBtn8.contentMode = .scaleAspectFit
        socialBtn8.translatesAutoresizingMaskIntoConstraints = false
        socialBtn8.addTarget(self, action: #selector(socialBtn8press), for: .touchUpInside)
        socialBtn8.isHidden = true
        return socialBtn8
    }()
    
    let savingAlert: UIAlertController = {
        let alert = UIAlertController(title: nil, message: "Saving Image", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        return alert
    }()
    var giView: GeneratedImageView = {
        let giView = GeneratedImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), type: 1)
        giView.translatesAutoresizingMaskIntoConstraints = false
        return giView
    }()
    
    //init
    required init?(coder aDecoder: NSCoder) {
        
//        self.snapPhoto =  SCSDKSnapPhoto(image:UIImage(named: "test")!)
//        self.snapContent = SCSDKPhotoSnapContent(snapPhoto: snapPhoto)
//        self.snapContent.caption = "test"
//        self.snapAPI = SCSDKSnapAPI(content: snapContent)
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //dismiss keyboard with tap setup
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        self.view.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        setupLayout()
    }
    
    //constrain all the stuff
    private func setupLayout () {
        view.addSubview(topContainerView)
        view.addSubview(bottomContainerView)

        topContainerView.addSubview(generatedImageContainer)
        
        bottomContainerView.addSubview(radioContainerView)
        bottomContainerView.addSubview(inputContainerView)
        bottomContainerView.addSubview(buttonsContainerView)
        
        radioContainerView.addSubview(radioBtn1)
        radioContainerView.addSubview(radioBtn2)
        radioContainerView.addSubview(radioBtn3)
        
        inputContainerView.addSubview(inputField)
        
        buttonsContainerView.addSubview(socialBtn1)
        buttonsContainerView.addSubview(socialBtn2)
        buttonsContainerView.addSubview(socialBtn3)
        buttonsContainerView.addSubview(socialBtn4)
        buttonsContainerView.addSubview(socialBtn5)
        buttonsContainerView.addSubview(socialBtn6)
        buttonsContainerView.addSubview(socialBtn7)
        buttonsContainerView.addSubview(socialBtn8)
        
        NSLayoutConstraint.activate([
            //top views
            topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            topContainerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            topContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            topContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            generatedImageContainer.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.8),
            generatedImageContainer.widthAnchor.constraint(equalTo: generatedImageContainer.heightAnchor),
            generatedImageContainer.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            generatedImageContainer.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor),

            //bottom views
            bottomContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            bottomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            //input
            inputContainerView.topAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: 20),
            inputContainerView.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor),
            inputContainerView.widthAnchor.constraint(equalTo: bottomContainerView.widthAnchor, multiplier: 0.8),
            inputContainerView.heightAnchor.constraint(equalTo: bottomContainerView.heightAnchor, multiplier: 0.15),
            
            inputField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor),
            inputField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor),
            inputField.centerXAnchor.constraint(equalTo: inputContainerView.centerXAnchor),
            inputField.centerYAnchor.constraint(equalTo: inputContainerView.centerYAnchor),
            
            //radio buttons
            radioContainerView.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 20),
            radioContainerView.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor),
            radioContainerView.widthAnchor.constraint(equalTo: bottomContainerView.widthAnchor, multiplier: 0.8),
            radioContainerView.heightAnchor.constraint(equalTo: bottomContainerView.heightAnchor, multiplier: 0.15),
            
            radioBtn1.topAnchor.constraint(equalTo:radioContainerView.topAnchor),
            radioBtn1.leadingAnchor.constraint(equalTo: radioContainerView.leadingAnchor),
            radioBtn1.heightAnchor.constraint(equalTo: radioContainerView.heightAnchor),
            radioBtn1.widthAnchor.constraint(equalTo: radioBtn1.heightAnchor,  multiplier: 1.5),
            
            radioBtn2.topAnchor.constraint(equalTo:radioContainerView.topAnchor),
            radioBtn2.centerXAnchor.constraint(equalTo: radioContainerView.centerXAnchor),
            radioBtn2.heightAnchor.constraint(equalTo: radioContainerView.heightAnchor),
            radioBtn2.widthAnchor.constraint(equalTo: radioBtn2.heightAnchor, multiplier: 1.5),
            
            radioBtn3.topAnchor.constraint(equalTo:radioContainerView.topAnchor),
            radioBtn3.trailingAnchor.constraint(equalTo: radioContainerView.trailingAnchor),
            radioBtn3.heightAnchor.constraint(equalTo: radioContainerView.heightAnchor),
            radioBtn3.widthAnchor.constraint(equalTo: radioBtn3.heightAnchor, multiplier: 1.5),
            
            
            //social buttons
            buttonsContainerView.topAnchor.constraint(equalTo: radioContainerView.bottomAnchor, constant:20),
            buttonsContainerView.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor),
            buttonsContainerView.heightAnchor.constraint(equalTo: bottomContainerView.heightAnchor, multiplier: 0.4),
            

            socialBtn1.topAnchor.constraint(equalTo: buttonsContainerView.topAnchor),
            socialBtn1.leadingAnchor.constraint(equalTo: buttonsContainerView.leadingAnchor),
            socialBtn1.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 0.5),
            socialBtn1.widthAnchor.constraint(equalTo: socialBtn1.heightAnchor),
            
            socialBtn2.topAnchor.constraint(equalTo: buttonsContainerView.topAnchor),
            socialBtn2.leadingAnchor.constraint(equalTo: socialBtn1.trailingAnchor),
            socialBtn2.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 0.5),
            socialBtn2.widthAnchor.constraint(equalTo: socialBtn2.heightAnchor),
            
            socialBtn3.topAnchor.constraint(equalTo: buttonsContainerView.topAnchor),
            socialBtn3.leadingAnchor.constraint(equalTo: socialBtn2.trailingAnchor),
            socialBtn3.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 0.5),
            socialBtn3.widthAnchor.constraint(equalTo: socialBtn3.heightAnchor),
            
            socialBtn4.topAnchor.constraint(equalTo: buttonsContainerView.topAnchor),
            socialBtn4.leadingAnchor.constraint(equalTo: socialBtn3.trailingAnchor),
            socialBtn4.trailingAnchor.constraint(equalTo: buttonsContainerView.trailingAnchor),
            socialBtn4.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 0.5),
            socialBtn4.widthAnchor.constraint(equalTo: socialBtn4.heightAnchor),
            
            socialBtn5.bottomAnchor.constraint(equalTo: buttonsContainerView.bottomAnchor),
            socialBtn5.leadingAnchor.constraint(equalTo: buttonsContainerView.leadingAnchor),
            socialBtn5.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 0.5),
            socialBtn5.widthAnchor.constraint(equalTo: socialBtn5.heightAnchor),
            
            socialBtn6.bottomAnchor.constraint(equalTo: buttonsContainerView.bottomAnchor),
            socialBtn6.leadingAnchor.constraint(equalTo:socialBtn5.trailingAnchor),
            socialBtn6.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 0.5),
            socialBtn6.widthAnchor.constraint(equalTo: socialBtn6.heightAnchor),
            
            socialBtn7.bottomAnchor.constraint(equalTo: buttonsContainerView.bottomAnchor),
            socialBtn7.leadingAnchor.constraint(equalTo:socialBtn6.trailingAnchor),
            socialBtn7.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 0.5),
            socialBtn7.widthAnchor.constraint(equalTo: socialBtn7.heightAnchor),
            
            socialBtn8.bottomAnchor.constraint(equalTo: buttonsContainerView.bottomAnchor),
            socialBtn8.leadingAnchor.constraint(equalTo:socialBtn7.trailingAnchor),
            socialBtn8.trailingAnchor.constraint(equalTo: buttonsContainerView.trailingAnchor),
            socialBtn8.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 0.5),
            socialBtn8.widthAnchor.constraint(equalTo: socialBtn8.heightAnchor),
            
        ])

        self.view.layoutIfNeeded()

        let tempFrame = CGRect(x:0, y:0, width: generatedImageContainer.frame.width , height: generatedImageContainer.frame.height)
        self.giView = GeneratedImageView(frame: tempFrame, type: 1)
        generatedImageContainer.addSubview(giView)
        NSLayoutConstraint.activate([
            giView.heightAnchor.constraint(equalTo:generatedImageContainer.heightAnchor),
            giView.widthAnchor.constraint(equalTo:giView.heightAnchor),
            giView.leadingAnchor.constraint(equalTo:generatedImageContainer.leadingAnchor),
            giView.topAnchor.constraint(equalTo:generatedImageContainer.topAnchor),
            ])
    }
    
    //adds a new generated image
    func addGIView (type: Int, caption: String = "Error"){
        let newFrame = CGRect(x: 0, y: 0, width: generatedImageContainer.frame.width, height: generatedImageContainer.frame.height)
        self.giView = GeneratedImageView(frame: newFrame, type: type, caption: caption)
        generatedImageContainer.addSubview(giView)
        NSLayoutConstraint.activate([
            giView.heightAnchor.constraint(equalTo:generatedImageContainer.heightAnchor),
            giView.widthAnchor.constraint(equalTo:generatedImageContainer.widthAnchor),
            giView.centerXAnchor.constraint(equalTo:generatedImageContainer.centerXAnchor),
            giView.centerYAnchor.constraint(equalTo:generatedImageContainer.centerYAnchor),
            ])
    }
    
    //removes old generated image
    func removeGIView (){
        NSLayoutConstraint.deactivate([
            giView.heightAnchor.constraint(equalTo:generatedImageContainer.heightAnchor),
            giView.widthAnchor.constraint(equalTo:generatedImageContainer.widthAnchor),
            giView.centerXAnchor.constraint(equalTo:generatedImageContainer.centerXAnchor),
            giView.centerYAnchor.constraint(equalTo:generatedImageContainer.centerYAnchor),
            ])
        generatedImageContainer.willRemoveSubview(self.giView)
        print("removed")
    }
    
    //updates caption
    func updateCaption (){
        if self.inputField.text! != ""{
            giView.setCaption(caption: self.inputField.text ?? "error")
        }
    }

    //generates a static image of a color gradient for backgrounds
    func gradientImageWithBounds(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    //sends a snapchat
    func sendSnap(completionHandler: (Bool, Error?) ->()) {
        //first generate the image your going to send to snapchat
        let screenSize =  UIScreen.main.bounds
        let snapView: UIView = {
            let snapView = UIView()
            snapView.frame =  screenSize
            snapView.translatesAutoresizingMaskIntoConstraints = false
            return snapView
        }()
        let gradientView:UIImageView = {
            let gradientView = UIImageView()
            gradientView.frame = screenSize
            gradientView.image = gradientImageWithBounds(bounds: screenSize, colors: [collegePurpleColor.cgColor, collegeGreenColor.cgColor])
            gradientView.translatesAutoresizingMaskIntoConstraints = false
            return gradientView
        }()
        let snapContentView:GeneratedImageView = {
            let contentCaption = self.giView.caption
            let contentType = self.giView.type
            let contentHeight = self.view.frame.height * 0.5
            let contentWidth = self.view.frame.width * 0.75
            let contentX = (screenSize.width/2) - (contentWidth/2)
            let contentY = (screenSize.height/2) - (contentHeight/2) * 1.15
            let snapContentView = GeneratedImageView(frame: (CGRect(x: contentX, y: contentY, width: contentWidth, height: contentHeight)), type: contentType, caption: contentCaption)
            snapContentView.layer.shadowColor = UIColor.darkGray.cgColor
            snapContentView.layer.shadowRadius = 10
            snapContentView.layer.shadowOpacity = 0.5
            snapContentView.layer.shadowOffset = CGSize(width: 0, height: 10)
            return snapContentView
        }()
        snapView.addSubview(gradientView)
        snapView.addSubview(snapContentView)
        
        NSLayoutConstraint.activate([
            gradientView.centerXAnchor.constraint(equalTo: snapView.centerXAnchor),
            gradientView.centerYAnchor.constraint(equalTo: snapView.centerYAnchor),
            gradientView.widthAnchor.constraint(equalTo:snapView.widthAnchor),
            gradientView.heightAnchor.constraint(equalTo:snapView.heightAnchor),
            ])
        //render out views as an image
        let renderer = UIGraphicsImageRenderer(bounds: snapView.bounds)
        let i = renderer.image { ctx in
            snapView.drawHierarchy(in: snapView.bounds, afterScreenUpdates: true)
        }
        
        //send image over to snapchat
        self.snapPhoto =  SCSDKSnapPhoto(image: i)
        self.snapContent = SCSDKPhotoSnapContent(snapPhoto: snapPhoto)
        //customizamable link
        snapContent.attachmentUrl = "https://thecollegeapp.co"
        self.snapAPI = SCSDKSnapAPI(content: snapContent)
//        view.isUserInteractionEnabled = false
        snapAPI.startSnapping() { [weak self] (error: Error?) in
        }
    }
    
    //post to instagram story
    func sendGram(){
        //generate and render out images for instagram
        let screenSize =  UIScreen.main.bounds
        let gramContentView:GeneratedImageView = {
            let contentCaption = self.giView.caption
            let contentType = self.giView.type
            let contentHeight = self.view.frame.height * 0.5
            let contentWidth = self.view.frame.width * 0.75
            let contentX = (screenSize.width/2) - (contentWidth/2)
            let contentY = (screenSize.height/2) - (contentHeight/2) * 1.15
            let gramContentView = GeneratedImageView(frame: (CGRect(x: contentX, y: contentY, width: contentWidth, height: contentHeight)), type: contentType, caption: contentCaption)
            gramContentView.layer.shadowColor = UIColor.darkGray.cgColor
            gramContentView.layer.shadowRadius = 10
            gramContentView.layer.shadowOpacity = 0.5
            gramContentView.layer.shadowOffset = CGSize(width: 0, height: 10)
            return gramContentView
        }()
        let renderer = UIGraphicsImageRenderer(bounds: gramContentView.bounds)
        let i = renderer.image { ctx in
            gramContentView.drawHierarchy(in: gramContentView.bounds, afterScreenUpdates: true)
        }
        
        
        //send images to instagram
        let url = URL(string: "instagram-stories://share")!
        if UIApplication.shared.canOpenURL(url){
            
            let backgroundData =  gradientImageWithBounds(bounds: screenSize, colors: [collegePurpleColor.cgColor, collegeGreenColor.cgColor]).jpegData(compressionQuality: 1)
            let stickerData = i.pngData()!
            //background and main image are two different items unlike snapchat
            let pasteBoardItems = [
                ["com.instagram.sharedSticker.backgroundImage" : backgroundData,
                "com.instagram.sharedSticker.stickerImage" : stickerData,]
            ]
            
            if #available(iOS 10.0, *) {
                UIPasteboard.general.setItems(pasteBoardItems, options: [.expirationDate: Date().addingTimeInterval(60 * 5)])
            } else {
                UIPasteboard.general.items = pasteBoardItems
            }
            UIApplication.shared.openURL(url)
        }
    }
    
    //alternate way to post to InstaGram
    //not using this currently in the project but im keeping it here for later
    //this function gives the user the option to post to either instagram normally or to their story
    //except i cant figure a good way to send two different images this way so it doesnt crop right
    func sendGramALT(){
        let screenSize =  UIScreen.main.bounds
        let snapView: UIView = {
            let snapView = UIView()
            snapView.frame =  screenSize
            snapView.translatesAutoresizingMaskIntoConstraints = false
            return snapView
        }()
        let gradientView:UIImageView = {
            let gradientView = UIImageView()
            gradientView.frame = screenSize
            gradientView.image = gradientImageWithBounds(bounds: screenSize, colors: [collegePurpleColor.cgColor, collegeGreenColor.cgColor])
            gradientView.translatesAutoresizingMaskIntoConstraints = false
            return gradientView
        }()
        let snapContentView:GeneratedImageView = {
            let contentCaption = self.giView.caption
            let contentType = self.giView.type
            let contentWidth = self.view.frame.width * 0.8
            let contentHeight = contentWidth
            let contentX = (screenSize.width/2) - (contentWidth/2)
            let contentY = (screenSize.height/2) - (contentHeight/2)
            let snapContentView = GeneratedImageView(frame: (CGRect(x: contentX, y: contentY, width: contentWidth, height: contentHeight)), type: contentType, caption: contentCaption)
            snapContentView.layer.shadowColor = UIColor.darkGray.cgColor
            snapContentView.layer.shadowRadius = 10
            snapContentView.layer.shadowOpacity = 0.5
            snapContentView.layer.shadowOffset = CGSize(width: 0, height: 10)
            return snapContentView
        }()
        
        snapView.addSubview(gradientView)
        snapView.addSubview(snapContentView)
        NSLayoutConstraint.activate([
            gradientView.centerXAnchor.constraint(equalTo: snapView.centerXAnchor),
            gradientView.centerYAnchor.constraint(equalTo: snapView.centerYAnchor),
            gradientView.widthAnchor.constraint(equalTo:snapView.widthAnchor),
            gradientView.heightAnchor.constraint(equalTo:snapView.heightAnchor),
            ])
        let renderer = UIGraphicsImageRenderer(bounds: snapView.bounds)
        let i = renderer.image { ctx in
            snapView.drawHierarchy(in: snapView.bounds, afterScreenUpdates: true)
        }
        DispatchQueue.main.async {
            let instagramURL = URL(string: "instagram://app")
            if UIApplication.shared.canOpenURL(instagramURL!) {
                let imageData = i.jpegData(compressionQuality: 1)
                let writePath = (NSTemporaryDirectory() as NSString).appendingPathComponent("instagram.igo")
                do {
                    try imageData?.write(to: URL(fileURLWithPath: writePath), options: .atomic)
                } catch {
                    print(error)
                }
                let fileURL = URL(fileURLWithPath: writePath)
                self.documentController = UIDocumentInteractionController(url: fileURL)
                self.documentController.uti = "com.instagram.exclusivegram"
                if UIDevice.current.userInterfaceIdiom == .phone {
                    self.documentController.presentOpenInMenu(from: self.view.bounds, in: self.view, animated: false)
                } else {
                    self.documentController.presentOpenInMenu(from: CGRect(x: 0, y: 0, width: 100, height: 100), in:self.view, animated: true)
                }
            } else {
                print(" Instagram is not installed ")
            }
        }
    }

    
    //post to twitter
    //use's swifts deprecated built-in social API because twitters API is weird JSON shit that i dont feel like messing with
    //this api also includes fucntionality for like facebook and a few other apps aswell
    func sendTwitter(){
        //geneates the image to the proper ratio so that it appears correctly on twitter, looks funny in app but when it posts its the right size
        let screenSize =  UIScreen.main.bounds
        let twitterContentView:GeneratedImageView = {
            let contentCaption = self.giView.caption
            let contentType = self.giView.type
            let contentHeight = self.view.frame.width * (9/16)
            let contentWidth = self.view.frame.width

            let twitterContentView = GeneratedImageView(frame: (CGRect(x:0, y:0, width: contentWidth, height: contentHeight)), type: contentType, caption: contentCaption)
            return twitterContentView
        }()
        
        let renderer = UIGraphicsImageRenderer(bounds: twitterContentView.bounds)
        let twitterImage = renderer.image { ctx in
            twitterContentView.drawHierarchy(in: twitterContentView.bounds, afterScreenUpdates: true)
        }
        
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
            vc.setInitialText("#TheCollegeApp ")
            vc.add(twitterImage)
            present(vc, animated: true)
        }
    }
    
    //save image to camera roll
    func sendSave(){
        let saveContentView:GeneratedImageView = {
            let contentCaption = self.giView.caption
            let contentType = self.giView.type
            let contentHeight = self.view.frame.width
            let contentWidth = self.view.frame.width
            let contentX = CGFloat(0)
            let contentY = CGFloat(0)
            let saveContentView = GeneratedImageView(frame: (CGRect(x: contentX, y: contentY, width: contentWidth, height: contentHeight)), type: contentType, caption: contentCaption)
            return saveContentView
        }()
       
        let renderer = UIGraphicsImageRenderer(bounds: saveContentView.bounds)
        let i = renderer.image { ctx in
            saveContentView.drawHierarchy(in: saveContentView.bounds, afterScreenUpdates: true)
        }

        present(savingAlert, animated: true, completion: nil)
        
        let imageData = i.pngData()
        let compresedImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compresedImage!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    //part of saving to camera roll
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        savingAlert.dismiss(animated: false, completion: nil)
    }

    @objc func inputFieldDidChange(){
        updateCaption()
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    //text image
    @objc func radioBtn1press(){
        radioBtn1.backgroundColor = UIColor.lightGray
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15, execute: {
            self.radioBtn1.backgroundColor = UIColor.white
        })
       
        let tempCaption = giView.caption
        removeGIView()
        addGIView(type: 1, caption: tempCaption)

        updateCaption()
    }
    //image image
    @objc func radioBtn2press(){
        radioBtn2.backgroundColor = UIColor.lightGray
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15, execute: {
            self.radioBtn2.backgroundColor = UIColor.white
        })
        let tempCaption = giView.caption
        removeGIView()
        addGIView(type: 2, caption: tempCaption)
        updateCaption()
    }
    //poll image
    @objc func radioBtn3press(){
        radioBtn3.backgroundColor = UIColor.lightGray
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15, execute: {
            self.radioBtn3.backgroundColor = UIColor.white
        })
        let tempCaption = giView.caption
        removeGIView()
        addGIView(type: 3, caption: tempCaption)
        updateCaption()
    }
    
    @objc func socialBtn1press () {
        sendGram()
    }
    @objc func socialBtn2press () {
        let compHandler: (Bool, Error?) -> Void = {_,_  in }
        sendSnap(completionHandler: compHandler)
    }
    @objc func socialBtn3press () {
       sendTwitter()
    }
    @objc func socialBtn4press () {
        sendSave()
    }
    
    //placeholders
    @objc func socialBtn5press () {
    }
    @objc func socialBtn6press () {
    }
    @objc func socialBtn7press () {
    }
    @objc func socialBtn8press () {
    }
}
