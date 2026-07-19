-- title:   pong
-- author:  AYEREN

x = 5
y = 45
w = 4
h = 40
x2 = 231
y2 = 45
w2 = 4
h2 = 40
ball_x = 120
ball_y = 60
ball_size = 4
ball_dx = 1
ball_dy = 1
speed = 1.5
ball_speed_inc= 0.
speed_now = speed
game_state = "playing"
score = 0

function reset_game()
 x = 3
 y = 45
 w = 4
 h = 40
 x2 = 231
 y2 = 45
 w2 = 4
 h2 = 40
 ball_x = 120
 ball_y = 60
 ball_dx = 1
 ball_dy = 1
 game_state = "playing"
 score = 0
end

function TIC()
 cls()
 
 rect(0, 0, 240, 1, 12)
 rect(0, 135, 240, 1, 12)
 rect(0, 0, 1, 145, 12)
 rect(239, 0, 1, 240, 12)
 if  game_state=="playing" then
 ball_x = ball_x - ball_dx
 ball_y = ball_y - ball_dy
 ball_l = ball_x
 ball_r = ball_x+ball_size
 ball_t = ball_y
 ball_b = ball_y+ball_size
 player_l = x
 player_r = x+w
 player_t = y
 player_b = y+h
 p2_l = x2
 p2_r = x2+w2
 p2_t = y2
 p2_b = y2+h2
 p2_c = y2+h2/2
 ball_c = ball_y +ball_size/2
 
 if btn(0) then
  y= y-speed_now
 end
 if btn(1) then
  y= y+speed_now
 end

 if ball_c > p2_c then
  y2 = y2+speed_now 
  end
 if ball_c < p2_c then
  y2 = y2-speed_now 
 end
 
 if y< -h then
  y= 141
 end
 if y>141 then
  y= -h
 end
  
 if y2 < 0 then
  y2 = y2+speed_now
 end
 if p2_b > 135 then
  y2 = y2-speed_now
 end

 if ball_y< 0 then
  ball_dy= -ball_dy
 end
 if ball_y+ball_size> 135 then
  ball_dy= -ball_dy
 end
 if ball_x< 0 then
  game_state = "game_over"
 end
 if ball_x+ball_size> 240 then
  ball_dx= -ball_dx
 end
 
 if player_r > ball_l and 
  ball_r > player_l and 
  player_b > ball_t and 
  ball_b > player_t then
   ball_x = player_r
   ball_dx = -ball_dx
   score = score + 1
   ball_dx = ball_dx +ball_speed_inc
   ball_dy = ball_dy +ball_speed_inc
 end
  
 if p2_r > ball_l and 
  ball_r > p2_l and 
  p2_b > ball_t and 
  ball_b > p2_t then
   ball_x = p2_l-ball_size
   ball_dx = -ball_dx
 end

 print(x, 200, 3)
 print(y, 200, 10)
 rect(x, y, w, h, 12)
 rect(x2, y2, w2, h2, 12)
 rect(ball_x, ball_y, ball_size, ball_size, 9)
 print("SCORE=", 3, 3, 3)
 print(score, 38, 3, 3)
 for i=0, 16 do
  rect(119, i*8, 1, 4, 12)
 end
 
 if btn(4) then
  rect(x, y, w, h, 3)
  speed_now = speed*2
 else
  speed_now = speed
 end
  
 else
 print("GAME OVER", 65, 50, 10, false, 2)
 print("CLOSE THE WINDOW TO QUIT", 65, 70, 10, false, 1)
 print("PRESS 'Z' TO RESTART", 65, 78, 10, false, 1)
 print("SCORE=", 65, 86,10) 
 print(score, 100, 86, 3) 
 if btn(4) then
  reset_game()
 end
 end
 
end
