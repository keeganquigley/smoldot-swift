## Smoldot Swift

A Swift wrapper for the [smoldot](https://github.com/smol-dot/smoldot) Rust-based  Polkadot light client.


**Installation**

Add the package declaration to your project's manifest dependencies array:

```
.package(url: "https://github.com/finsig/smoldot-swift.git", from: "0.1.0")
```

**Usage**

Initialize a Chain from a specification. A Chain Specification is a JSON Object that describes a Polkadot-based blockchain network. Chain Specifications for Polkadot, Kusama, Rococo, and Westend are provided.


```
var chain = Chain(specification: .polkadot)
```

Add the chain to the client to connect to the network:

```
try Client.shared.add(chain: &chain)
```


RPC requests must conform to the JSON-RPC 2.0 protocol. A request can be built programatically:

```
let request = try JSONRPC2Request(method: "chain_getHeader", identifier: .int(1))
```

or initialized from a String in the JSON data format:

```
let request = try JSONRPC2Request(string: "{\"id\":1,\"jsonrpc\":\"2.0\",\"method\":\"chain_getHeader\",\"params\":[]}")
```
To send the request use:

```
try Client.shared.send(request: request, to: chain)
```

To wait for a response use:

```
try await Client.shared.response(from: chain)
```

Alternatively, an asynchronous stream of responses may be read using:

```
try await Client.shared.responses(from: chain)
```

To disconnect the client from the network use:

```
try Client.shared.remove(chain: &chain)
````

**Logging**

You may enable logging of the smoldot Rust FFI library with an environment variable at runtime (`RUST_LOG`). The library uses the Rust`env_logger` framework and levels can be set accordingly.

<<Placeholder: screenshot>>

**Building locally**

There is a build_xcframework.sh script in the repo which can be used to build the XCFramework from the smoldot Rust FFI library. This will create the framework and place it (along with the checksum) in the `.build/smoldot-framework/build` directory.

```
> zsh build_xcframework.sh 
```

Example Project
An example project using Smoldot Swift.
