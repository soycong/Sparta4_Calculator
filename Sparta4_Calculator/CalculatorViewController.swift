//
//  CalculatorViewController.swift
//  Sparta4_Calculator
//
//  Created by seohuibaek on 11/14/24.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorView: CalculatorView!
   // var calculatorModel = CalculatorModel()

    override func loadView() {
        calculatorView = CalculatorView()
        view = calculatorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorView.numberButtons.forEach { button in
            if button.title(for: .normal) == "AC" { //AC 기능 분리
                button.addTarget(self, action: #selector(clearLabel), for: .touchUpInside)
            } else {
                button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
            }
        }
    }
    
    @objc func numberButtonTapped(_ sender: UIButton) {
        guard let title = sender.title(for: .normal) else { return }
        
        // 숫자 버튼을 눌렀을 때 레이블을 해당 숫자로 변경
        if calculatorView.numberLabel.text == "0" {
            calculatorView.numberLabel.text = title
        } else {
            calculatorView.numberLabel.text? += title
        }
    }
    
    // AC 버튼으로 초기화
    @objc func clearLabel() {
        calculatorView.numberLabel.text = "0"
    }
}
