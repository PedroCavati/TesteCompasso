//
//  ViewCodable.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 23/01/21.
//

import Foundation
import UIKit

// MARK: - ViewCodable
/// Protocol that establishes the standard view initialization
protocol ViewCodable {
    /**
     Call this function inside your viewDidLoad.
     */
    func setupViews()
    
    /**
     Organize your view hierarchy inside this method.
     */
    func setupViewHierarchy()
    
    /**
     Create constraints and activate them inside this method.
     */
    func setupConstraints()
    
    /**
     Any additional configuration should be set here.
     */
    func setupAdditionalConfiguration()
}

extension ViewCodable {
    func setupViews() {
        setupViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() { }
}
