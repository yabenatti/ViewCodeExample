//
//  ViewController.swift
//  ViewCodeExample
//
//  Created by Yasmin Benatti on 26/09/20.
//

import Cartography
import UIKit

class ViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello Constraints"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hiButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hi!", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupVisualConstraints()
//        setupNSLayoutConstraints()
//        setupAnchorConstraints()
//        setupWithCartography()
    }
    
    private func setupVisualConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(hiButton)
        
        let viewsDict = [
            "label": titleLabel,
            "button": hiButton
        ]
        
        let verticalConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-20-[label]-[button]",
            options: [],
            metrics: nil,
            views: viewsDict
        )
        
        let labelHorizontalConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-20-[label]-20-|",
            options: [],
            metrics: nil,
            views: viewsDict
        )
        
        let buttonHorizontalConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-20-[button]-20-|",
            options: [],
            metrics: nil,
            views: viewsDict
        )
                        
        NSLayoutConstraint.activate(verticalConstraint)
        NSLayoutConstraint.activate(labelHorizontalConstraint)
        NSLayoutConstraint.activate(buttonHorizontalConstraint)
    }
    
    private func setupNSLayoutConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(hiButton)
        
        let labelVerticalConstraint = NSLayoutConstraint.init(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 20)
        let labelLeadingConstraint = NSLayoutConstraint.init(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20)
        let labelTrailingConstraint = NSLayoutConstraint.init(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20)
        
        let buttonVerticalConstraint = NSLayoutConstraint.init(item: hiButton, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8)
        let buttonLeadingConstraint = NSLayoutConstraint.init(item: hiButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20)
        let buttonTrailingConstraint = NSLayoutConstraint.init(item: hiButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20)
        
        view.addConstraints([
            labelVerticalConstraint,
            labelLeadingConstraint,
            labelTrailingConstraint,
            buttonVerticalConstraint,
            buttonLeadingConstraint,
            buttonTrailingConstraint
        ])
    }
    
    private func setupAnchorConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(hiButton)

        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        hiButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        hiButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        hiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    private func setupWithCartography() {
        view.addSubview(titleLabel)
        view.addSubview(hiButton)
        
        constrain(titleLabel, view) { label, superview in
            label.top == superview.top + 20
            label.leading == superview.leading + 20
            label.trailing == superview.trailing - 20
        }
        
        constrain(hiButton, titleLabel, view) { button, label, superview in
            button.top == label.bottom + 8
            button.leading == superview.leading + 20
            button.trailing == superview.trailing - 20
        }
    }
}

