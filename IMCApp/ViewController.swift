import UIKit

class ViewController: UIViewController {
    
    //  MARK: Variáveis
    var imc: Double = 0
    
    //  MARK: Outlets
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    //  MARK: Chamado toda vez que o usuário toca na tela para remover o teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //  MARK: Executa a acao do botao calcular
    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!) {
            imc = weight / pow(height, 2)
            showResults()
        }
    }
    
    //  MARK: Mostra o resultado do cálculo na tela
    func showResults() {
        var result: String
        var image: String
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        //  MARK: Exibe o resultado no label
        lbResult.text = "\(Int(imc)): \(result)"
        
        //  MARK: Carrega uma imagem do meu set de imagens
        ivResult.image = UIImage(named: image)
        
        //  MARK: Exibe minha view de resultado
        viResult.isHidden = false
        
        //  MARK: Faz todas as views perderem o foco
        view.endEditing(true)
    }
}
