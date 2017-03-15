package com.ym.er.util;

import java.util.Random;

/**
 * Created by YM on 3/10/2017.
 */
public class IDUtils {

    /**
     * 图片名生成
     * 去当前时间的毫秒数并 在开头和结尾处分别添加三位随机数
     */
    public static String genImageName() {
        //取当前时间的长整形值包含毫秒
        long millis = System.currentTimeMillis();
        //long millis = System.nanoTime();
        //加上三位随机数
        Random random = new Random();
        int begin=random.nextInt(999);
        int end = random.nextInt(999);

        //如果不足三位前面补0
        String str = String.format("%03d", begin)+millis + String.format("%03d",end);

        return str;
    }

}
