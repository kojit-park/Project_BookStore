<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src ="<c:url value='/resources/js/anime.2.2.0.js' />"></script>
<script>
var randum = 0;
var enemy = 1;
var enemyAtk = ${mini2.atk};
var enemyDef = ${mini2.def};
var enemyHp = ${mini2.hp};
var myAtk = ${mini1.atk};
var myDef = ${mini1.def};
var myHp = ${mini1.hp};
var time = new Date();
var eimg = document.getElementById("enemyImg")

var drawing1 = document.getElementById("healthBar"); 
var drawing2 = document.getElementById("enemyHealthBar"); 
	
var context = drawing1.getContext("2d"); 
var context2 = drawing2.getContext("2d"); 

var countDown = 7;
var counter = setInterval("stopwatch()",1000);

var ActionReminder = "";

context.globalCompositeOperation = "copy";
context2.globalCompositeOperation = "copy";

window.onload=function(){
	
	function fullHealth(){
		var description =	"회피 < 공격 < 방어 < 강공격 < 회피 \n\n"
		description +="회피 = 흔들림 \n"
		description +="공격 = 내쪽으로 날아옴 \n"
		description +="방어 = 둥글어짐 \n"
		description +="강공격 = 위로 점프함 \n"
		
		alert(description)
		
		context2.fillStyle = "#ff0000"; 
		context2.strokeStyle = "#000000"
		context2.fillRect(0, 0, (enemyHp), 20);
		context.fillStyle = "#ff0000"; 
		context.fillRect(0, 0, myHp, 20);
		
	}
	fullHealth()
}



