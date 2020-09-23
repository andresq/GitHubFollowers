//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Andres Quintero on 8/26/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data received from the server was invalid. Please try again"
    case unableToFavorite = "There was an error saving this favorite"
    case alreadyInFavorites = "This user is already in your favorites"
}
