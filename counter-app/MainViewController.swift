//
//  ViewController.swift
//  counter-app
//
//  Created by tlswo on 2/12/25.
//

import UIKit

class MainViewController: UIViewController {
    private let mainView = MainView()
    var count = 0
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    private func setupActions() {
        mainView.plusButton.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        mainView.minusButton.addTarget(self, action: #selector(decreaseCount), for: .touchUpInside)
        mainView.resetButton.addTarget(self, action: #selector(resetCount), for: .touchUpInside)
    }
    
    @objc func increaseCount() {
        count += 1
        updateCounterLabel()
        updateButtonState()
    }
    
    @objc func decreaseCount() {
        count -= 1
        updateCounterLabel()
        updateButtonState()
    }
    
    @objc func resetCount() {
        count = 0
        updateCounterLabel()
        updateButtonState()
    }
    
    func updateCounterLabel() {
        mainView.counterLabel.text = "\(count)"
    }
    
    func updateButtonState() {
        if count >= 10 {
            mainView.plusButton.isEnabled = false
            mainView.plusButton.backgroundColor = .systemGray
        } else {
            mainView.plusButton.isEnabled = true
            mainView.plusButton.backgroundColor = .systemBlue
        }
        
        if count <= -10 {
            mainView.minusButton.isEnabled = false
            mainView.minusButton.backgroundColor = .systemGray
        } else {
            mainView.minusButton.isEnabled = true
            mainView.minusButton.backgroundColor = .systemBlue
        }
    }
    
}
