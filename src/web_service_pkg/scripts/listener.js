#!/usr/bin/env node

/************************************************************************
 Copyright (c) 2017, Rethink Robotics
 Copyright (c) 2017, Ian McMahon

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
************************************************************************/

'use strict';
/**
 * This example demonstrates simple receiving of messages over the ROS system.
 */

// Require rosnodejs itself
const rosnodejs = require('rosnodejs');
const express = require('express');
const pickle = require('pickle');
const app = express();
// Requires the std_msgs message package
//const std_msgs = rosnodejs.require('std_msgs').msg;
const Gps_msgs= rosnodejs.require('sensors_pkg').msg;
//const Imu_msgs= rosnodejs.require('sensors_pkg').msg;
const Lidar_msgs= rosnodejs.require('sensor_msgs').msg;
const Camera_msgs= rosnodejs.require('sensors_pkg').msg;

app.use(express.json())

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

let gpsData={
  long: 0,
  lat: 0,
};

let imuData={
  linearX: 0,
  angularZ: 0,
};

let lidarData={
    ranges: [],
  };

let cameraData={
  image:[],
};
function callbackGps(msg) {
  gpsData={
    long: msg.long,
    lat: msg.lat, 
  }
}

function callbackImu(msg) {
  imuData={
    linearX: msg.linearX,
    angularZ: msg.angularZ, 
  }
}

function callbackLidar(msg) {
  lidarData={
    ranges: msg.ranges,
  }
}
function callbackCamera(msg) {
  cameraData={
    image: msg.image,
  }
}

app.get('/api/gps', (req,res)=> {
    console.log('<< GPS Get Request >>')
    res.send(gpsData)
});

app.get('/api/imu', (req,res)=> {
    console.log('<< IMU Get request >>')
    res.send(imuData)
});

app.get('/api/lidar', (req,res)=> {
    console.log('<< LIDAR Get request >>')
    res.send(lidarData)
});

app.get('/api/camera', (req,res)=> {
    console.log('<< Camera Get request >>')
    //pickle.loads(cameraData.image,() =>{
      res.sendFile('/home/pi/catkin_gp/image.jpg');
    //});
    
});

if (require.main === module) {
  // Invoke Main Talker Function
  
  rosnodejs.initNode('/web_service_listener')
    .then((rosNode) => {
      // Create ROS subscriber on the 'gps_topic' topic expecting GPS messages
      const subGps = rosNode.subscribe('/gps_topic', Gps_msgs.Gps, callbackGps);
      //const subImu = rosNode.subscribe('/imu_topic', Imu_msgs.Imu, callbackImu);
      const subLidar = rosNode.subscribe('/lidar_topic', Lidar_msgs.LaserScan, callbackLidar);
      //const subCamera = rosNode.subscribe('/camera_topic', Camera_msgs.Camera, callbackCamera);
    
      app.listen(3000, (err)=> {
       if (err) console.log(err);
      console.log('hey hey hey iam listening')
      });
    });
}


