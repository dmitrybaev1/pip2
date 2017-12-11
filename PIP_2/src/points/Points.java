package points;
import java.lang.reflect.Array;
public class Points {
    private double listX=0;
    private double listY=0;
    private int listR=0;
    private double listRes=0;
    public Points(){

    }
    public void setX(double x){
        this.listX=x;
    }
    public void setY(double y){
        this.listX=y;
    }
    public double getX(){
        return listX;
    }
    public double getY(){
        return listY;
    }
    public void setR(int r){
        this.listR=r;
    }
    public int getR(){
        return listR;
    }
    public double getRes(){
        return listRes;
    }
}
