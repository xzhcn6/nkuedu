package nku.core.controller;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nku.core.common.VerifyCodeConstants;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/verifyCode")
public class VerifyCodeController {
	
	private String text = "";
	
	private byte[] bytes = null;
	
	/*
	 * 生成长度为4的随机字符串
	 */
    private void generateText(){
    	char[] source = new char[4];
    	for(int i=0; i<source.length; i++){
    		source[i] = VerifyCodeConstants.source[VerifyCodeConstants.rdm.nextInt(VerifyCodeConstants.source.length)];
    	}
    	this.text = new String(source);
    }
    
    /*
     * 在内存中生成打印了随机字符串的图片
     * @return 在内存中创建的打印了字符串的图片
     */
    private BufferedImage createImage(){
    	int width = 50;
    	int height = 20;

    	BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
    	Graphics g = image.getGraphics();
    	g.setColor(Color.LIGHT_GRAY);
    	g.fillRect(0, 0, width, height);
    	g.setFont(VerifyCodeConstants.font);
    	for(int i=0; i<this.text.length(); i++){
    		g.setColor(VerifyCodeConstants.colors[VerifyCodeConstants.rdm.nextInt(VerifyCodeConstants.colors.length)]);
    		g.drawString(this.text.substring(i, i+1), 3 + i*12, 16);
    	}
    	g.dispose();
    	return image;
    }
    
    /*
     * 根据图片创建字节数组
     * @param image 用于创建字节数组的图片
     */
    private void generatorImageBytes(BufferedImage image){
    	ByteArrayOutputStream bos = new ByteArrayOutputStream();
    	try{
    		javax.imageio.ImageIO.write(image, "jpg", bos);
    		this.bytes = bos.toByteArray();
    	}catch(Exception ex){
    		ex.printStackTrace();
    	}finally{
    		try{
    			bos.close();
    		}catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    }
    
    /*
	 * 生成验证码
	 */
	@RequestMapping(value = "/code")
	public void code(HttpServletRequest request, HttpServletResponse response) throws IOException {
		this.generateText();
		// 将四位数字的验证码保存到Session中
		HttpSession session = request.getSession();
		session.setAttribute(VerifyCodeConstants.SessionName, text);
		BufferedImage image = this.createImage();
		
	    this.generatorImageBytes(image);
	    // 禁止图像缓存
	    response.setHeader("Pragma", "no-cache");
	    response.setHeader("Cache-Control", "no-cache");
	    response.setDateHeader("Expires", 0);

	    response.setContentType("image/jpeg");

	    // 将图像输出到Servlet输出流中
	    ServletOutputStream sos = response.getOutputStream();
	    ImageIO.write(image, "jpeg", sos);
	    sos.close();
	}
    
}
