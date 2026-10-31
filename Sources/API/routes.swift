import Vapor
import Foundation

func routes(_ app: Application) throws {

    app.get("api", "constitution") { req async throws -> Response in
        try jsonResponse(
            req: req,
            filename: "constitution.json"
        )
    }

    app.get("api", "amendments") { req async throws -> Response in
        try jsonResponse(
            req: req,
            filename: "amendments.json"
        )
    }

    app.get("api", "schedules") { req async throws -> Response in
        try jsonResponse(
            req: req,
            filename: "schedules.json"
        )
    }
}

private func jsonResponse(
    req: Request,
    filename: String
) throws -> Response {

    let path = req.application.directory.publicDirectory
        + "data/\(filename)"

    let data = try Data(
        contentsOf: URL(fileURLWithPath: path)
    )

    return Response(
        status: .ok,
        headers: [
            "Content-Type": "application/json; charset=utf-8"
        ],
        body: .init(data: data)
    )
}
