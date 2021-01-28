//
//  CheckInViewController.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 28/01/21.
//

import Foundation
import UIKit

class CheckInViewController: UIViewController {
    
    private var checkInView: CheckInView { return self.view as! CheckInView }
    
    private var eventId: String
    
    weak var coordinator: CheckInCoordinator?
    
    init(eventId: String) {
        self.eventId = eventId
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        let checkInView = CheckInView(frame: UIScreen.main.bounds)
        
        checkInView.nameTextField.delegate = self
        checkInView.emailTextField.delegate = self
        
        checkInView.confirmButton.addTarget(self, action: #selector(confirmCheckIn), for: .touchUpInside)
        
        self.view = checkInView
    }
    
}

extension CheckInViewController {
    
    @objc func confirmCheckIn() {
        guard let name = checkInView.nameTextField.text, let email = checkInView.emailTextField.text else {
            return
        }
        if name == "", email == "" {
            self.callAlert(title: "Campo Inválido", message: "Um ou mais campos não possuem informações válidas.", actionTitle: "Tentar Novamente")
        } else {
            self.callAlert(title: "Check-In", message: "O seu check-in foi confirmado para o evento!", actionTitle: "OK")
        }
    }
    
    func callAlert(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { action in
            switch action.style{
            case .default:
                if actionTitle == "OK" {
                    self.dismiss(animated: true, completion: nil)
                }
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            @unknown default:
                fatalError()
            }
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension CheckInViewController: UITextFieldDelegate {
    
}
