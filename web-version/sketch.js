function Block (xPos, yPos, zPos, xLen, yLen, zLen, colorRed, colorGreen, colorBlue) {
  this.x = xPos;
  this.y = yPos;
  this.z = zPos;
  this.xL = xLen;
  this.yL = yLen;
  this.zL = zLen;
  this.cR = colorRed;
  this.cG = colorGreen;
  this.cB = colorBlue;
}

function Camera(xPos, yPos, zPos, fieldView, angleX, angleY, angleZ) {
  this.x = xPos;
  this.y = yPos;
  this.z = zPos;
  this.fov = fieldView;
  this.aX = angleX;
  this.aY = angleY;
  this.aZ = angleZ;
  
  this.renderObjects = function() {
    for (let b = 0; b < blocks.length; b++) {
      let bX = blocks[b].x;
      let bY = blocks[b].y;
      let bZ = blocks[b].z;
      let bL = blocks[b].xL;
      let bW = blocks[b].yL;
      let bH = blocks[b].zL;
      let aXr = radians(this.aX);
      let aYr = radians(this.aY);
      let aZr = radians(this.aZ);
      let fovR = radians(this.fov);      
      let lensDistance = 250/(tan(fovR/2));
      
      let eP1 = [[bX-bL/2], [bY-bH/2], [bZ-bW/2]];
      let eP2 = [[bX+bL/2], [bY-bH/2], [bZ-bW/2]];
      let eP3 = [[bX-bL/2], [bY+bH/2], [bZ-bW/2]];
      let eP4 = [[bX+bL/2], [bY+bH/2], [bZ-bW/2]];
      let eP5 = [[bX-bL/2], [bY-bH/2], [bZ+bW/2]];
      let eP6 = [[bX+bL/2], [bY-bH/2], [bZ+bW/2]];
      let eP7 = [[bX-bL/2], [bY+bH/2], [bZ+bW/2]];
      let eP8 = [[bX+bL/2], [bY+bH/2], [bZ+bW/2]];
      
      let tP1 = [
      [cos(aYr)*((sin(aZr)*eP1[1][0])+(cos(aZr)*eP1[0][0]))-(sin(aYr)*eP1[2][0])],
      [sin(aXr)*((cos(aYr)*eP1[2][0])+(sin(aYr)*((sin(aZr)*eP1[1][0])+(cos(aZr)*eP1[0][0]))))+cos(aXr)*((cos(aZr)*eP1[1][0])-(sin(aZr)*eP1[0][0]))],
      [cos(aXr)*((cos(aYr)*eP1[2][0])+(sin(aYr)*((sin(aZr)*eP1[1][0])+(cos(aZr)*eP1[0][0]))))+sin(aXr)*((cos(aZr)*eP1[1][0])-(sin(aZr)*eP1[0][0]))]
      ];
      let tP2 = [
      [cos(aYr)*((sin(aZr)*eP2[1][0])+(cos(aZr)*eP2[0][0]))-(sin(aYr)*eP2[2][0])],
      [sin(aXr)*((cos(aYr)*eP2[2][0])+(sin(aYr)*((sin(aZr)*eP2[1][0])+(cos(aZr)*eP2[0][0]))))+cos(aXr)*((cos(aZr)*eP2[1][0])-(sin(aZr)*eP2[0][0]))],
      [cos(aXr)*((cos(aYr)*eP2[2][0])+(sin(aYr)*((sin(aZr)*eP2[1][0])+(cos(aZr)*eP2[0][0]))))+sin(aXr)*((cos(aZr)*eP2[1][0])-(sin(aZr)*eP2[0][0]))]
      ];
      let tP3 = [
      [cos(aYr)*((sin(aZr)*eP3[1][0])+(cos(aZr)*eP3[0][0]))-(sin(aYr)*eP3[2][0])],
      [sin(aXr)*((cos(aYr)*eP3[2][0])+(sin(aYr)*((sin(aZr)*eP3[1][0])+(cos(aZr)*eP3[0][0]))))+cos(aXr)*((cos(aZr)*eP3[1][0])-(sin(aZr)*eP3[0][0]))],
      [cos(aXr)*((cos(aYr)*eP3[2][0])+(sin(aYr)*((sin(aZr)*eP3[1][0])+(cos(aZr)*eP3[0][0]))))+sin(aXr)*((cos(aZr)*eP3[1][0])-(sin(aZr)*eP3[0][0]))]
      ];
      let tP4 = [
      [cos(aYr)*((sin(aZr)*eP4[1][0])+(cos(aZr)*eP4[0][0]))-(sin(aYr)*eP4[2][0])],
      [sin(aXr)*((cos(aYr)*eP4[2][0])+(sin(aYr)*((sin(aZr)*eP4[1][0])+(cos(aZr)*eP4[0][0]))))+cos(aXr)*((cos(aZr)*eP4[1][0])-(sin(aZr)*eP4[0][0]))],
      [cos(aXr)*((cos(aYr)*eP4[2][0])+(sin(aYr)*((sin(aZr)*eP4[1][0])+(cos(aZr)*eP4[0][0]))))+sin(aXr)*((cos(aZr)*eP4[1][0])-(sin(aZr)*eP4[0][0]))]
      ];
      let tP5 = [
      [cos(aYr)*((sin(aZr)*eP5[1][0])+(cos(aZr)*eP5[0][0]))-(sin(aYr)*eP5[2][0])],
      [sin(aXr)*((cos(aYr)*eP5[2][0])+(sin(aYr)*((sin(aZr)*eP5[1][0])+(cos(aZr)*eP5[0][0]))))+cos(aXr)*((cos(aZr)*eP5[1][0])-(sin(aZr)*eP5[0][0]))],
      [cos(aXr)*((cos(aYr)*eP5[2][0])+(sin(aYr)*((sin(aZr)*eP5[1][0])+(cos(aZr)*eP5[0][0]))))+sin(aXr)*((cos(aZr)*eP5[1][0])-(sin(aZr)*eP5[0][0]))]
      ];
      let tP6 = [
      [cos(aYr)*((sin(aZr)*eP6[1][0])+(cos(aZr)*eP6[0][0]))-(sin(aYr)*eP6[2][0])],
      [sin(aXr)*((cos(aYr)*eP6[2][0])+(sin(aYr)*((sin(aZr)*eP6[1][0])+(cos(aZr)*eP6[0][0]))))+cos(aXr)*((cos(aZr)*eP6[1][0])-(sin(aZr)*eP6[0][0]))],
      [cos(aXr)*((cos(aYr)*eP6[2][0])+(sin(aYr)*((sin(aZr)*eP6[1][0])+(cos(aZr)*eP6[0][0]))))+sin(aXr)*((cos(aZr)*eP6[1][0])-(sin(aZr)*eP6[0][0]))]
      ];
      let tP7 = [
      [cos(aYr)*((sin(aZr)*eP7[1][0])+(cos(aZr)*eP7[0][0]))-(sin(aYr)*eP7[2][0])],
      [sin(aXr)*((cos(aYr)*eP7[2][0])+(sin(aYr)*((sin(aZr)*eP7[1][0])+(cos(aZr)*eP7[0][0]))))+cos(aXr)*((cos(aZr)*eP7[1][0])-(sin(aZr)*eP7[0][0]))],
      [cos(aXr)*((cos(aYr)*eP7[2][0])+(sin(aYr)*((sin(aZr)*eP7[1][0])+(cos(aZr)*eP7[0][0]))))+sin(aXr)*((cos(aZr)*eP7[1][0])-(sin(aZr)*eP7[0][0]))]
      ];
      let tP8 = [
      [cos(aYr)*((sin(aZr)*eP8[1][0])+(cos(aZr)*eP8[0][0]))-(sin(aYr)*eP8[2][0])],
      [sin(aXr)*((cos(aYr)*eP8[2][0])+(sin(aYr)*((sin(aZr)*eP8[1][0])+(cos(aZr)*eP8[0][0]))))+cos(aXr)*((cos(aZr)*eP8[1][0])-(sin(aZr)*eP8[0][0]))],
      [cos(aXr)*((cos(aYr)*eP8[2][0])+(sin(aYr)*((sin(aZr)*eP8[1][0])+(cos(aZr)*eP8[0][0]))))+sin(aXr)*((cos(aZr)*eP8[1][0])-(sin(aZr)*eP8[0][0]))]
      ];
      
      let sP1 = [[(lensDistance/tP1[2][0])*tP1[0][0]+(width/2)], [(lensDistance/tP1[2][0])*tP1[1][0]+(height/2)]]; 
      let sP2 = [[(lensDistance/tP2[2][0])*tP2[0][0]+(width/2)], [(lensDistance/tP2[2][0])*tP2[1][0]+(height/2)]]; 
      let sP3 = [[(lensDistance/tP3[2][0])*tP3[0][0]+(width/2)], [(lensDistance/tP3[2][0])*tP3[1][0]+(height/2)]]; 
      let sP4 = [[(lensDistance/tP4[2][0])*tP4[0][0]+(width/2)], [(lensDistance/tP4[2][0])*tP4[1][0]+(height/2)]]; 
      let sP5 = [[(lensDistance/tP5[2][0])*tP5[0][0]+(width/2)], [(lensDistance/tP5[2][0])*tP5[1][0]+(height/2)]]; 
      let sP6 = [[(lensDistance/tP6[2][0])*tP6[0][0]+(width/2)], [(lensDistance/tP6[2][0])*tP6[1][0]+(height/2)]]; 
      let sP7 = [[(lensDistance/tP7[2][0])*tP7[0][0]+(width/2)], [(lensDistance/tP7[2][0])*tP7[1][0]+(height/2)]]; 
      let sP8 = [[(lensDistance/tP8[2][0])*tP8[0][0]+(width/2)], [(lensDistance/tP8[2][0])*tP8[1][0]+(height/2)]]; 
      
      console.log("x: " + str(sP1[0][0]) + ", y: " + str(sP1[1][0]));
      console.log("x: " + str(sP2[0][0]) + ", y: " + str(sP2[1][0]));
      console.log("x: " + str(sP3[0][0]) + ", y: " + str(sP3[1][0]));
      console.log("x: " + str(sP4[0][0]) + ", y: " + str(sP4[1][0]));
      console.log("x: " + str(sP5[0][0]) + ", y: " + str(sP5[1][0]));
      console.log("x: " + str(sP6[0][0]) + ", y: " + str(sP6[1][0]));
      console.log("x: " + str(sP7[0][0]) + ", y: " + str(sP7[1][0]));
      console.log("x: " + str(sP8[0][0]) + ", y: " + str(sP8[1][0]));
      
      line(sP1[0][0], sP1[1][0], sP2[0][0], sP2[1][0]);
      line(sP1[0][0], sP1[1][0], sP3[0][0], sP3[1][0]);
      line(sP1[0][0], sP1[1][0], sP5[0][0], sP5[1][0]);
      line(sP2[0][0], sP2[1][0], sP4[0][0], sP4[1][0]);
      line(sP2[0][0], sP2[1][0], sP6[0][0], sP6[1][0]);
      line(sP3[0][0], sP3[1][0], sP4[0][0], sP4[1][0]);
      line(sP3[0][0], sP3[1][0], sP7[0][0], sP7[1][0]);
      line(sP4[0][0], sP4[1][0], sP8[0][0], sP8[1][0]);
      line(sP5[0][0], sP5[1][0], sP6[0][0], sP6[1][0]);
      line(sP5[0][0], sP5[1][0], sP7[0][0], sP7[1][0]);
      line(sP6[0][0], sP6[1][0], sP8[0][0], sP8[1][0]);
      line(sP7[0][0], sP7[1][0], sP8[0][0], sP8[1][0]);
    }
  }
}

let blocks = [];
let cam = new Camera(0, 0, 0, 60, 0, 45, 0);

function setup() {
  createCanvas(500, 500);
  background(200);
  strokeWeight(5);
  
  blocks.push(new Block(300, 100, 300, 100, 100, 100, 0, 0, 0));
  blocks.push(new Block(300, -100, 300, 100, 100, 100, 0, 0, 0));
  cam.renderObjects();
}



