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
            if button.title(for: .normal) == "AC" {
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
        
        if calculatorView.numberLabel.text == "0" {
            calculatorView.numberLabel.text = title
        } else {
            calculatorView.numberLabel.text? += title
        }
    }
    
    @objc func clearLabel() {
        calculatorView.numberLabel.text = "0"
    }
    
    @objc func calculateNumbers() {
        if let result = calculate(expression: calculatorView.numberLabel.text ?? "Error") {
            calculatorView.numberLabel.text = String(result)
        } else {
            calculatorView.numberLabel.text = "Error"
        }
    }

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
