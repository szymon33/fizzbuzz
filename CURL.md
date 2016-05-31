# Sample cURL sessions

## Simple header test
```
curl -I http://api.example.com:3000
```

```
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
X-UA-Compatible: IE=Edge
ETag: "ba518e7bb13f1b9d72a0569a52fc2832"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cc7ee3ae31ea3d631c73d8f3e61f9d9e
X-Runtime: 0.115776
Connection: close
Server: WEBrick/1.3.1 (Ruby/2.1.2)
```

## Home page
```
curl http://api.example.com:3000
```

```json
[{"key":1,"value":"1"},{"key":2,"value":"2"},{"key":3,"value":"Fizz"},{"key":4,"value":"4"},{"key":5,"value":"Buzz"},{"key":6,"value":"Fizz"},{"key":7,"value":"7"},{"key":8,"value":"8"},{"key":9,"value":"Fizz"},{"key":10,"value":"Buzz"},{"key":11,"value":"11"},{"key":12,"value":"Fizz"},{"key":13,"value":"13"},{"key":14,"value":"14"},{"key":15,"value":"FizzBuzz"},{"key":16,"value":"16"},{"key":17,"value":"17"},{"key":18,"value":"Fizz"},{"key":19,"value":"19"},{"key":20,"value":"Buzz"},{"key":21,"value":"Fizz"},{"key":22,"value":"22"},{"key":23,"value":"23"},{"key":24,"value":"Fizz"},{"key":25,"value":"Buzz"},{"key":26,"value":"26"},{"key":27,"value":"Fizz"},{"key":28,"value":"28"},{"key":29,"value":"29"},{"key":30,"value":"FizzBuzz"},{"key":31,"value":"31"},{"key":32,"value":"32"},{"key":33,"value":"Fizz"},{"key":34,"value":"34"},{"key":35,"value":"Buzz"},{"key":36,"value":"Fizz"},{"key":37,"value":"37"},{"key":38,"value":"38"},{"key":39,"value":"Fizz"},{"key":40,"value":"Buzz"},{"key":41,"value":"41"},{"key":42,"value":"Fizz"},{"key":43,"value":"43"},{"key":44,"value":"44"},{"key":45,"value":"FizzBuzz"},{"key":46,"value":"46"},{"key":47,"value":"47"},{"key":48,"value":"Fizz"},{"key":49,"value":"49"},{"key":50,"value":"Buzz"},{"key":51,"value":"Fizz"},{"key":52,"value":"52"},{"key":53,"value":"53"},{"key":54,"value":"Fizz"},{"key":55,"value":"Buzz"},{"key":56,"value":"56"},{"key":57,"value":"Fizz"},{"key":58,"value":"58"},{"key":59,"value":"59"},{"key":60,"value":"FizzBuzz"},{"key":61,"value":"61"},{"key":62,"value":"62"},{"key":63,"value":"Fizz"},{"key":64,"value":"64"},{"key":65,"value":"Buzz"},{"key":66,"value":"Fizz"},{"key":67,"value":"67"},{"key":68,"value":"68"},{"key":69,"value":"Fizz"},{"key":70,"value":"Buzz"},{"key":71,"value":"71"},{"key":72,"value":"Fizz"},{"key":73,"value":"73"},{"key":74,"value":"74"},{"key":75,"value":"FizzBuzz"},{"key":76,"value":"76"},{"key":77,"value":"77"},{"key":78,"value":"Fizz"},{"key":79,"value":"79"},{"key":80,"value":"Buzz"},{"key":81,"value":"Fizz"},{"key":82,"value":"82"},{"key":83,"value":"83"},{"key":84,"value":"Fizz"},{"key":85,"value":"Buzz"},{"key":86,"value":"86"},{"key":87,"value":"Fizz"},{"key":88,"value":"88"},{"key":89,"value":"89"},{"key":90,"value":"FizzBuzz"},{"key":91,"value":"91"},{"key":92,"value":"92"},{"key":93,"value":"Fizz"},{"key":94,"value":"94"},{"key":95,"value":"Buzz"},{"key":96,"value":"Fizz"},{"key":97,"value":"97"},{"key":98,"value":"98"},{"key":99,"value":"Fizz"},{"key":100,"value":"Buzz"}]
```

## Paginated page
```console
curl http://api.example.com:3000/populate
```

```json
{"key":1,"value":"1"},{"key":2,"value":"2"},{"key":3,"value":"Fizz"},{"key":4,"value":"4"},{"key":5,"value":"Buzz"},{"key":6,"value":"Fizz"},{"key":7,"value":"7"},{"key":8,"value":"8"},{"key":9,"value":"Fizz"},{"key":10,"value":"Buzz"}]
```

## Changing page size.
```console
curl -X GET "http://api.example.com:3000/populate?total=20&perpage=5"
```

```json
[{"key":1,"value":"1"},{"key":2,"value":"2"},{"key":3,"value":"Fizz"},{"key":4,"value":"4"},{"key":5,"value":"Buzz"}]
```

## Changing page number.
```console
curl "http://api.example.com:3000/populate?page=4&perpage=5&total=20"
```

```json
[{"key":16,"value":"16"},{"key":17,"value":"17"},{"key":18,"value":"Fizz"},{"key":19,"value":"19"},{"key":20,"value":"Buzz"}]
```

## Show action
```console
curl "http://api.example.com:3000/populate/3"
```

```json
{"fizzbuzz":{"id":"3","decision":null}}
```

## Like action

**with store 'on'**

```console
curl -X PUT -d "decision=on" -i "http://api.example.com:3000/populate/3"
```

```console
HTTP/1.1 204 No Content 
X-Frame-Options: SAMEORIGIN
X-Xss-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Cache-Control: no-cache
X-Meta-Request-Version: 0.4.0
X-Request-Id: 329f7c8c-a32...
X-Runtime: 0.004284
Server: WEBrick/1.3.1 (Ruby/2.1.2)
Connection: Keep-Alive
````
