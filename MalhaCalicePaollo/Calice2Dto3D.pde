//Calice
//Cesar Alberto Bravo Pariente <cabpariente@uesc.br>
PImage img;
PrintWriter output;

void setup() {
  size(32,32);
  float xt, yt, zt;
  // float xt, zt;
  float[] altura = {37, 60, 102, 122, 130, 153, 163, 174, 192, 216, 208, 170, 170, 202, 228, 256, 288, 283, 295, 312, 323, 336, 344, 363, 387, 408, 440, 460, 485, 505, 510, 520, 527, 544, 563, 577, 600, 618, 618, 649, 671, 688, 708, 730, 750, 773, 793, 813, 828, 850, 807, 794, 812, 858, 878, 894, 905, 922, 932, 947, 964, 976};
  float[] raio = {205, 245, 245, 210, 210, 201, 225, 225, 207, 207, 223, 255, 300, 335, 345, 335, 300, 285, 285, 270, 291, 291, 280, 271, 263, 249, 218, 190, 148, 110, 83, 89, 83, 111, 131, 144, 156, 162, 70, 72, 72, 76, 79, 86, 93, 101, 114, 127, 141, 163, 163, 205, 248, 248, 204, 219, 219, 225, 256, 268, 304, 304};
 
  output = createWriter("Calice2Dto3D.ply");
  output.println("ply");
  output.println("format ascii 1.0");
  output.println("comment ");
  output.println("element vertex 2232");
  output.println("property float x");
  output.println("property float y");
  output.println("property float z");
  output.println("element face 2196");
  output.println("property list uchar int vertex_index");
  output.println("end_header"); 

 
  //yt=37.0; // altura Y
  for (int i=0;i<altura.length;i++){
    yt = altura[i];
    for (float t=0.0;t<=6.28;t+=0.1745) {
      xt = raio[i]*cos(t); // raio[i]
      zt = raio[i]*sin(t);
      // println(xt+"\t"+yt+"\t"+zt); // yt = altura[i]
      output.println(xt+"\t"+yt+"\t"+zt);
    }
  }
  
  for (int k=0; k<=2194; k+=36) {
    for (int h=k; h<(k+36); h++) {
      if(h == k+35){
        output.println("4\t"+h+"\t"+(h+36)+"\t"+(k+36)+"\t"+k);
      } else {
          output.println("4\t"+h+"\t"+(h+36)+"\t"+(h+37)+"\t"+(h+1));
      }
            //4   0  36  37  1
            //4   1  37  38  2
            //. . .
            //4  35  71  72  36  
      //output.println("4\t"+h+"\t"+(36+h)+"\t"+(37+h)+"\t"+(h+1)%36);
      //output.println("4\t"+h+"\t"+(36+h)+"\t"+(37+h)+"\t"+(h+1));
    }//end-for-h
  }//end-for-k
 
 
  output.flush();
  output.close();
  println("Finalizado! O arquivo 'coordenadas.txt' foi criado.");
 
  //yt=60.0; // altura Y
  //for (float t=0.0;t<=6.28;t+=0.1745) {
    //xt = 245*cos(t);
    //zt = 245*sin(t);
    //println(xt+"\t"+yt+"\t"+zt);
  //}
 
  exit();
}
