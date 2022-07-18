//
//  PersistenceFailure.swift
//  Battery
//
//  Created by Gabriel Soria on 16/07/2022.
//

enum PersistenceFailure: Error {
    case couldNotUpdate
    case couldNotSave
    case notExistent
    case fatal
}
