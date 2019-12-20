class Block {
  float x, y, z, xL, yL, zL, cR, cG, cB;
  Block(float xPos, float yPos, float zPos, float xLen, float yLen, float zLen, float colorRed, float colorGreen, float colorBlue) {
    x = xPos;
    y = yPos;
    z = zPos;
    xL = xLen;
    yL = yLen;
    zL = zLen;
    cR = colorRed;
    cG = colorGreen;
    cB = colorBlue;
  }
}

class Camera {
  float x, y, z, fov, aX, aY, aZ;
  Camera(float xPos, float yPos, float zPos, float fieldView, float angleX, float angleY, float angleZ) {
    x = xPos;
    y = yPos;
    z = zPos;
    fov = fieldView;
    aX = angleX;
    aY = angleY;
    aZ = angleZ;
  }
  
  void renderObjects() {
    for (int b = 0; b < blocks.length; b++) {
      float bX = blocks[b].x;
      float bY = blocks[b].y;
      float bZ = blocks[b].z;
      float bL = blocks[b].xL;
      float bW = blocks[b].yL;
      float bH = blocks[b].zL;
      float aXr = radians(aX);
      float aYr = radians(aY);
      float aZr = radians(aZ);
      float fovR = radians(fov);      
      float lensDistance = 500/(tan(fovR/2));
      
      float[][] eP1 = {{bX-bL/2}, {bY-bH/2}, {bZ-bW/2}};
      float[][] eP2 = {{bX+bL/2}, {bY-bH/2}, {bZ-bW/2}};
      float[][] eP3 = {{bX-bL/2}, {bY+bH/2}, {bZ-bW/2}};
      float[][] eP4 = {{bX+bL/2}, {bY+bH/2}, {bZ-bW/2}};
      float[][] eP5 = {{bX-bL/2}, {bY-bH/2}, {bZ+bW/2}};
      float[][] eP6 = {{bX+bL/2}, {bY-bH/2}, {bZ+bW/2}};
      float[][] eP7 = {{bX-bL/2}, {bY+bH/2}, {bZ+bW/2}};
      float[][] eP8 = {{bX+bL/2}, {bY+bH/2}, {bZ+bW/2}};
      
      float[][] tP1 = {
      {cos(aYr)*((sin(aZr)*eP1[1][0])+(cos(aZr)*eP1[0][0]))-(sin(aYr)*eP1[2][0])},
      {sin(aXr)*((cos(aYr)*eP1[2][0])+(sin(aYr)*((sin(aZr)*eP1[1][0])+(cos(aZr)*eP1[0][0]))))+cos(aXr)*((cos(aZr)*eP1[1][0])-(sin(aZr)*eP1[0][0]))},
      {cos(aXr)*((cos(aYr)*eP1[2][0])+(sin(aYr)*((sin(aZr)*eP1[1][0])+(cos(aZr)*eP1[0][0]))))+sin(aXr)*((cos(aZr)*eP1[1][0])-(sin(aZr)*eP1[0][0]))}
      };
      float[][] tP2 = {
      {cos(aYr)*((sin(aZr)*eP2[1][0])+(cos(aZr)*eP2[0][0]))-(sin(aYr)*eP2[2][0])},
      {sin(aXr)*((cos(aYr)*eP2[2][0])+(sin(aYr)*((sin(aZr)*eP2[1][0])+(cos(aZr)*eP2[0][0]))))+cos(aXr)*((cos(aZr)*eP2[1][0])-(sin(aZr)*eP2[0][0]))},
      {cos(aXr)*((cos(aYr)*eP2[2][0])+(sin(aYr)*((sin(aZr)*eP2[1][0])+(cos(aZr)*eP2[0][0]))))+sin(aXr)*((cos(aZr)*eP2[1][0])-(sin(aZr)*eP2[0][0]))}
      };
      float[][] tP3 = {
      {cos(aYr)*((sin(aZr)*eP3[1][0])+(cos(aZr)*eP3[0][0]))-(sin(aYr)*eP3[2][0])},
      {sin(aXr)*((cos(aYr)*eP3[2][0])+(sin(aYr)*((sin(aZr)*eP3[1][0])+(cos(aZr)*eP3[0][0]))))+cos(aXr)*((cos(aZr)*eP3[1][0])-(sin(aZr)*eP3[0][0]))},
      {cos(aXr)*((cos(aYr)*eP3[2][0])+(sin(aYr)*((sin(aZr)*eP3[1][0])+(cos(aZr)*eP3[0][0]))))+sin(aXr)*((cos(aZr)*eP3[1][0])-(sin(aZr)*eP3[0][0]))}
      };
      float[][] tP4 = {
      {cos(aYr)*((sin(aZr)*eP4[1][0])+(cos(aZr)*eP4[0][0]))-(sin(aYr)*eP4[2][0])},
      {sin(aXr)*((cos(aYr)*eP4[2][0])+(sin(aYr)*((sin(aZr)*eP4[1][0])+(cos(aZr)*eP4[0][0]))))+cos(aXr)*((cos(aZr)*eP4[1][0])-(sin(aZr)*eP4[0][0]))},
      {cos(aXr)*((cos(aYr)*eP4[2][0])+(sin(aYr)*((sin(aZr)*eP4[1][0])+(cos(aZr)*eP4[0][0]))))+sin(aXr)*((cos(aZr)*eP4[1][0])-(sin(aZr)*eP4[0][0]))}
      };
      float[][] tP5 = {
      {cos(aYr)*((sin(aZr)*eP5[1][0])+(cos(aZr)*eP5[0][0]))-(sin(aYr)*eP5[2][0])},
      {sin(aXr)*((cos(aYr)*eP5[2][0])+(sin(aYr)*((sin(aZr)*eP5[1][0])+(cos(aZr)*eP5[0][0]))))+cos(aXr)*((cos(aZr)*eP5[1][0])-(sin(aZr)*eP5[0][0]))},
      {cos(aXr)*((cos(aYr)*eP5[2][0])+(sin(aYr)*((sin(aZr)*eP5[1][0])+(cos(aZr)*eP5[0][0]))))+sin(aXr)*((cos(aZr)*eP5[1][0])-(sin(aZr)*eP5[0][0]))}
      };
      float[][] tP6 = {
      {cos(aYr)*((sin(aZr)*eP6[1][0])+(cos(aZr)*eP6[0][0]))-(sin(aYr)*eP6[2][0])},
      {sin(aXr)*((cos(aYr)*eP6[2][0])+(sin(aYr)*((sin(aZr)*eP6[1][0])+(cos(aZr)*eP6[0][0]))))+cos(aXr)*((cos(aZr)*eP6[1][0])-(sin(aZr)*eP6[0][0]))},
      {cos(aXr)*((cos(aYr)*eP6[2][0])+(sin(aYr)*((sin(aZr)*eP6[1][0])+(cos(aZr)*eP6[0][0]))))+sin(aXr)*((cos(aZr)*eP6[1][0])-(sin(aZr)*eP6[0][0]))}
      };
      float[][] tP7 = {
      {cos(aYr)*((sin(aZr)*eP7[1][0])+(cos(aZr)*eP7[0][0]))-(sin(aYr)*eP7[2][0])},
      {sin(aXr)*((cos(aYr)*eP7[2][0])+(sin(aYr)*((sin(aZr)*eP7[1][0])+(cos(aZr)*eP7[0][0]))))+cos(aXr)*((cos(aZr)*eP7[1][0])-(sin(aZr)*eP7[0][0]))},
      {cos(aXr)*((cos(aYr)*eP7[2][0])+(sin(aYr)*((sin(aZr)*eP7[1][0])+(cos(aZr)*eP7[0][0]))))+sin(aXr)*((cos(aZr)*eP7[1][0])-(sin(aZr)*eP7[0][0]))}
      };
      float[][] tP8 = {
      {cos(aYr)*((sin(aZr)*eP8[1][0])+(cos(aZr)*eP8[0][0]))-(sin(aYr)*eP8[2][0])},
      {sin(aXr)*((cos(aYr)*eP8[2][0])+(sin(aYr)*((sin(aZr)*eP8[1][0])+(cos(aZr)*eP8[0][0]))))+cos(aXr)*((cos(aZr)*eP8[1][0])-(sin(aZr)*eP8[0][0]))},
      {cos(aXr)*((cos(aYr)*eP8[2][0])+(sin(aYr)*((sin(aZr)*eP8[1][0])+(cos(aZr)*eP8[0][0]))))+sin(aXr)*((cos(aZr)*eP8[1][0])-(sin(aZr)*eP8[0][0]))}
      };
      
      float[][] sP1 = {{(lensDistance/tP1[2][0])*tP1[0][0]+(width/2)}, {(lensDistance/tP1[2][0])*tP1[1][0]+(height/2)}}; 
      float[][] sP2 = {{(lensDistance/tP2[2][0])*tP2[0][0]+(width/2)}, {(lensDistance/tP2[2][0])*tP2[1][0]+(height/2)}}; 
      float[][] sP3 = {{(lensDistance/tP3[2][0])*tP3[0][0]+(width/2)}, {(lensDistance/tP3[2][0])*tP3[1][0]+(height/2)}}; 
      float[][] sP4 = {{(lensDistance/tP4[2][0])*tP4[0][0]+(width/2)}, {(lensDistance/tP4[2][0])*tP4[1][0]+(height/2)}}; 
      float[][] sP5 = {{(lensDistance/tP5[2][0])*tP5[0][0]+(width/2)}, {(lensDistance/tP5[2][0])*tP5[1][0]+(height/2)}}; 
      float[][] sP6 = {{(lensDistance/tP6[2][0])*tP6[0][0]+(width/2)}, {(lensDistance/tP6[2][0])*tP6[1][0]+(height/2)}}; 
      float[][] sP7 = {{(lensDistance/tP7[2][0])*tP7[0][0]+(width/2)}, {(lensDistance/tP7[2][0])*tP7[1][0]+(height/2)}}; 
      float[][] sP8 = {{(lensDistance/tP8[2][0])*tP8[0][0]+(width/2)}, {(lensDistance/tP8[2][0])*tP8[1][0]+(height/2)}}; 
      
      println("x: " + str(sP1[0][0]) + ", y: " + str(sP1[1][0]));
      println("x: " + str(sP2[0][0]) + ", y: " + str(sP2[1][0]));
      println("x: " + str(sP3[0][0]) + ", y: " + str(sP3[1][0]));
      println("x: " + str(sP4[0][0]) + ", y: " + str(sP4[1][0]));
      println("x: " + str(sP5[0][0]) + ", y: " + str(sP5[1][0]));
      println("x: " + str(sP6[0][0]) + ", y: " + str(sP6[1][0]));
      println("x: " + str(sP7[0][0]) + ", y: " + str(sP7[1][0]));
      println("x: " + str(sP8[0][0]) + ", y: " + str(sP8[1][0]));
      
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

Block[] blocks = new Block[2];
Camera cam = new Camera(0, 0, 0, 60, 0, 45, 0);

void setup() {
  size(1000, 1000);
  background(255);
  strokeWeight(5);
  
  blocks[0] = new Block(300, 100, 300, 100, 100, 100, 0, 0, 0);
  blocks[1] = new Block(300, -100, 300, 100, 100, 100, 0, 0, 0);
  cam.renderObjects();
}



