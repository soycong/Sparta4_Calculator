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

        // 각 버튼에 액션 추가
        for button in calculatorView.numberButtons {
            button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        }
    }
    
    @objc func numberButtonTapped(_ sender: UIButton) {
        guard let title = sender.title(for: .normal) else { return }
        // 숫자 버튼을 눌렀을 때 레이블을 해당 숫자로 변경
        if let _ = Int(title) {
            if calculatorView.numberLabel.text == "0" {
                calculatorView.numberLabel.text = title
            } else {
                calculatorView.numberLabel.text? += title
            }
        }
        // AC 버튼을 눌렀을 때 초기화
        else if title == "AC" {
            calculatorView.numberLabel.text = "0"
        }
    }
}
