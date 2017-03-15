import NetworkExtension

var request = URLRequest(url: URL(string: "http://localhost:8000/submit")!)
request.httpMethod = "POST"
let postString = "initials=asd&score=12345"
request.httpBody = postString.data(using: .utf8)
let task = URLSession.shared.dataTask(with: request) { data, response, error in
    guard let data = data, error == nil else {
        // check for fundamental networking error
        print("error=\(error)")
        return
    }
    
    if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
        // check for http errors
        print("statusCode should be 200, but is \(httpStatus.statusCode)")
        print("response = \(response)")
    }
    
    let responseString = String(data: data, encoding: .utf8)
    print("responseString = \(responseString)")
}
task.resume()