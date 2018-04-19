import UIKit
import LocalAuthentication
class ViewController: UIViewController {
    
    @IBOutlet weak var verificacion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func entrar(_ sender: UIButton) {
        
        let contexto : LAContext = LAContext()
        
        if contexto.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            
            contexto.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Identificate con tu huella dactilar", reply: { (funciona, error) in
                
                if funciona {
                    self.performSegue(withIdentifier: "entrar", sender: self)
                }else{
                    DispatchQueue.main.async {
                        self.verificacion.text = "Acceso denegado"
                    }
                }
                
            })
            
        }else{
            verificacion.text = "El dispositivo no soporta touchID"
        }
        
        
    }
    
}

