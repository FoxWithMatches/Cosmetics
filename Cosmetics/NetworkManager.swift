//
//  NetworkManager.swift
//  Cosmetics
//
//  Created by Alisa Ts on 30.11.2021.
//

import UIKit

    struct MakeUpElement: Codable {
        let id: Int
        let brand: String?
        let name: String
        let price: String?
        let priceSign: PriceSign?
        let currency: Currency?
        let imageLink: String
        let productLink: String
        let websiteLink: String
        let makeUpDescription: String?
        let rating: Double?
        let category: Category?
        let productType: ProductType
        let tagList: [String]
        let createdAt, updatedAt: String
        let productAPIURL: String
        let apiFeaturedImage: String
        let productColors: [ProductColor]
        
        enum CodingKeys: String, CodingKey {
            case id, brand, name, price
            case priceSign = "price_sign"
            case currency
            case imageLink = "image_link"
            case productLink = "product_link"
            case websiteLink = "website_link"
            case makeUpDescription = "description"
            case rating, category
            case productType = "product_type"
            case tagList = "tag_list"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case productAPIURL = "product_api_url"
            case apiFeaturedImage = "api_featured_image"
            case productColors = "product_colors"
        }
    }

    enum Category: String, Codable {
        case bbCc = "bb_cc"
        case concealer = "concealer"
        case contour = "contour"
        case cream = "cream"
        case empty = ""
        case gel = "gel"
        case highlighter = "highlighter"
        case lipGloss = "lip_gloss"
        case lipStain = "lip_stain"
        case lipstick = "lipstick"
        case liquid = "liquid"
        case mineral = "mineral"
        case palette = "palette"
        case pencil = "pencil"
        case powder = "powder"
    }

    enum Currency: String, Codable {
        case cad = "CAD"
        case gbp = "GBP"
        case usd = "USD"
    }

    enum PriceSign: String, Codable {
        case empty = "$"
        case priceSign = "£"
    }

    // MARK: - ProductColor
    struct ProductColor: Codable {
        let hexValue: String
        let colourName: String?
        
        enum CodingKeys: String, CodingKey {
            case hexValue = "hex_value"
            case colourName = "colour_name"
        }
    }

    enum ProductType: String, Codable {
        case blush = "blush"
        case bronzer = "bronzer"
        case eyebrow = "eyebrow"
        case eyeliner = "eyeliner"
        case eyeshadow = "eyeshadow"
        case foundation = "foundation"
        case lipLiner = "lip_liner"
        case lipstick = "lipstick"
        case mascara = "mascara"
        case nailPolish = "nail_polish"
    }

    typealias MakeUp = [MakeUpElement]