window.onkeydown = function(){
	if(event.keyCode == 81 || event.keyCode == 113){
		ActionReminder = "atk";
	}
	if(event.keyCode == 87 || event.keyCode == 119){
		ActionReminder = "smash";
	}
	if(event.keyCode == 69 || event.keyCode == 101){
		ActionReminder = "parring";
	}
	if(event.keyCode == 82 || event.keyCode == 114){
		ActionReminder = "avoid";
	}
	if(event.keyCode == 32){
		alert("일시 정지");
	}
	
}
	
	function stopwatch(){
		countDown--;
		
		if(countDown == 3){
			enemy = Math.floor(Math.random()*4+1)
			eimg.src = "${pageContext.request.contextPath}/resources/Img/Char/${mini2.property}_"+enemy+".gif";
			switch(enemy){
			case 1:
				
				var Eatk_ani = anime({
					targets:"#enemyImg",
					autoplay:true,
					translateX:-150,
					scale: 1.5,
					rotate:'1turn'
				})
				
				break;
			case 2:
				var Esmash_ani = anime({
					targets:"#enemyImg",
					autoplay:true,
					translateY:-100,
					scale: 1.5
				})
				
				break;
			case 3:
				var Edef_ani = anime({
					targets: "#enemyImg",
					borderRadius:'50%',
					autoplay:true
				})
				
				break;
			case 4:
				var Eavoid_ani = anime({
					targets: "#enemyImg",
					translateX: [-30,70],
					delay: 100,
					derection:'alternative',
					autoplay:true
				})
				
				break;
			}			
		}
		
		if(countDown == 2){
			if(ActionReminder == "" || ActionReminder == null || ActionReminder == "atk"){
				ActionReminder = "atk";
				DoAction("atk");
			}else if(ActionReminder == "smash"){
				DoAction("smash");
			}else if(ActionReminder == "parring"){
				DoAction("parring");
			}else if(ActionReminder == "avoid"){
				DoAction("avoid");
			}
			
		}
		
		if(countDown == 0){
			eimg.src = "${pageContext.request.contextPath}/resources/Img/Char/${mini2.property}.jpg";
			switch(enemy){
				case 1:
					var Eatk_ani = anime({
						targets:"#enemyImg",
						autoplay:true,
						translateX:0,
						scale: 1,
						rotate:'1turn'
					})
					
					break;
				case 2:
					var Esmash_ani = anime({
						targets:"#enemyImg",
						autoplay:true,
						translateY:0,
						scale: 1
					})
					
					break;
				case 3:
					var Edef_ani = anime({
						targets: "#enemyImg",
						borderRadius:["50%","0%"],
						autoplay:true
					})
					
					break;
				case 4:
					var Eavoid_ani = anime({
						targets: "#enemyImg",
						translateX: 0,
						autoplay:true
					})
					
					break;
				}
			
			switch(ActionReminder){
				case "":
				case "atk":
					var atk_ani = anime({
						targets:"#myImg",
						autoplay:true,
						translateX:0,
						scale: 1,
						rotate:'1turn'
					})
					
					break;
				case "smash":
					var smash_ani = anime({
						targets:"#myImg",
						autoplay:true,
						translateY:0,
						scale: 1
						})
						
					break;
				case "parring":
					var def_ani = anime({
						targets: "#myImg",
						borderRadius:["50%","0%"],
						autoplay:true
					})
					break;
				case "avoid":
					var avoid_ani = anime({
						targets: "#myImg",
						translateX: 0,
						autoplay:true
					})
					break;
			
			}
			
			endChk();
		}
		
		document.getElementById("stopwatch").innerHTML = "<h1>"+(countDown-2)+"초</h1>";
	}
	
	function ActionTeacher(action){
		ActionReminder = action;
	}
	
	function DoAction(action){
		randum = Math.random()*10;
		Enemy_crt = (randum < ${mini2.crt}) ? (enemyAtk *2):enemyAtk;
		my_crt = (randum < ${mini1.crt}) ? (myAtk *2):myAtk;
		//alert("내공격"+my_crt+"상대 공격: "+enemy+"번//"+Enemy_crt)	
		
		switch(action){
		
			case "":
			case "atk":
				var atk_ani = anime({
					targets:"#myImg",
					autoplay:true,
					translateX:100,
					scale: 1.5,
					rotate:'1turn'
				})
				
				switch(enemy){
					case 1:
						enemyHp -=(my_crt-enemyDef)
						myHp -=(Enemy_crt-myDef)
						break;
					case 2:
						enemyHp -=my_crt
						if(enemyHp <0) break;
						myHp -= (Enemy_crt*2)
						break;
					case 3:
						if(enemyHp <=${mini2.hp}*0.5){
							myHp -= Enemy_crt * 4
							break;
						}
						enemyAtk +=10
						enemyHp -= (my_crt - enemyDef*2)
						break;
					case 4:
						enemyHp -= my_crt
						enemyAtk += 40
						break;
					}
				break;
			
		case "smash":
			
			var smash_ani = anime({
				targets:"#myImg",
				autoplay:true,
				translateY:-100,
				scale: 1.5
				})
				
			switch(enemy){
				case 1:
					myHp -= Enemy_crt
					if(myHp <0) break;
					enemyHp -= my_crt*2
					break;
				case 2:
					enemyHp -= my_crt*2
					myHp -= Enemy_crt*2
					break;
				case 3:
					enemyHp -= my_crt*2
					enemyAtk +=10
					break;
				case 4:
					enemyAtk += 40
					break;
				}
			break;
			
		case "parring":
			
			var def_ani = anime({
				targets: "#myImg",
				borderRadius:'50%',
				autoplay:true
			})
			
			myAtk +=10
			switch(enemy){
				case 1:
					if(myHp <=${mini1.hp}*0.5){
						enemyHp -= my_crt * 4
						break;
					}
					myHp -= (Enemy_crt-myDef*2)
					break;
				case 2:
					myHp -= Enemy_crt*2
					break;
				case 3:
					enemyAtk +=10
					break;
				case 4:
					enemyAtk += 40
					break;
				}
			
			break;
			
		case "avoid":
	
			var avoid_ani = anime({
				targets: "#myImg",
				translateX: [-30,50],
				autoplay:true
			})
			
			myAtk +=40
			switch(enemy){
				case 1:
					myHp -= Enemy_crt
					break;
				case 2:
					break;
				case 3:
					enemyAtk +=10
					break;
				case 4:
					enemyAtk += 40
					break;
				}
			
			break;
		}
		
	}
	
	function endChk(){
		
		context2.fillStyle = "#ff0000"; 
		context2.fillRect(0, 0, enemyHp, 20);
		context.fillStyle = "#ff0000"; 
		context.fillRect(0, 0, myHp, 20);
		
		//alert("myHp"+myHp+"::::상대 Hp"+enemyHp)
		
		if(myHp < (${mini1.hp}/2)){
			document.getElementById("parring").innerHTML = "패링 Ee";
		}
		
			document.getElementById("enemyHealth").innerHTML = enemyHp;
			document.getElementById("health").innerHTML = myHp;
			
			document.getElementById("stats").innerHTML = "Hp::"+myHp+"//Atk::"+myAtk +"//Def::"+myDef+"//Crt::"+${mini1.crt}*100+"%" ;
			document.getElementById("enemyStats").innerHTML = "Hp::"+enemyHp+"//Atk::"+enemyAtk +"//Def::"+enemyDef+"//Crt::"+${mini2.crt}*100+"%"; 
			
			countDown = 7;
		
		if(myHp<0 && enemyHp<0){
			alert("무승부");
			location.href = "mini_detail.bs?ISBN="+${mini1.ISBN}+"&result=2";
			countDown = 70;
		}
		else if(myHp<0){
			alert("enemy win");
			var EWinning_ani = anime({
				targets: "#enemyImg",
				translateY: [0,70],
				delay: 100,
				derection:'alternative',
				scale: 2.5,
				autoplay:true
			})
			var Losing_ani = anime({
				targets: "#myImg",
				translateX: -300,
				autoplay:true
			})
			location.href = "mini_detail.bs?ISBN="+${mini2.ISBN}+"&result=0";
			countDown = 70;
		}else if(enemyHp<0){
			alert("I win");
			var Winning_ani = anime({
				targets: "#myImg",
				translateY: [0,70],
				scale: 2.5,
				delay: 10,
				autoplay:true
			})
			var ELosing_ani = anime({
				targets: "#enemyImg",
				translateX: 300,
				autoplay:true
			})
			location.href = "mini_detail.bs?ISBN="+${mini1.ISBN}+"&result=1";
			countDown = 70;
		}
		
	}

</script>