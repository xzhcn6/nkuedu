package nku.core.common;

import java.awt.Color;
import java.awt.Font;
import java.util.Random;

public class VerifyCodeConstants {

	/*
     * 验证码对应的Session名
     */
    public static final String SessionName = "image";//"CheckCodeImageAction";

    /*
     * 用于随机生成验证码的数据源
     */
    public static final char[] source = new char[]{
       'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
       'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
       'U', 'V', 'W', 'X', 'Y', 'Z',
       '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
    };

    /*
     * 用于随机打印验证码的字符颜色
     */
    public static final Color[] colors = new Color[]{
       Color.RED, Color.BLUE, Color.BLACK
    };

    /*
     * 用于打印验证码的字体
     */
    public static final Font font = new Font("宋体", Font.PLAIN, 15);

    /*
     * 用于生成随机数的随机数生成器
     */
    public static final Random rdm = new Random();
}
