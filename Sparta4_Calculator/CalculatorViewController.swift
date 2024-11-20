import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorView: CalculatorView!
   // var calculatorModel = CalculatorModel()
    var finished = false // 연산이 끝났는지 확인

    override func loadView() {
        calculatorView = CalculatorView()
        view = calculatorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorView.numberButtons.forEach { button in
            if button.title(for: .normal) == "AC" { // AC 버튼 클릭 -> 초기화
                button.addTarget(self, action: #selector(clearNumbers), for: .touchUpInside)
            } else if button.title(for: .normal) == "=" { // = 버튼 클릭 -> 연산 수행
                button.addTarget(self, action: #selector(calculateNumbers), for: .touchUpInside)
            } else { // 숫자 버튼 클릭 -> 숫자 입력
                button.addTarget(self, action: #selector(enterNumbers(_:)), for: .touchUpInside)
            }
        }
    }
    
    //숫자 입력
    @objc func enterNumbers(_ sender: UIButton) {
        guard let title = sender.title(for: .normal) else{
            print("enterNumbers 오류입니다.")
            return
        }
        
        if finished == true { //이전 연산이 끝나고 새로운 연산을 시작할 경우
            calculatorView.numberLabel.text = title
            finished = false
        } else {
            if calculatorView.numberLabel.text == "0" {
                calculatorView.numberLabel.text = title
            } else {
                calculatorView.numberLabel.text? += title
            }
        }
    }
    
    // AC 버튼 초기화
    @objc func clearNumbers() {
        calculatorView.numberLabel.text = "0"
    }
    
    // 연산 진행
    @objc func calculateNumbers() {
        if let result = calculate(expression: calculatorView.numberLabel.text ?? "Error") {
            calculatorView.numberLabel.text = String(result)
        } else {
            calculatorView.numberLabel.text = "Error"
        }
    }
    
    // 연산 함수
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            print(result)
            finished = true // 연산이 끝남을 알림
            return result
        } else {
            print("error")
            return nil
        }
    }
}
