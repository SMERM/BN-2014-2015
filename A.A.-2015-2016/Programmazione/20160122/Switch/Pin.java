import cc.arduino.*;

class Pin{
    
    public int lastValue;
    public String tag;
    public Arduino ard;
    
    Pin(String type, int num, Arduino a){
        tag=type+(String)num;
        ard=a;
    }
    
    boolean hasChanged(){
        
    }
    
    int value(){
        int res;
        //code
        res = hasChanged() ? (lastValue = v):lastValue;
        return res;
    }
}