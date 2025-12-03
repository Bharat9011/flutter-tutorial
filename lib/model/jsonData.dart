class JsonData {
    Content1Class content1;
    Content1Class content2;
    Content1Class content3;
    Content1Class content4;
    Content1Class content5;
    Content1Class content6;
    Content7 content7;
    Content1Class content8;
    Content1Class content9;
    Content1Class content10;
    Content1Class content11;
    Content1Class content12;
    Content1Class content13;
    Content1Class content15;

    JsonData({
        required this.content1,
        required this.content2,
        required this.content3,
        required this.content4,
        required this.content5,
        required this.content6,
        required this.content7,
        required this.content8,
        required this.content9,
        required this.content10,
        required this.content11,
        required this.content12,
        required this.content13,
        required this.content15,
    });

    factory JsonData.fromJson(Map<String, dynamic> json) => JsonData(
        content1: Content1Class.fromJson(json["content1"]),
        content2: Content1Class.fromJson(json["content2"]),
        content3: Content1Class.fromJson(json["content3"]),
        content4: Content1Class.fromJson(json["content4"]),
        content5: Content1Class.fromJson(json["content5"]),
        content6: Content1Class.fromJson(json["content6"]),
        content7: Content7.fromJson(json["content7"]),
        content8: Content1Class.fromJson(json["content8"]),
        content9: Content1Class.fromJson(json["content9"]),
        content10: Content1Class.fromJson(json["content10"]),
        content11: Content1Class.fromJson(json["content11"]),
        content12: Content1Class.fromJson(json["content12"]),
        content13: Content1Class.fromJson(json["content13"]),
        content15: Content1Class.fromJson(json["content15"]),
    );

    Map<String, dynamic> toJson() => {
        "content1": content1.toJson(),
        "content2": content2.toJson(),
        "content3": content3.toJson(),
        "content4": content4.toJson(),
        "content5": content5.toJson(),
        "content6": content6.toJson(),
        "content7": content7.toJson(),
        "content8": content8.toJson(),
        "content9": content9.toJson(),
        "content10": content10.toJson(),
        "content11": content11.toJson(),
        "content12": content12.toJson(),
        "content13": content13.toJson(),
        "content15": content15.toJson(),
    };
}

class Content1Class {
    String content;
    String type;
    TypeOf typeOf;

    Content1Class({
        required this.content,
        required this.type,
        required this.typeOf,
    });

    factory Content1Class.fromJson(Map<String, dynamic> json) => Content1Class(
        content: json["content"],
        type: json["type"],
        typeOf: typeOfValues.map[json["typeOf"]]!,
    );

    Map<String, dynamic> toJson() => {
        "content": content,
        "type": type,
        "typeOf": typeOfValues.reverse[typeOf],
    };
}

enum TypeOf {
    LIST,
    TEXT
}

final typeOfValues = EnumValues({
    "List": TypeOf.LIST,
    "Text": TypeOf.TEXT
});

class Content7 {
    List<ContentElement> content;
    String type;
    TypeOf typeOf;

    Content7({
        required this.content,
        required this.type,
        required this.typeOf,
    });

    factory Content7.fromJson(Map<String, dynamic> json) => Content7(
        content: List<ContentElement>.from(json["content"].map((x) => ContentElement.fromJson(x))),
        type: json["type"],
        typeOf: typeOfValues.map[json["typeOf"]]!,
    );

    Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "type": type,
        "typeOf": typeOfValues.reverse[typeOf],
    };
}

class ContentElement {
    int number;
    String title;
    List<String> bullets;

    ContentElement({
        required this.number,
        required this.title,
        required this.bullets,
    });

    factory ContentElement.fromJson(Map<String, dynamic> json) => ContentElement(
        number: json["number"],
        title: json["title"],
        bullets: List<String>.from(json["bullets"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "title": title,
        "bullets": List<dynamic>.from(bullets.map((x) => x)),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
