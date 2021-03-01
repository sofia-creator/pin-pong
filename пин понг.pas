uses GraphABC,Timers;
var
w1,w2,y,h1,h2,z,a,b,c,s,time,dt,g1,g2:integer;
PicArr: array [1..4] of Picture;

procedure okno;
begin
PicArr[4].Draw (0,0,700,500);//поле
end;

//ракетки
procedure raketki;
begin
PicArr[1].Draw (0,0-z,w1,h1);
PicArr[2].Draw (700-w2,0-y,w2,h2);
Redraw();
end;

//управление рактками
procedure movement(key:integer);
begin
case key of
VK_Up:if y<0 then y:=y+25;
VK_Down:if Y>-400 then y:=y-25;
VK_W:if z<0 then z:=z+25;
VK_S:if z>-400 then z:=z-25;
end;
end;

//мяч
procedure boll;
begin
PicArr[3].Draw (a-15,b-15,30,30);
end;


procedure draw;
begin
begin
boll;
raketki;
okno;
a:=a+c;
b:=b+s;
end;
begin
if (a>=700-35)or(a<=35)then
if ((b>=5-y) and (b<=h2-y)) or ((b>=5-z) and (b<=h1-z))then
c:=-c
else
begin
if a>700-35 then
  g1:=g1+1;
if a<0+35 then
  g2:=g2+1;
a:=350;
b:=100;
end;
if ((b)>485) or ((b)<15) then
s:=-s;
end;
setfontsize(30);
Textout (363,10,g2);
Textout (320,10,g1);
end;


procedure Update;
begin
lockdrawing;
while true do 
begin
time:=milliseconds-dt;
dt:=milliseconds;
time:=60;
// начало
onkeydown:= movement;
Draw;

end;
end; 


begin
SetWindowSize(700,500);//окно


PicArr[1]:=Picture.Create('blue.png');
PicArr[2]:=Picture.Create('red.png');
PicArr[3]:=Picture.Create('ball.png');
PicArr[4]:=Picture.Create('pole.png');
w1:=20;
w2:=20;
h1:=100;
h2:=100;
y:=0;
a:=350;
b:=100;
c:=2;
s:=2;
draw;
LockDrawing();
Update;
onkeydown:= movement;
end.