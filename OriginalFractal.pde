void setup(){
  size(2000,2000);
}
public String regularPaperFold(int numFolds) {
  if(numFolds==1)
    return "1";
  return regularPaperFold(numFolds-1)+"1"+onesComplement(regularPaperFold(numFolds-1));
}
public String onesComplement(String s){
  String t="";
  for(int i=s.length()-1;i>=0;i--){
    if(s.charAt(i)=='1')
      t=t+"0";
    else
    t=t+"1";
  }
  return t;
}
int m=16;
String x=regularPaperFold(m);
{


}
void draw(){
  System.out.println(x);
int[][] a= new int[(int)Math.pow(2,m)][2];
int nicholas=1;
 a[0][0]=0;
 a[0][1]=0;
 a[1][0]=0;
 a[1][1]=nicholas;
for(int i=2;i<x.length();i++){
  if(x.charAt(i)=='0'){
    if(a[i-1][0]-a[i-2][0]==nicholas){
      a[i][0]=a[i-1][0];
      a[i][1]=a[i-1][1]-nicholas;
    }
    if(a[i-1][0]-a[i-2][0]==-1*nicholas){
      a[i][0]=a[i-1][0];
      a[i][1]=a[i-1][1]+nicholas;
    }
    if(a[i-1][1]-a[i-2][1]==nicholas){
      a[i][0]=a[i-1][0]+nicholas;
      a[i][1]=a[i-1][1];
    }
    if(a[i-1][1]-a[i-2][1]==-1*nicholas){
      a[i][0]=a[i-1][0]-nicholas;
      a[i][1]=a[i-1][1];
    }
    
  }
  else{
    if(a[i-1][0]-a[i-2][0]==nicholas){
      a[i][0]=a[i-1][0];
      a[i][1]=a[i-1][1]+nicholas;
    }
    if(a[i-1][0]-a[i-2][0]==-1*nicholas){
      a[i][0]=a[i-1][0];
      a[i][1]=a[i-1][1]-nicholas;
    }
    if(a[i-1][1]-a[i-2][1]==nicholas){
      a[i][0]=a[i-1][0]-nicholas;
      a[i][1]=a[i-1][1];
    }
    if(a[i-1][1]-a[i-2][1]==-1*nicholas){
      a[i][0]=a[i-1][0]+nicholas;
      a[i][1]=a[i-1][1];
    }
    
  }
  
}
for(int i=0;i<100;i++){
 System.out.println(a[i][0]);
 System.out.println(a[i][1]);
}
int xmin=10000;
int ymin=10000;
for(int i=0;i<Math.pow(2,m);i++){
 xmin=min(xmin,a[i][0]);
 ymin=min(ymin,a[i][1]);
}
  for(int i=1;i<Math.pow(2,m)-1;i++){
 line(a[i][0]-xmin,a[i][1]-ymin,a[i-1][0]-xmin,a[i-1][1]-ymin);
}
}
