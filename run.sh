#!/bin/bash

if [ $1 = '-c' ]
then
    chmod 755 gradlew
    ./gradlew clean build
elif [ $1 = '-s' ]
then
    if [ $2 = '-p' ]
    then
       ./gradlew run --args='-s -p '$3''
    elif [ $2 = '-j' ]
    then
       ./gradlew run --args='-s -j '$3''
    fi
elif [ $1 = '-d' ]
then
    if [ $2 = '-j' ]
    then
       ./gradlew run --args='-d -j '$3''
    elif [ $2 = '-p' ]
    then
       ./gradlew run --args='-d -p '$3''
    fi
elif [ $1 = '-t' ]
then
    if [ $2 = '-j' ]
    then
        ##Metric measurment JSON
        Size_input_text=$(ls -nl $3 | awk '{print $5}')
        ./gradlew run --args='-t -j '$3''
        ###declare result=$(./gradlew run --args='-t -j '$3'')
        ###declare result=$(cat jsonTimes1.txt)
        mapfile -t result < jsonTimes1.txt
        Serial_time=${result[0]}
        Deserial_time=${result[1]}
        Total_time=${result[2]}
        echo Total time is $Total_time ms
        Size_output_json=$(ls -nl result.json | awk '{print $5}')
        Ss=$(echo "scale=4;$Size_input_text/1000/$Serial_time" | bc -l)
        echo Speed of JSON Serialization $Ss kbps
        Sd=$(echo "scale=4;$Size_output_json/1000/$Deserial_time" | bc -l)
        echo Speed of JSON Deserialization $Sd kbps
        rm jsonTimes1.txt
    elif [ $2 = '-p' ]
    then
        ##Metric measurment protobuf
        Size_input_text=$(ls -nl $3 | awk '{print $5}')
        ./gradlew run --args='-t -p '$3''
        ###declare result=($(./proto 3 $3))
        mapfile -t result < protoTimes1.txt
        Serial_time=${result[0]}
        Deserial_time=${result[1]}
        Total_time=${result[2]}
        echo Total time is $Total_time ms
        Size_output_proto=$(ls -nl result_protobuf | awk '{print $5}')
        Ss=$(echo "scale=4;$Size_input_text/1000/$Serial_time" | bc -l)
        echo Speed of PROTOBUF Serialization $Ss kbps
        Sd=$(echo "scale=4;$Size_output_proto/1000/$Deserial_time" | bc -l)
        echo Speed of PROTOBUF Deserialization $Sd kbps
        rm protoTimes1.txt
    fi
fi
