//
//  Constants.swift
//  NewsApp
//
//  Created by Ignatio Julian on 11/09/21.
//

public struct Constants {
    public static var apiKey = "692d1cb6531243c3af5d18f451b50fc3"
    public static let newsURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
    
    public static let NetworkServiceErrorMessage = "Error in Network Service"
    public static let homeScreenNibCell = "CardTableViewCell"
    public static let detailsScreenVC = "DetailsScreenViewController"
}
