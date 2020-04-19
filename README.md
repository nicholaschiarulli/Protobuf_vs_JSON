# Potential pitfalls

You may potentially have to ```chmod +x run.sh``` as it may lose its permissions when I submit this project.

This project is compiled and run using gradle wrapper as I was told I could use it for the project. The output will include a BUILD SUCCESFUL in s and then:
Total time is x ms
Speed of Protobuf/Json Serialization kbps
Speed of Protobuf/Json Deserialization kbps


# Instructions to compile and run

To compile:
```./run.sh -c```

To run:
```./run.sh and whatever flags you guys provide and the text input file you provide```

# What I learned

## Comparing the speed

Through running multiple tests of multiple sized files I found that json was pretty consistent in terms of Serialization vs Deserialization, with Deserialization being slightly faster.

Proto on the other hand was much more lopsided. Protobuf Serialization was extremeley fast. Around **20 times** faster than json in some cases. However Protobuf was very slow when it came to Deserialization. It was slower than both Jsons serialization and deserialization. I found this is the case because Protobuf needs to make objects on the fly from a series of many key-value pairs.

## Size of formatted files

.json files turned about to be larger than proto formatted data. This is an advantage that proto has because it is binary dana whereas json is text based.

## JSON was easier for me to understand because of its output

Json formatted data is human readable which helped me understand the process of data serialization and deserialization. Protobuf however is not human readable and it was difficult for me to understand if the serialization process was done correctly until I began to deserialzing.

## Coding Protobuf was more simple than Json

Protobuf has seamless methods and builders that made it easy to serialize and deserialize my data. It knew exactly how to construct easy to work with classes based on the proto schema provided. Json however took more work because I had to make my own Student classes with getters and setters to be able to make Json objects based on how I wanted the data formatted.

## Learning how to write a script

I learned how to make a bash script and have it perform certain tasks based on passed arguments. This is a really beneficial tool because it allows me to easily test my program without having to remember so many specific commands. It also allows other to test it easily too.

## Information on Proto is less common than Json

I had a lot of trouble learning about proto at first compared to json. The documentation and examples for json online is rich while proto does not have as much. I also had previously worke with json before so the learning curve for json was much simpler for me in this project.