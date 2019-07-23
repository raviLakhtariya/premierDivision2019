/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Base : Codable {
	let id_league : String?
	let name : String?
	let timezone : String?
	let language : String?
	let revision_build : String?
	let revision_build_android : String?
	let ad : Ad?
	let seasons : [Seasons]?

	enum CodingKeys: String, CodingKey {

		case id_league = "id_league"
		case name = "name"
		case timezone = "timezone"
		case language = "language"
		case revision_build = "revision_build"
		case revision_build_android = "revision_build_android"
		case ad = "ad"
		case seasons = "seasons"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id_league = try values.decodeIfPresent(String.self, forKey: .id_league)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
		language = try values.decodeIfPresent(String.self, forKey: .language)
		revision_build = try values.decodeIfPresent(String.self, forKey: .revision_build)
		revision_build_android = try values.decodeIfPresent(String.self, forKey: .revision_build_android)
		ad = try values.decodeIfPresent(Ad.self, forKey: .ad)
		seasons = try values.decodeIfPresent([Seasons].self, forKey: .seasons)
	}

}
