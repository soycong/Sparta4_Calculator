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
            } else if button.title(for: .normal) == "=" {
                button.addTarget(self, action: #selector(calculateNumbers), for: .touchUpInside)
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
    
    // = 버튼 누르면 연산 시작
    @objc func calculateNumbers() {
        // 옵셔널 바인딩을 사용하여 nil이 아닌 경우에만 결과를 numberLabel에 할당
        if let result = calculate(expression: calculatorView.numberLabel.text ?? "Error") {
            calculatorView.numberLabel.text = String(result)
        } else {
            calculatorView.numberLabel.text = "Error"
        }
    }
    
    /// 수식 문자열을 넣으면 계산해주는 메서드.
    ///
    /// 예를 들어 expression 에 "1+2+3" 이 들어오면 6 을 리턴한다.
    /// 잘못된 형식의 수식을 넣으면 앱이 크래시 난다. ex) "1+2++"
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            print(result)
            return result
        } else {
            print("error")
            return nil
        }
    }
}
