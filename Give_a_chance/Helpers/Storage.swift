//
//  Storage.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//

import Foundation
import Combine

@propertyWrapper
struct Storage<Value> {
    let key: String
    let defaultValue: Value
    var container: UserDefaults = .standard
    private let publisher = PassthroughSubject<Value, Never>()
    
    var wrappedValue: Value {
        get {
            return container.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key)
        }
    }
    
    var projectedValue: AnyPublisher<Value, Never> {
        return publisher.eraseToAnyPublisher()
    }
}
