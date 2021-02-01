//
//  Result.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 30/01/2021.
//

enum Result<T> {
    case success(T)
    case failure(Error)
}
