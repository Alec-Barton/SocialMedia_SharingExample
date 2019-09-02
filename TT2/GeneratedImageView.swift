//
//  GeneratedImageView.swift
//  TT2
//
//  Created by Alec Barton on 5/29/19.
//  Copyright © 2019 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

//generated image view lays out a view that looks like a post
//currently many of the attributes are hard coded but in the future they can be passed in instead
//currently caption and size/ratio are able to be modified
//number of polls, percent/votes/information of polls all editable, can be passed later on
//image can also be passed later on
class GeneratedImageView: UIView {
    //type of post
    var type: Int = 1
    var caption: String = "This is an example Post.  Example Example"
    //number of poll options, can be modifiable later
    var pollNUM: Int = 4
    
    var generatedView: UIView = {
        let generatedView = UIView()
        generatedView.backgroundColor = UIColor.white
        generatedView.translatesAutoresizingMaskIntoConstraints = false
        return generatedView
    }()
    let giTopBox: UIView = {
        let giTopBox = UIView()
        giTopBox.backgroundColor = UIColor(displayP3Red: 0.439, green: 0.356, blue: 0.447, alpha: 1.0)
        giTopBox.translatesAutoresizingMaskIntoConstraints = false
        return giTopBox
    }()
    let giTitleLabel: UILabel = {
        let giTitleLabel = UILabel()
        let customFontCollege = UIFont(name: "college", size: 90)!
        giTitleLabel.font = customFontCollege
        giTitleLabel.textColor = UIColor.white
        giTitleLabel.text = "The College App"
        giTitleLabel.adjustsFontSizeToFitWidth = true
        giTitleLabel.numberOfLines = 0
        giTitleLabel.textAlignment = .center
        giTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return giTitleLabel
    }()
    let giBottomBox: UIView = {
        let giBottomBox = UIView()
        giBottomBox.backgroundColor = UIColor.white
        giBottomBox.translatesAutoresizingMaskIntoConstraints = false
        return giBottomBox
    }()
    let giLogoView: UIImageView = {
        let giLogoView = UIImageView()
        giLogoView.image = UIImage(named: "simpleLogo")
        giLogoView.contentMode = .scaleAspectFit
        giLogoView.translatesAutoresizingMaskIntoConstraints = false
        return giLogoView
    }()
    let giContentBox: UIView = {
        let giContentBox = UIView()
        giContentBox.translatesAutoresizingMaskIntoConstraints = false
        giContentBox.backgroundColor = UIColor.clear
        return giContentBox
    }()
    let giTextBox: UIView = {
        let giTextBox = UIView()
        giTextBox.translatesAutoresizingMaskIntoConstraints = false
        giTextBox.backgroundColor = UIColor.clear
        return giTextBox
    }()
    let giCaptionLabel: UILabel = {
        let giCaptionLabel = UILabel()
        giCaptionLabel.font = customFontAvenir
        giCaptionLabel.textColor = UIColor.black
        giCaptionLabel.text = cap140
        giCaptionLabel.numberOfLines = 8
        giCaptionLabel.adjustsFontSizeToFitWidth = true
        giCaptionLabel.textAlignment = .left
        giCaptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return giCaptionLabel
    }()
    let giSourceLabel: UILabel = {
        let giSourceLabel = UILabel()
        giSourceLabel.font = customFontAvenir
        giSourceLabel.textColor = UIColor.black
        giSourceLabel.text = "- Ramapo College"
        giSourceLabel.numberOfLines = 1
        giSourceLabel.baselineAdjustment = .alignCenters
        giSourceLabel.textAlignment = .right
        giSourceLabel.adjustsFontSizeToFitWidth = true
        giSourceLabel.translatesAutoresizingMaskIntoConstraints = false
        return giSourceLabel
    }()
    let giSpecialBox: UIView = {
        let giSpecialBox = UIView()
        giSpecialBox.translatesAutoresizingMaskIntoConstraints = false
        giSpecialBox.backgroundColor = UIColor.clear
        return giSpecialBox
    }()
    let giImageView: UIImageView = {
        let giImageView = UIImageView()
        giImageView.image = UIImage(named: "test")
        giImageView.contentMode = .scaleAspectFit
        giImageView.translatesAutoresizingMaskIntoConstraints = false
        return giImageView
    }()
    let giPollContainer: UIView = {
        let giPollContainer = UIView()
        giPollContainer.backgroundColor = UIColor.clear
        giPollContainer.translatesAutoresizingMaskIntoConstraints = false
        return giPollContainer
    }()
    let giPollBox1: UIView = {
        let giPollBox1 = UIView()
        giPollBox1.backgroundColor = pollBackgroundColor
        giPollBox1.layer.cornerRadius = 5
        giPollBox1.translatesAutoresizingMaskIntoConstraints = false
        return giPollBox1
    }()
    let giPollBox2: UIView = {
        let giPollBox2 = UIView()
        giPollBox2.backgroundColor = pollBackgroundColor
        giPollBox2.layer.cornerRadius = 5
        giPollBox2.translatesAutoresizingMaskIntoConstraints = false
        return giPollBox2
    }()
    let giPollBox3: UIView = {
        let giPollBox3 = UIView()
        giPollBox3.backgroundColor = pollBackgroundColor
        giPollBox3.layer.cornerRadius = 5
        giPollBox3.translatesAutoresizingMaskIntoConstraints = false
        return giPollBox3
    }()
    let giPollBox4: UIView = {
        let giPollBox4 = UIView()
        giPollBox4.backgroundColor = pollBackgroundColor
        giPollBox4.layer.cornerRadius = 5
        giPollBox4.translatesAutoresizingMaskIntoConstraints = false
        return giPollBox4
    }()
    let giPollBox5: UIView = {
        let giPollBox5 = UIView()
        giPollBox5.backgroundColor = pollBackgroundColor
        giPollBox5.layer.cornerRadius = 5
        giPollBox5.translatesAutoresizingMaskIntoConstraints = false
        return giPollBox5
    }()
    let giPollBox6: UIView = {
        let giPollBox6 = UIView()
        giPollBox6.backgroundColor = pollBackgroundColor
        giPollBox6.layer.cornerRadius = 5
        giPollBox6.translatesAutoresizingMaskIntoConstraints = false
        return giPollBox6
    }()
    
