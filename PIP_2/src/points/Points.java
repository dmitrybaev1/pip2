package points;
import java.lang.reflect.Array;
import java.util.ArrayList;

public class Points {
    private ArrayList<Double> listX=new ArrayList<Double>();
    private ArrayList<Double> listY=new ArrayList<Double>();
    private ArrayList<Integer> listR=new ArrayList<Integer>();
    private ArrayList<String> listRes=new ArrayList<String>();
    public Points(){

    }
    public void setX(double x){
        this.listX.add(x);
    }
    public void setY(double y){
        this.listY.add(y);
    }
    public ArrayList<Double> getX(){
        return listX;
    }
    public ArrayList<Double> getY(){
        return listY;
    }
    public void setR(int r){
        this.listR.add(r);
    }
    public ArrayList<Integer> getR(){
        return listR;
    }
    public ArrayList<String> getRes(){
        return listRes;
    }
    public void setResult(String result){
        this.listRes.add(result);
    }
}
