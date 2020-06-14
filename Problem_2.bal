import ballerina/io;
import ballerina/log;

function close(io:CharacterChannel characterChannel) {
    characterChannel.close() but {
        error e =>
          log:printError("Error occurred while closing character stream",
                          err = e)
    };
}
function read(string path) returns json {
    io:ByteChannel byteChannel = io:openFile(path, io:READ);//Create Byte Channel

    io:CharacterChannel ch = new io:CharacterChannel(byteChannel, "NUST061");

// Read JSON content from character channel
    match ch.readJson() {
        json result => {
            close(ch);
            return result;
        }
        error err => {
            close(ch);
            throw err;
        }
    }
}

function main(string... args) {
    string filePath = "./files/sample.json";
     json j1 = "Simio";
    io:println(j1);

    json j2 = 1.65;
    io:println(j2);

    json j3 = true;
    io:println(j3);

    json j4 = false;
    io:println(j4);

    json j5 = null;
// Creating JSON objects
    json j6 = { name: "Simio", color: "Brown", height: j2 };
    io:println(j6);

    io:println("Read the content written");

    json content = read(filePath);
    io:println(content);
}