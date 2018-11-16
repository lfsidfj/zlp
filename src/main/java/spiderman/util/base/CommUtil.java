package spiderman.util.base;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 * 通用工具
 */
public class CommUtil {

	public static void main(String[] args) {
        BigDecimal decimal = new BigDecimal("1.12345");
        System.out.println(decimal);
        BigDecimal setScale = decimal.setScale(4,BigDecimal.ROUND_HALF_DOWN);
        System.out.println(setScale);

        BigDecimal setScale1 = decimal.setScale(4,BigDecimal.ROUND_HALF_UP);
        System.out.println(setScale1);

        BigDecimal setScale2 = decimal.setScale(4,BigDecimal.ROUND_UP);
        System.out.println(setScale2);

        BigDecimal setScale3 = decimal.setScale(4,BigDecimal.ROUND_DOWN);
        System.out.println(setScale3);
    }
    public static double div(Object a, Object b){
        double ret = 0.0D;
        if ((!null2String(a).equals("")) && (!null2String(b).equals(""))){
            BigDecimal e = new BigDecimal(null2String(a));
            BigDecimal f = new BigDecimal(null2String(b));
            if (null2Double(f) > 0.0D)
                ret = e.divide(f, 3, 1).doubleValue();
        }
        DecimalFormat df = new DecimalFormat("0.00");

        return Double.valueOf(df.format(ret)).doubleValue();
    }

    public static double subtract(Object a, Object b){
        double ret = 0.0D;
        BigDecimal e = new BigDecimal(null2Double(a));
        BigDecimal f = new BigDecimal(null2Double(b));
        ret = e.subtract(f).doubleValue();
        DecimalFormat df = new DecimalFormat("0.00");

        return Double.valueOf(df.format(ret)).doubleValue();
    }

    public static double add(Object a, Object b){
        double ret = 0.0D;
        BigDecimal e = new BigDecimal(null2Double(a));
        BigDecimal f = new BigDecimal(null2Double(b));
        ret = e.add(f).doubleValue();
        DecimalFormat df = new DecimalFormat("0.00");

        return Double.valueOf(df.format(ret)).doubleValue();
    }

    public static double mul(Object a, Object b){
        BigDecimal e = new BigDecimal(null2Double(a));
        BigDecimal f = new BigDecimal(null2Double(b));
        double ret = e.multiply(f).doubleValue();
        DecimalFormat df = new DecimalFormat("0.00");

        return Double.valueOf(df.format(ret)).doubleValue();
    }

    public static double formatMoney(Object money){
        DecimalFormat df = new DecimalFormat("0.00");

        return Double.valueOf(df.format(money)).doubleValue();
    }
    public static Double format(Double num){
		BigDecimal b=new BigDecimal(num);
		Double d=b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		 return d;
	}
	public static Float format(Float num){
		 BigDecimal b=new BigDecimal(num);
		 Float f=b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
		 return f;
	}
    public static String null2String(Object s){
        return s == null ? "" : s.toString().trim();
    }
    public static double null2Double(Object s){
        double v = 0.0D;
        if (s != null)
            try {
                v = Double.parseDouble(null2String(s));
            } catch (Exception localException){
            }

        return v;
    }
}
