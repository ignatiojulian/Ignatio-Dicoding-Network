//
//  NewsDomainModel.swift
//  NewsApp
//
//  Created by Ignatio Julian on 05/09/21.
//

import Foundation

public struct NewsDomainModel: Decodable {
    public let status: String?
    public let totalResults: Int?
    public let articles: [Articles]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
        articles = try values.decodeIfPresent([Articles].self, forKey: .articles)
    }
}


//MARK:- DATA
public struct Articles: Decodable {
    public let source: Source?
    
    public let author: String?
    public let title: String?
    public let description: String?
    public let url: String?
    public let image: String?
    public let publishDate: String?
    public let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source = "source"
        
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case image = "urlToImage"
        case publishDate = "publishedAt"
        case content = "content"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        source = try values.decodeIfPresent(Source.self, forKey: .source)
        
        author = try values.decodeIfPresent(String.self, forKey: .author)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        publishDate = try values.decodeIfPresent(String.self, forKey: .publishDate)
        content = try values.decodeIfPresent(String.self, forKey: .content)
    }
}

public struct Source: Decodable {
    public let id: String?
    public let name: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}


