var x=10, y=10; 	//variabili che indicano la posizione del bambino
var dir = 0;			//var per la direzione da assumere
var cambioDir;      //var per il cambio della direzione

var dir1 = [-1,-1,0,+1,+1,+1,0,-1];		//vettori per le direzioni
var dir2 = [0,+1,+1,+1,0,-1,-1,-1];

var JsonDir;


f = function() 
{
		do{
			//cambio di direzione casuale
			cambioDir = Math.floor(Math.random() * 101);
			
			if(cambioDir < 20)	//20 equivale alla probabilità del cambio di direzione
			{
				dir = Math.floor(Math.random() * 8);
			}
			
			x += dir1[dir];
			y += dir2[dir];
			
			if(x < 0)
			{
				x++;
			}
			if(y < 0)
			{
				y++;
			}
			if(x > 21)
			{
				x--;
			}
			if(y > 45)
			{
				y--;
			}
		}while(x < 0 || y < 0 || x > 21 || y > 45);
	
	
	JsonDir = {
		"x": x,
		"y": y
	}
	
	postMessage(JsonDir);
	
	setTimeout(f, 200);	//millisecondi ogni quanto vieni modificata la posizione del bambino
}

f();