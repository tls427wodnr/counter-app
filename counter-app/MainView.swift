//
//  MainView.swift
//  counter-app
//
//  Created by tlswo on 2/13/25.
//

import UIKit

class MainView: UIView {
    
    let counterLabel = UILabel()
    let plusButton = UIButton(type: .system)
    let minusButton = UIButton(type: .system)
    let resetButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        
        counterLabel.text = "0"
        counterLabel.textColor = .black
        counterLabel.textAlignment = .center
        counterLabel.font = UIFont.systemFont(ofSize: 50)
        
        setupButton(plusButton, title: "+", color: .systemBlue)
        setupButton(minusButton, title: "-", color: .systemBlue)
        setupButton(resetButton, title: "Reset", color: .systemRed)
        
        let horizontalStackView = UIStackView(arrangedSubviews: [
            plusButton,
            minusButton,
            resetButton,
        ])
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        horizontalStackView.distribution = .fillProportionally
        horizontalStackView.alignment = .bottom
        
        let verticalStackView = UIStackView(arrangedSubviews: [
            counterLabel,
            horizontalStackView,
        ])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 20
        verticalStackView.distribution = .fill
        
        addSubview(verticalStackView)
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalStackView.widthAnchor.constraint(equalToConstant: 250),
            verticalStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupButton(_ button: UIButton, title: String, color: UIColor) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}