    let giPollBar1: UIView = {
        let giPollBar1 = UIView()
        giPollBar1.backgroundColor = pollColor
        giPollBar1.translatesAutoresizingMaskIntoConstraints = false
        giPollBar1.layer.cornerRadius = 5
        giPollBar1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return giPollBar1
    }()
    let giPollBar2: UIView = {
        let giPollBar2 = UIView()
        giPollBar2.backgroundColor = pollColor
        giPollBar2.translatesAutoresizingMaskIntoConstraints = false
        giPollBar2.layer.cornerRadius = 5
        giPollBar2.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return giPollBar2
    }()
    let giPollBar3: UIView = {
        let giPollBar3 = UIView()
        giPollBar3.backgroundColor = pollColor
        giPollBar3.translatesAutoresizingMaskIntoConstraints = false
        giPollBar3.layer.cornerRadius = 5
        giPollBar3.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return giPollBar3
    }()
    let giPollBar4: UIView = {
        let giPollBar4 = UIView()
        giPollBar4.backgroundColor = pollColor
        giPollBar4.translatesAutoresizingMaskIntoConstraints = false
        giPollBar4.layer.cornerRadius = 5
        giPollBar4.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return giPollBar4
    }()
    let giPollBar5: UIView = {
        let giPollBar5 = UIView()
        giPollBar5.backgroundColor = pollColor
        giPollBar5.translatesAutoresizingMaskIntoConstraints = false
        giPollBar5.layer.cornerRadius = 5
        giPollBar5.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return giPollBar5
    }()
    let giPollBar6: UIView = {
        let giPollBar6 = UIView()
        giPollBar6.backgroundColor = pollColor
        giPollBar6.translatesAutoresizingMaskIntoConstraints = false
        giPollBar6.layer.cornerRadius = 5
        giPollBar6.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return giPollBar6
    }()
    let giPollPercent1: UILabel = {
        let giPollPercent1 = UILabel()
        giPollPercent1.font = customFontAvenir
        giPollPercent1.textColor = UIColor.black
        giPollPercent1.text = "10%"
        giPollPercent1.numberOfLines = 0
        giPollPercent1.adjustsFontSizeToFitWidth = true
        giPollPercent1.translatesAutoresizingMaskIntoConstraints = false
        return giPollPercent1
    }()
    let giPollPercent2: UILabel = {
        let giPollPercent2 = UILabel()
        giPollPercent2.font = customFontAvenir
        giPollPercent2.textColor = UIColor.black
        giPollPercent2.text = "10%"
        giPollPercent2.numberOfLines = 0
        giPollPercent2.adjustsFontSizeToFitWidth = true
        giPollPercent2.translatesAutoresizingMaskIntoConstraints = false
        return giPollPercent2
    }()
    let giPollPercent3: UILabel = {
        let giPollPercent3 = UILabel()
        giPollPercent3.font = customFontAvenir
        giPollPercent3.textColor = UIColor.black
        giPollPercent3.text = "10%"
        giPollPercent3.numberOfLines = 0
        giPollPercent3.adjustsFontSizeToFitWidth = true
        giPollPercent3.translatesAutoresizingMaskIntoConstraints = false
        return giPollPercent3
    }()
    let giPollPercent4: UILabel = {
        let giPollPercent4 = UILabel()
        giPollPercent4.font = customFontAvenir
        giPollPercent4.textColor = UIColor.black
        giPollPercent4.text = "10%"
        giPollPercent4.numberOfLines = 0
        giPollPercent4.adjustsFontSizeToFitWidth = true
        giPollPercent4.translatesAutoresizingMaskIntoConstraints = false
        return giPollPercent4
    }()
    let giPollPercent5: UILabel = {
        let giPollPercent5 = UILabel()
        giPollPercent5.font = customFontAvenir
        giPollPercent5.textColor = UIColor.black
        giPollPercent5.text = "10%"
        giPollPercent5.numberOfLines = 0
        giPollPercent5.adjustsFontSizeToFitWidth = true
        giPollPercent5.translatesAutoresizingMaskIntoConstraints = false
        return giPollPercent5
    }()
    let giPollPercent6: UILabel = {
        let giPollPercent6 = UILabel()
        giPollPercent6.font = customFontAvenir
        giPollPercent6.textColor = UIColor.black
        giPollPercent6.text = "10%"
        giPollPercent6.numberOfLines = 0
        giPollPercent6.adjustsFontSizeToFitWidth = true
        giPollPercent6.translatesAutoresizingMaskIntoConstraints = false
        return giPollPercent6
    }()
    let giPollLabel1: UILabel = {
        let giPollLabel1 = UILabel()
        giPollLabel1.font = customFontCourier
        giPollLabel1.textColor = UIColor.black
        giPollLabel1.text = "The College App"
        giPollLabel1.numberOfLines = 1
        giPollLabel1.minimumScaleFactor = 0.1
        giPollLabel1.baselineAdjustment = .alignCenters
        giPollLabel1.textAlignment  = .left
        giPollLabel1.adjustsFontSizeToFitWidth = true
        giPollLabel1.translatesAutoresizingMaskIntoConstraints = false
        return giPollLabel1
    }()
    let giPollLabel2: UILabel = {
        let giPollLabel2 = UILabel()
        giPollLabel2.font = customFontCourier
        giPollLabel2.textColor = UIColor.black
        giPollLabel2.text = "The College App"
        giPollLabel2.numberOfLines = 1
        giPollLabel2.minimumScaleFactor = 0.1
        giPollLabel2.baselineAdjustment = .alignCenters
        giPollLabel2.textAlignment  = .left
        giPollLabel2.adjustsFontSizeToFitWidth = true
        giPollLabel2.translatesAutoresizingMaskIntoConstraints = false
        return giPollLabel2
    }()
    let giPollLabel3: UILabel = {
        let giPollLabel3 = UILabel()
        giPollLabel3.font = customFontCourier
        giPollLabel3.textColor = UIColor.black
        giPollLabel3.text = "The College App"
        giPollLabel3.numberOfLines = 1
        giPollLabel3.minimumScaleFactor = 0.1
        giPollLabel3.baselineAdjustment = .alignCenters
        giPollLabel3.textAlignment  = .left
        giPollLabel3.adjustsFontSizeToFitWidth = true
        giPollLabel3.translatesAutoresizingMaskIntoConstraints = false
        return giPollLabel3
    }()
    let giPollLabel4: UILabel = {
        let giPollLabel4 = UILabel()
        giPollLabel4.font = customFontCourier
        giPollLabel4.textColor = UIColor.black
        giPollLabel4.text = "The College App"
        giPollLabel4.numberOfLines = 1
        giPollLabel4.minimumScaleFactor = 0.1
        giPollLabel4.baselineAdjustment = .alignCenters
        giPollLabel4.textAlignment  = .left
        giPollLabel4.adjustsFontSizeToFitWidth = true
        giPollLabel4.translatesAutoresizingMaskIntoConstraints = false
        return giPollLabel4
    }()
    let giPollLabel5: UILabel = {
        let giPollLabel5 = UILabel()
        giPollLabel5.font = customFontCourier
        giPollLabel5.textColor = UIColor.black
        giPollLabel5.text = "The College App"
        giPollLabel5.numberOfLines = 1
        giPollLabel5.minimumScaleFactor = 0.1
        giPollLabel5.baselineAdjustment = .alignCenters
        giPollLabel5.textAlignment  = .left
        giPollLabel5.adjustsFontSizeToFitWidth = true
        giPollLabel5.translatesAutoresizingMaskIntoConstraints = false
        return giPollLabel5
    }()
    let giPollLabel6: UILabel = {
        let giPollLabel6 = UILabel()
        giPollLabel6.font = customFontCourier
        giPollLabel6.textColor = UIColor.black
        giPollLabel6.text = "The College App"
        giPollLabel6.numberOfLines = 1
        giPollLabel6.minimumScaleFactor = 0.1
        giPollLabel6.baselineAdjustment = .alignCenters
        giPollLabel6.textAlignment  = .left
        giPollLabel6.adjustsFontSizeToFitWidth = true
        giPollLabel6.translatesAutoresizingMaskIntoConstraints = false
        return giPollLabel6
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    //init
    init(frame: CGRect, type: Int = 1, caption:String = cap140) {
        self.type = type
        self.caption = caption
        super.init(frame: frame)
        self.giCaptionLabel.text = self.caption
        
        pollNUM = 3
        
        let object1 = ""
        let object2 = ""
        let object3 = ""
        let object4 = "Yellow"
        let object5 = "Orange"
        let object6 = "Purple"
        
        let percent1 = 0.27
        let percent2 = 0.58
        let percent3 = 0.16
        let percent4 = 0.00
        let percent5 = 0.0
        let percent6 = 0.0
        

        self.addSubview(generatedView)
        
        generatedView.addSubview(giTopBox)
        generatedView.addSubview(giBottomBox)
        
        giTopBox.addSubview(giTitleLabel)
        
        giBottomBox.addSubview(giLogoView)
        giBottomBox.addSubview(giContentBox)
        
        
        giContentBox.addSubview(giTextBox)
        giContentBox.addSubview(giSpecialBox)
        
        giTextBox.addSubview(giCaptionLabel)
        giTextBox.addSubview(giSourceLabel)
        
        giSpecialBox.addSubview(giPollContainer)
        giSpecialBox.addSubview(giImageView)
        
        giPollContainer.addSubview(giPollBox1)
        giPollContainer.addSubview(giPollBox2)
        giPollContainer.addSubview(giPollBox3)
        giPollContainer.addSubview(giPollBox4)
        giPollContainer.addSubview(giPollBox5)
        giPollContainer.addSubview(giPollBox6)
        
        giPollBox1.addSubview(giPollBar1)
        giPollBox2.addSubview(giPollBar2)
        giPollBox3.addSubview(giPollBar3)
        giPollBox4.addSubview(giPollBar4)
        giPollBox5.addSubview(giPollBar5)
        giPollBox6.addSubview(giPollBar6)
        
        giPollBox1.addSubview(giPollPercent1)
        giPollBox2.addSubview(giPollPercent2)
        giPollBox3.addSubview(giPollPercent3)
        giPollBox4.addSubview(giPollPercent4)
        giPollBox5.addSubview(giPollPercent5)
        giPollBox6.addSubview(giPollPercent6)
        
        giPollBox1.addSubview(giPollLabel1)
        giPollBox2.addSubview(giPollLabel2)
        giPollBox3.addSubview(giPollLabel3)
        giPollBox4.addSubview(giPollLabel4)
        giPollBox5.addSubview(giPollLabel5)
        giPollBox6.addSubview(giPollLabel6)
        
        
        
        NSLayoutConstraint.activate([
            generatedView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1),
            generatedView.widthAnchor.constraint(equalTo: self.widthAnchor),
            generatedView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            generatedView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            giTopBox.topAnchor.constraint(equalTo: generatedView.topAnchor),
            giTopBox.centerXAnchor.constraint(equalTo: generatedView.centerXAnchor),
            giTopBox.widthAnchor.constraint(equalTo: generatedView.widthAnchor),
            giTopBox.heightAnchor.constraint(equalTo: generatedView.heightAnchor, multiplier: 0.15),
            
            giBottomBox.topAnchor.constraint(equalTo:giTopBox.bottomAnchor),
            giBottomBox.centerXAnchor.constraint(equalTo: generatedView.centerXAnchor),
            giBottomBox.widthAnchor.constraint(equalTo: generatedView.widthAnchor),
            giBottomBox.heightAnchor.constraint(equalTo: generatedView.heightAnchor, multiplier: 0.85),
            
            giTitleLabel.centerXAnchor.constraint(equalTo: giTopBox.centerXAnchor),
            giTitleLabel.centerYAnchor.constraint(equalTo: giTopBox.centerYAnchor),
            giTitleLabel.heightAnchor.constraint(equalTo: giTopBox.heightAnchor, multiplier: 0.75),
            giTitleLabel.widthAnchor.constraint(equalTo: giTopBox.widthAnchor, multiplier: 0.75),
            
            giLogoView.centerXAnchor.constraint(equalTo: giBottomBox.centerXAnchor),
            giLogoView.centerYAnchor.constraint(equalTo: giBottomBox.centerYAnchor),
            giLogoView.heightAnchor.constraint(equalTo: giBottomBox.heightAnchor, multiplier: 1),
            giLogoView.widthAnchor.constraint(equalTo: giBottomBox.widthAnchor, multiplier: 1),
            
            giContentBox.centerXAnchor.constraint(equalTo: giBottomBox.centerXAnchor),
            giContentBox.centerYAnchor.constraint(equalTo: giBottomBox.centerYAnchor),
            giContentBox.heightAnchor.constraint(equalTo: giBottomBox.heightAnchor, multiplier: 0.9),
            giContentBox.widthAnchor.constraint(equalTo: giBottomBox.widthAnchor, multiplier: 0.9),
            
            giCaptionLabel.centerXAnchor.constraint(equalTo: giTextBox.centerXAnchor),
            giCaptionLabel.topAnchor.constraint(equalTo: giTextBox.topAnchor),
            giCaptionLabel.widthAnchor.constraint(equalTo: giTextBox.widthAnchor),
            giCaptionLabel.heightAnchor.constraint(equalTo: giTextBox.heightAnchor, multiplier: 0.8),
            
            giSourceLabel.leadingAnchor.constraint(equalTo: giTextBox.centerXAnchor),
            giSourceLabel.bottomAnchor.constraint(equalTo: giTextBox.bottomAnchor),
            giSourceLabel.widthAnchor.constraint(equalTo: giTextBox.widthAnchor, multiplier: 0.5),
            giSourceLabel.heightAnchor.constraint(equalTo: giTextBox.heightAnchor, multiplier: 0.175),
            
            giPollBar1.heightAnchor.constraint(equalTo: giPollBox1.heightAnchor),
            giPollBar1.topAnchor.constraint(equalTo: giPollBox1.topAnchor),
            giPollBar1.leadingAnchor.constraint(equalTo: giPollBox1.leadingAnchor),
            
            giPollBar2.heightAnchor.constraint(equalTo: giPollBox2.heightAnchor),
            giPollBar2.topAnchor.constraint(equalTo: giPollBox2.topAnchor),
            giPollBar2.leadingAnchor.constraint(equalTo: giPollBox2.leadingAnchor),
            
            giPollBar3.heightAnchor.constraint(equalTo: giPollBox3.heightAnchor),
            giPollBar3.topAnchor.constraint(equalTo: giPollBox3.topAnchor),
            giPollBar3.leadingAnchor.constraint(equalTo: giPollBox3.leadingAnchor),
            
            giPollBar4.heightAnchor.constraint(equalTo: giPollBox4.heightAnchor),
            giPollBar4.topAnchor.constraint(equalTo: giPollBox4.topAnchor),
            giPollBar4.leadingAnchor.constraint(equalTo: giPollBox4.leadingAnchor),
            
            giPollBar5.heightAnchor.constraint(equalTo: giPollBox5.heightAnchor),
            giPollBar5.topAnchor.constraint(equalTo: giPollBox5.topAnchor),
            giPollBar5.leadingAnchor.constraint(equalTo: giPollBox5.leadingAnchor),
            
            giPollBar6.heightAnchor.constraint(equalTo: giPollBox6.heightAnchor),
            giPollBar6.topAnchor.constraint(equalTo: giPollBox6.topAnchor),
            giPollBar6.leadingAnchor.constraint(equalTo: giPollBox6.leadingAnchor),
            
            giPollLabel1.widthAnchor.constraint(equalTo: giPollBox1.widthAnchor, multiplier: 0.75),
            giPollLabel1.heightAnchor.constraint(equalTo: giPollBox1.heightAnchor, multiplier: 0.9),
            giPollLabel1.trailingAnchor.constraint(equalTo: giPollBox1.trailingAnchor),
            giPollLabel1.centerYAnchor.constraint(equalTo: giPollBox1.centerYAnchor),
            
            giPollLabel2.widthAnchor.constraint(equalTo: giPollBox2.widthAnchor, multiplier: 0.75),
            giPollLabel2.heightAnchor.constraint(equalTo: giPollBox2.heightAnchor, multiplier: 0.9),
            giPollLabel2.trailingAnchor.constraint(equalTo: giPollBox2.trailingAnchor),
            giPollLabel2.centerYAnchor.constraint(equalTo: giPollBox2.centerYAnchor),
            
            giPollLabel3.widthAnchor.constraint(equalTo: giPollBox3.widthAnchor, multiplier: 0.75),
            giPollLabel3.heightAnchor.constraint(equalTo: giPollBox3.heightAnchor, multiplier: 0.9),
            giPollLabel3.trailingAnchor.constraint(equalTo: giPollBox3.trailingAnchor),
            giPollLabel3.centerYAnchor.constraint(equalTo: giPollBox3.centerYAnchor),
            
            giPollLabel4.widthAnchor.constraint(equalTo: giPollBox4.widthAnchor, multiplier: 0.75),
            giPollLabel4.heightAnchor.constraint(equalTo: giPollBox4.heightAnchor, multiplier: 0.9),
            giPollLabel4.trailingAnchor.constraint(equalTo: giPollBox4.trailingAnchor),
            giPollLabel4.centerYAnchor.constraint(equalTo: giPollBox4.centerYAnchor),
            
            giPollLabel5.widthAnchor.constraint(equalTo: giPollBox5.widthAnchor, multiplier: 0.75),
            giPollLabel5.heightAnchor.constraint(equalTo: giPollBox5.heightAnchor, multiplier: 0.9),
            giPollLabel5.trailingAnchor.constraint(equalTo: giPollBox5.trailingAnchor),
            giPollLabel5.centerYAnchor.constraint(equalTo: giPollBox5.centerYAnchor),
            
            giPollLabel6.widthAnchor.constraint(equalTo: giPollBox6.widthAnchor, multiplier: 0.75),
            giPollLabel6.heightAnchor.constraint(equalTo: giPollBox6.heightAnchor, multiplier: 0.9),
            giPollLabel6.trailingAnchor.constraint(equalTo: giPollBox6.trailingAnchor),
            giPollLabel6.centerYAnchor.constraint(equalTo: giPollBox6.centerYAnchor),
            
            giPollPercent1.widthAnchor.constraint(equalTo: giPollBox1.widthAnchor, multiplier: 0.2),
            giPollPercent1.heightAnchor.constraint(equalTo: giPollBox1.heightAnchor),
            giPollPercent1.leadingAnchor.constraint(equalTo: giPollBox1.leadingAnchor),
            giPollPercent1.centerYAnchor.constraint(equalTo: giPollBox1.centerYAnchor),
            
            giPollPercent2.widthAnchor.constraint(equalTo: giPollBox2.widthAnchor, multiplier: 0.2),
            giPollPercent2.heightAnchor.constraint(equalTo: giPollBox2.heightAnchor),
            giPollPercent2.leadingAnchor.constraint(equalTo: giPollBox2.leadingAnchor),
            giPollPercent2.centerYAnchor.constraint(equalTo: giPollBox2.centerYAnchor),
            
            giPollPercent3.widthAnchor.constraint(equalTo: giPollBox3.widthAnchor, multiplier: 0.2),
            giPollPercent3.heightAnchor.constraint(equalTo: giPollBox3.heightAnchor),
            giPollPercent3.leadingAnchor.constraint(equalTo: giPollBox3.leadingAnchor),
            giPollPercent3.centerYAnchor.constraint(equalTo: giPollBox3.centerYAnchor),
            
            giPollPercent4.widthAnchor.constraint(equalTo: giPollBox4.widthAnchor, multiplier: 0.2),
            giPollPercent4.heightAnchor.constraint(equalTo: giPollBox4.heightAnchor),
            giPollPercent4.leadingAnchor.constraint(equalTo: giPollBox4.leadingAnchor),
            giPollPercent4.centerYAnchor.constraint(equalTo: giPollBox4.centerYAnchor),
            
            giPollPercent5.widthAnchor.constraint(equalTo: giPollBox5.widthAnchor, multiplier: 0.2),
            giPollPercent5.heightAnchor.constraint(equalTo: giPollBox5.heightAnchor),
            giPollPercent5.leadingAnchor.constraint(equalTo: giPollBox5.leadingAnchor),
            giPollPercent5.centerYAnchor.constraint(equalTo: giPollBox5.centerYAnchor),
            
            giPollPercent6.widthAnchor.constraint(equalTo: giPollBox6.widthAnchor, multiplier: 0.2),
            giPollPercent6.heightAnchor.constraint(equalTo: giPollBox6.heightAnchor),
            giPollPercent6.leadingAnchor.constraint(equalTo: giPollBox6.leadingAnchor),
            giPollPercent6.centerYAnchor.constraint(equalTo: giPollBox6.centerYAnchor),
            
            giImageView.centerXAnchor.constraint(equalTo: giSpecialBox.centerXAnchor),
            giImageView.centerYAnchor.constraint(equalTo: giSpecialBox.centerYAnchor),
            giImageView.heightAnchor.constraint(equalTo: giSpecialBox.heightAnchor),
            giImageView.widthAnchor.constraint(equalTo: giSpecialBox.widthAnchor),
            
            giPollContainer.centerXAnchor.constraint(equalTo: giSpecialBox.centerXAnchor),
            giPollContainer.centerYAnchor.constraint(equalTo: giSpecialBox.centerYAnchor),
            giPollContainer.heightAnchor.constraint(equalTo: giSpecialBox.heightAnchor),
            giPollContainer.widthAnchor.constraint(equalTo: giSpecialBox.widthAnchor),
            
            giPollBox1.centerXAnchor.constraint(equalTo: giPollContainer.centerXAnchor),
            giPollBox1.widthAnchor.constraint(equalTo: giPollContainer.widthAnchor, multiplier: 0.8),
            
            giPollBox2.centerXAnchor.constraint(equalTo: giPollContainer.centerXAnchor),
            giPollBox2.widthAnchor.constraint(equalTo: giPollContainer.widthAnchor, multiplier: 0.8),
            
            giPollBox3.centerXAnchor.constraint(equalTo: giPollContainer.centerXAnchor),
            giPollBox3.widthAnchor.constraint(equalTo: giPollContainer.widthAnchor, multiplier: 0.8),
            
            giPollBox4.centerXAnchor.constraint(equalTo: giPollContainer.centerXAnchor),
            giPollBox4.widthAnchor.constraint(equalTo: giPollContainer.widthAnchor, multiplier: 0.8),
            
            giPollBox5.centerXAnchor.constraint(equalTo: giPollContainer.centerXAnchor),
            giPollBox5.widthAnchor.constraint(equalTo: giPollContainer.widthAnchor, multiplier: 0.8),
            
            giPollBox6.centerXAnchor.constraint(equalTo: giPollContainer.centerXAnchor),
            giPollBox6.widthAnchor.constraint(equalTo: giPollContainer.widthAnchor, multiplier: 0.8),
            ])
        
        //conditionals based on which type of post it is
        //text post
        if type == 1 {
            NSLayoutConstraint.activate([
                giTextBox.centerXAnchor.constraint(equalTo: giContentBox.centerXAnchor),
                giTextBox.centerYAnchor.constraint(equalTo: giContentBox.centerYAnchor),
                giTextBox.heightAnchor.constraint(equalTo: giContentBox.heightAnchor),
                giTextBox.widthAnchor.constraint(equalTo: giContentBox.widthAnchor),
                
                giSpecialBox.heightAnchor.constraint(equalToConstant: 0),
                giSpecialBox.widthAnchor.constraint(equalToConstant: 0),
                ])
        }
        //image or poll post
        else if type == 2 || type == 3{
            NSLayoutConstraint.activate([
                giTextBox.centerXAnchor.constraint(equalTo: giContentBox.centerXAnchor),
                giTextBox.topAnchor.constraint(equalTo: giContentBox.topAnchor),
                giTextBox.heightAnchor.constraint(equalTo: giContentBox.heightAnchor, multiplier: 0.475),
                giTextBox.widthAnchor.constraint(equalTo: giContentBox.widthAnchor, multiplier: 1),
                
                giSpecialBox.centerXAnchor.constraint(equalTo: giContentBox.centerXAnchor),
                giSpecialBox.bottomAnchor.constraint(equalTo: giContentBox.bottomAnchor),
                giSpecialBox.heightAnchor.constraint(equalTo: giContentBox.heightAnchor, multiplier: 0.475),
                giSpecialBox.widthAnchor.constraint(equalTo: giContentBox.widthAnchor, multiplier: 1),
                ])
            
            //image post
            if type == 2{
                giImageView.isHidden = false;
                giPollContainer.isHidden = true;
            }
            //poll post
            else {
                giImageView.isHidden = true;
                giPollContainer.isHidden = false;
                self.layoutIfNeeded()
                let pollBoxHeight = Float(giPollContainer.frame.height)
                let pollBarHeight = CGFloat(pollBoxHeight/Float(pollNUM) * 0.79)
                let pollBarBuffer = CGFloat(pollBoxHeight * 0.03)
                
                NSLayoutConstraint.activate([
                    giPollBox1.topAnchor.constraint(equalTo: giPollContainer.topAnchor, constant: pollBarBuffer),
                    giPollBox2.topAnchor.constraint(equalTo: giPollBox1.bottomAnchor, constant: pollBarBuffer),
                    giPollBox3.topAnchor.constraint(equalTo: giPollBox2.bottomAnchor, constant: pollBarBuffer),
                    giPollBox4.topAnchor.constraint(equalTo: giPollBox3.bottomAnchor, constant: pollBarBuffer),
                    giPollBox5.topAnchor.constraint(equalTo: giPollBox4.bottomAnchor, constant: pollBarBuffer),
                    giPollBox6.topAnchor.constraint(equalTo: giPollBox5.bottomAnchor, constant: pollBarBuffer),
                    ])
                
                NSLayoutConstraint.activate([
                    giPollBox1.heightAnchor.constraint(equalToConstant: pollBarHeight),
                    giPollBox2.heightAnchor.constraint(equalToConstant: pollBarHeight),
                    
                    giPollBar1.widthAnchor.constraint(equalTo: giPollBox1.widthAnchor, multiplier: CGFloat(percent1)),
                    giPollBar2.widthAnchor.constraint(equalTo: giPollBox2.widthAnchor, multiplier: CGFloat(percent2)),
                    ])
                
                giPollBox1.isHidden = false
                giPollBox2.isHidden = false
                giPollBox3.isHidden = true
                giPollBox4.isHidden = true
                giPollBox5.isHidden = true
                giPollBox6.isHidden = true
                
                //have to hide or show poll bars based on how many options the poll has
                //right now only supports 2-6 options, any more than 6 and it gets too hard to read
                if pollNUM > 2 {
                    NSLayoutConstraint.activate([
                        giPollBox3.heightAnchor.constraint(equalToConstant: pollBarHeight),
                        giPollBar3.widthAnchor.constraint(equalTo: giPollBox3.widthAnchor, multiplier: CGFloat(percent3)),
                        ])
                    giPollBox3.isHidden = false
                }
                else{
                    NSLayoutConstraint.activate([
                        giPollBox3.heightAnchor.constraint(equalToConstant: 0),
                        giPollBar3.widthAnchor.constraint(equalToConstant: 0),
                        ])
                }
                if pollNUM > 3 {
                    NSLayoutConstraint.activate([
                        giPollBox4.heightAnchor.constraint(equalToConstant: pollBarHeight),
                        giPollBar4.widthAnchor.constraint(equalTo: giPollBox4.widthAnchor, multiplier: CGFloat(percent4)),
                        ])
                    giPollBox4.isHidden = false
                }
                else{
                    NSLayoutConstraint.activate([
                        giPollBox4.heightAnchor.constraint(equalToConstant: 0),
                        giPollBar4.widthAnchor.constraint(equalToConstant: 0),
                        ])
                }
                if pollNUM > 4 {
                    NSLayoutConstraint.activate([
                        giPollBox5.heightAnchor.constraint(equalToConstant: pollBarHeight),
                        giPollBar5.widthAnchor.constraint(equalTo: giPollBox5.widthAnchor, multiplier: CGFloat(percent5)),
                        ])
                    giPollBox5.isHidden = false
                }
                else{
                    NSLayoutConstraint.activate([
                        giPollBox5.heightAnchor.constraint(equalToConstant: 0),
                        giPollBar5.widthAnchor.constraint(equalToConstant: 0),
                        ])
                }
                if pollNUM > 5 {
                    NSLayoutConstraint.activate([
                        giPollBox6.heightAnchor.constraint(equalToConstant: pollBarHeight),
                        giPollBar6.widthAnchor.constraint(equalTo: giPollBox6.widthAnchor, multiplier: CGFloat(percent6)),
                        ])
                    giPollBox6.isHidden = false
                }
                else{
                    NSLayoutConstraint.activate([
                        giPollBox6.heightAnchor.constraint(equalToConstant: 0),
                        giPollBar6.widthAnchor.constraint(equalToConstant: 0),
                        ])
                }
                
                giPollLabel1.text = formatPollText(text: object1)
                giPollLabel2.text = formatPollText(text: object2)
                giPollLabel3.text = formatPollText(text: object3)
                giPollLabel4.text = formatPollText(text: object4)
                giPollLabel5.text = formatPollText(text: object5)
                giPollLabel6.text = formatPollText(text: object6)
                
                giPollPercent1.text = formatPercent(percent: percent1)
                giPollPercent2.text = formatPercent(percent: percent2)
                giPollPercent3.text = formatPercent(percent: percent3)
                giPollPercent4.text = formatPercent(percent: percent4)
                giPollPercent5.text = formatPercent(percent: percent5)
                giPollPercent6.text = formatPercent(percent: percent6)
                
                self.layoutIfNeeded()
                
            }
        }
    }
    
    //getter and setter for caption
    func setCaption(caption: String){
        self.caption = String(caption.prefix(280))
        giCaptionLabel.text = self.caption
    }
    func getCaption() -> String{
        return self.caption
    }
    
    //formats percentage text for poll
    func formatPercent (percent: Double) -> String{
        var percent = percent
        if percent <= 1 {
            percent = percent * 100
        }
        var percentString = String(Int(percent)) + "%"
        while percentString.count < 5 {
            percentString = " " + percentString
        }
        return percentString
    }
    //formats text for poll
    func formatPollText (text: String) -> String{
        var text = String(text.prefix(25))
        while text.count < 26{
            text.append(" ")
        }
        return text
    }
    
    func clearConstraints() {
        for subview in self.subviews {
            for constraint in subview.constraints{
                subview.removeConstraint(constraint)
            }
        }
        self.removeConstraints(self.constraints)
    }
    deinit {
        clearConstraints()
    }
}


