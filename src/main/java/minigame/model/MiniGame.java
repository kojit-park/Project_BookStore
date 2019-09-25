package minigame.model;

import java.text.DecimalFormat;
import java.util.Collections;
import java.util.Stack;


public class MiniGame {
	
	private int hp;
	private int atk;
	private int def;
	private double crt;
	private int property;
	private String title;
	private String ISBN;
	
	public MiniGame(String title,String ISBN) {
		super();
		String material = ISBN.substring(3);
		String[] splited = material.split("");
		
		Stack<String> stack = new Stack<String>();
		for(String str: splited) {
			stack.add(str);
		}
		Collections.shuffle(stack);
		
		int param = Integer.parseInt(stack.pop()+stack.pop());
		hp = (param > 50) ? param *4+1 : (param + 100)*2+1;
		
		param = Integer.parseInt(stack.pop()+stack.pop());
		atk = (param > 40) ? param +50 : param + 100;
		
		param = Integer.parseInt(stack.pop()+stack.pop());
		def = (param > 50) ? param /2 : param;
		
		DecimalFormat format = new DecimalFormat();
		crt = Integer.parseInt(stack.pop()+stack.pop())/100.0;
		format.applyLocalizedPattern("0.00");
		crt = Double.parseDouble(format.format(crt));
		
		property = Integer.parseInt(stack.pop())%3;
		
		this.title = title;
		this.ISBN = ISBN;
	}
	
	
	public int getHp() {
		return hp;
	}
	public int getAtk() {
		return atk;
	}
	public int getDef() {
		return def;
	}
	public double getCrt() {
		return crt;
	}
	public int getProperty() {
		return property;
	}

	public String getTitle() {
		return title;
	}
	public String getISBN() {
		return ISBN;
	}
	
	
}
