//
//  Product.swift
//  Furniture Ecommerce
//
//  Created by Anthony Aniobi on 29/07/2023.
//

import Foundation

struct Product : Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var supplier: String
    var price: Int
    var width: String
    var height: String
    var diameter: String
}

var productList:[Product] = [
    Product(name: "Some Coushion1", image: "fn1", description: "Lorem ipsum dolor sit amet. Non ipsum corporis ut maxime nostrum et commodi nulla ut dicta maxime et sint sint. Aut voluptas maxime qui expedita tenetur qui quia dolorem ut dolores corporis!. Ut magnam aliquid et laudantium repellat aut asperiores quidem ut eius iure sit nemo dolores est provident quia. Et reprehenderit veritatis aut commodi doloribus et fuga reprehenderit?", supplier: "IKEA", price: 350, width: "200 cm", height: "135 cm", diameter: "105 cm"),
    Product(name: "Some Coushion2", image: "fn2", description: "Lorem ipsum dolor sit amet. Non ipsum corporis ut maxime nostrum et commodi nulla ut dicta maxime et sint sint. Aut voluptas maxime qui expedita tenetur qui quia dolorem ut dolores corporis!. Ut magnam aliquid et laudantium repellat aut asperiores quidem ut eius iure sit nemo dolores est provident quia. Et reprehenderit veritatis aut commodi doloribus et fuga reprehenderit?", supplier: "IKEA", price: 350,width: "200 cm", height: "135 cm", diameter: "105 cm"),
    Product(name: "Some Coushion3", image: "fn3", description: "Lorem ipsum dolor sit amet. Non ipsum corporis ut maxime nostrum et commodi nulla ut dicta maxime et sint sint. Aut voluptas maxime qui expedita tenetur qui quia dolorem ut dolores corporis!. Ut magnam aliquid et laudantium repellat aut asperiores quidem ut eius iure sit nemo dolores est provident quia. Et reprehenderit veritatis aut commodi doloribus et fuga reprehenderit?", supplier: "IKEA", price: 350, width: "200 cm", height: "135 cm", diameter: "105 cm"),
    Product(name: "Some Coushion4", image: "fn4", description: "Lorem ipsum dolor sit amet. Non ipsum corporis ut maxime nostrum et commodi nulla ut dicta maxime et sint sint. Aut voluptas maxime qui expedita tenetur qui quia dolorem ut dolores corporis!. Ut magnam aliquid et laudantium repellat aut asperiores quidem ut eius iure sit nemo dolores est provident quia. Et reprehenderit veritatis aut commodi doloribus et fuga reprehenderit?", supplier: "IKEA", price: 350, width: "200 cm", height: "135 cm", diameter: "105 cm"),
    Product(name: "Some Coushion5", image: "fn5", description: "Lorem ipsum dolor sit amet. Non ipsum corporis ut maxime nostrum et commodi nulla ut dicta maxime et sint sint. Aut voluptas maxime qui expedita tenetur qui quia dolorem ut dolores corporis!. Ut magnam aliquid et laudantium repellat aut asperiores quidem ut eius iure sit nemo dolores est provident quia. Et reprehenderit veritatis aut commodi doloribus et fuga reprehenderit?", supplier: "IKEA", price: 350, width: "200 cm", height: "135 cm", diameter: "105 cm"),
]
