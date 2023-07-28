//
//  Bindable.swift
//  MVVM NEW API SWIFT
//
//  Created by Nando Septian Husni on 23/08/22.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    init(value: T? = nil) {
        self.value = value
    }
    
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
    
}
