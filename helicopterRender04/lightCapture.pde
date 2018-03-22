void getBrightness() {

  float brightestValue = 0.0;
  float brightX = 0;
  float brightY = 0;
 


    if (video.available()) {
      video.read();
    }

    video.loadPixels();



    for (int x = 0; x < video.width; x++) {
      for (int y = 0; y < video.height; y++) {
        int loc = x + y * video.width;
        float currentBrightness = brightness(video.pixels[loc]);
        if (currentBrightness > brightestValue) {
          brightestValue = currentBrightness;
          brightX = x;
          brightY = y;
          mbx = map(brightX,0,320,0,800);
          mby = map(brightY,0,240,0,600);
        } 
      }
    }

    brightsX[n] = mbx;
    brightsY[n] = mby;
    n += 1;
    if(n > 3) {
      n = 0;
    }
    mbx = (brightsX[0]+brightsX[1]+brightsX[2]+brightsX[3])/4;
    mby = (brightsY[0]+brightsY[1]+brightsY[2]+brightsY[3])/4;
  }


