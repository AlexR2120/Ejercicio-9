import UIKit

class ViewController: UIViewController {

    // Outlets para los sliders
    @IBOutlet weak var trabajoSlider: UISlider!
    @IBOutlet weak var dormirSlider: UISlider!
    
    // Outlets para los labels
    @IBOutlet weak var trabajoLabel: UILabel!
    @IBOutlet weak var dormirLabel: UILabel!
    @IBOutlet weak var ocioLabel: UILabel!
    @IBOutlet weak var edadTextField: UITextField!
    @IBOutlet weak var esperanzaVidaTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Inicializar las horas y texto
        trabajoLabel.text = "Trabajas: 8 horas"
        dormirLabel.text = "Duermes: 8 horas"
        actualizarOcio()
    }

    // Acción cuando cambia el slider de trabajo
    @IBAction func trabajoSliderCambiado(_ sender: UISlider) {
        trabajoLabel.text = "Trabajas: \(Int(sender.value)) horas"
        actualizarOcio()
    }

    // Acción cuando cambia el slider de dormir
    @IBAction func dormirSliderCambiado(_ sender: UISlider) {
        dormirLabel.text = "Duermes: \(Int(sender.value)) horas"
        actualizarOcio()
    }

    // Función para calcular y actualizar los días de ocio restantes
    func actualizarOcio() {
        // Obtener los valores de los sliders
        let horasTrabajo = Int(trabajoSlider.value)
        let horasDormir = Int(dormirSlider.value)
        
        // Obtener la edad y la esperanza de vida desde los textfields
        guard let edadText = edadTextField.text, let esperanzaVidaText = esperanzaVidaTextField.text,
              let edad = Int(edadText), let esperanzaVida = Int(esperanzaVidaText) else {
            ocioLabel.text = "Introduce tu edad y esperanza de vida."
            return
        }
        
        // Calcular las horas de ocio al día
        let horasOcioDiarias = 24 - (horasTrabajo + horasDormir)
        
        // Calcular los días restantes de vida
        let diasRestantes = (esperanzaVida - edad) * 365
        
        // Calcular los días de ocio restantes en la vida
        let diasOcioRestantes = diasRestantes * horasOcioDiarias / 24
        
        // Mostrar los días de ocio restantes
        ocioLabel.text = "Días de ocio restantes: \(Int(diasOcioRestantes))"
    }
}
