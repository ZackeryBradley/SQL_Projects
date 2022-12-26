#The_Snake_Game

###################################
#TODOS#
#1. Create  a snake body
#2. Move the snake
#3. Create snake food
#4. Detect collision with food
#5. create a scoreboard
#6. Detect collision with wall
#7. Detect collision with tail

###################################


###################################
#IMPORTING PACKAGES
from turtle import Screen
import time 
from snake_1 import Snake
from food import Food
from scoreboard import Scoreboard
# from snake import Snake

# from Day_20 import Snake
# from Python_Projects import Snake
###################################
screen = Screen()
#adjusting height for screen
screen.setup(width = 600, height = 600)
#creating a black screen
screen.bgcolor("black")
#creating a game title
screen.title("The Snake Game")
#turning the tracer off
screen.tracer(0)

snake = Snake()
food = Food()
scoreboard = Scoreboard()

screen.listen()
screen.onkey(snake.up,"Up")
screen.onkey(snake.down,"Down")
screen.onkey(snake.left, "Left")
screen.onkey(snake.right, "Right")


###################################


#1. Create  a snake body
###################################
#creating a square shape
# segment_1 = Turtle(shape = "square")
# #changing the square color to white
# segment_1.color("white")


# segment_2 = Turtle(shape = "square")
# segment_2.color("white")
# #changing the position of segment two so it doesn't appear on top of segment one
# segment_2.goto(-20, 0)


# segment_3 = Turtle(shape = "square")
# segment_3.color("white")
# #changing the position of segment three so it doesn't appear on top of segment one or 2
# segment_3.goto(-40, 0)

#we could have also created this using a for list, like this:

# starting_positions = [(0, 0), (-20, 0), (-40, 0)]
# segments = []
# for position in starting_positions:
#     new_segment = Turtle(shape = "square")
#     new_segment.color("white")
#     new_segment.penup()
#     new_segment.goto(position)
#     segments.append(new_segment)


###################################

#2. Move the snake
###################################
game_is_on = True
while game_is_on:
#updating the screen
    screen.update()
#adding a 0.1 second delay
    time.sleep(0.1)
    snake.move()
#visualizing the code via titles
    # for seg_num in range(start = 2,stop = 0, step = -1)
    # for seg_num in range(len(segments) - 1, 0, -1):
    #     new_x = segments[seg_num - 1].xcor()
    #     new_y = segments[seg_num - 1].ycor()
    #     segments[seg_num].goto(new_x, new_y)
    # segments[0].forward(20)


#DETECTING COLLISION WITH FOOD
    if snake.head.distance(food) < 15:
        food.refresh()
        snake.extend()
        scoreboard.increase_score()
        # print("nom nom nom")

#detecting collisions with wall
    if snake.head.xcor() > 280 or snake.head.xcor() < -280 or snake.head.ycor() > 280 or snake.head.ycor() > 280 or snake.head.ycor() < -280:
        game_is_on = False
        scoreboard.game_over()        

#detect collision with tail
    #if head collides with any segment in the tail:
    # #trigger game_over
    for segment in snake.segments:
        if segment == snake.head:
            pass
        elif snake.head.distance(segment) < 10:
            game_is_on = False
            scoreboard.game_over()


#     for seg in segments():
#         seg.forward(20)
# #getting the snake to turn
#     segments[0].left(90)






###################################
###################################
###################################
###################################
###################################
###################################
###################################
###################################
###################################
###################################
###################################
###################################
###################################











screen.exitonclick()