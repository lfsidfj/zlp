package spiderman.test;

public class TRest implements Runnable{
	    static int i=0;

	    /**
	     * 作用于静态方法,锁是当前class对象,也就是
	     * AccountingSyncClass类对应的class对象
	     */
	    public static synchronized void increase(){
	        i++;
	    }

	    /**
	     * 非静态,访问时锁不一样不会发生互斥
	     */
	    public synchronized void increase4Obj(){
	        i++;
	    }

	    @Override
	    public void run() {
	        for(int j=0;j<1000000;j++){
	        	increase();
	        }
	    }
	    public static void main(String[] args) throws InterruptedException {
	    	/*TRest tRest = new TRest();
	    	//new新实例
	        Thread t1=new Thread(tRest);
	        //new心事了
	        Thread t2=new Thread(tRest);
	        //启动线程
	        t1.start();
	        t1.join();
	        t2.start();
	        
	        System.out.println(i);*/
	    	String format = String.format("%.2f",
					(Object)"0");
	    	System.out.println(format);
	    }
}
