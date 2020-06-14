using Dates
import Dates

function initialise_game(self)
self.current_state = [['.','.','.'],['.','.','.']]
#first player
self.player_turn = 'A'

function draw_card(self)
for i in 0:3
for j in 0:3
print(' {} | ' .format(self.current_state[i][j]), done=" ")
print()
print()

# determines if the made move is valid 
function valid_move(self, player_a, player_b)

if player_a < 0 or player_a > 2 or player_b < 0 or player_b > 2
return False
elseif self.current_state[player_a][player_b] != ' . '
return False
else
return True

# checks if the game has ended
function game_done(self)

# returns vertical case win
for i in 0:3
if (self.current_state[0][i] != ' . ' 
and
self.current_state[0][i] == self.current_state[1][i] 
and
self.current_state[1][i] ==self.current_state[2][i])
return self.current_state[0][i]

# return horizontal case win
for i in 0:3
if (self.current_state[i] == ['A' , 'A' , 'A'])
return 'A'
elseif (self.current_state[i] == ['0' , '0', '0'])
return '0'

# first diagonal case win
if (self.current_state[0][0] != '.' 
and
self.current_state[0][0] == self.current_state[1][1] 
and
self.current_state[0][0] == self.current_state[2][2])
return self.current_state[0][0]

# Second diagonal case win
if (self.current_state[0][2] != '.' 
and
self.current_state[0][2] == self.current_state[1][1] 
and
self.current_state[0][2] == self.current_state[2][0])
return self.current_state[0][2]

for i in 0:3
for j in 0:3
          
if (self.current_state[i][j] == '.')
return None
return '.'

# Assigning multiple initial values of Alpha and Beta to max and min variables
max, min = 1000, -1000

# Returning optimal value for current player
function minimax(self, depth, nodeIndex, maximisingPlayer, values, alpha, beta)

maxValue = -2
player_a = None
player_b = None
result = self.is_done()

if result == 'A'
return (-1, 0, 0)
elseif result == '0'
return (1, 0, 0)
elseif result == '.'
return (0, 0, 0)

for i in 0: 3
for j in 0:3
if self.current_state[i][j] == '.'
elf.current_state[i][j] = '0'
(m, min_i, in_j) = self.min_alpha_beta(alpha, beta)

if m > maxValue
maxValue = m
player_a = i
player_b = j
self.current_state[i][j] = '.'
if maxValue >= beta
return (maxValue, player_a, player_b)
if maxValue> alpha
alpha = maxValue
return (maxValue, player_a, player_b)

# Conditional evaluation
if depth == 3
return values[nodeIndex]

elseif maximisingPlayer
best = min
end
for i in 0:3
for j in 0:3
val = minimax(depth + 1, nodeIndex * 2 + i, values, alpha, beta)
best = max(best, val)
alpha = max(alpha, best)

while false

# Alpha Beta Pruning
if beta <= alpha
break
end
return best
end

else

best = max
for i in 0:3
for j in 0:3
val = minimax(depth + 1, nodeIndex * 2 + i, values, alpha, beta)
best = min(best, val)
alpha = min(alpha, best)

while true

# Alpha Beta Pruning
if beta <= alpha
break
end
return best
end

function play_ab(self)
while True

self.drawCard()
self.result = self.is_done()
end

if self.result != None
if self.result == 'A'
print('The winner is A')
elseif self.result == '0'
print('The winner is 0')
elseif self.result == '.'
print("It's a reapt")
end
end

self.initialise_game()
return

if self.player_turn == 'A'
end

while True

start = time.time()
(m, team_a, team_b) = self.min_alpha_beta(-2, 2)
done = time.time()
print('Evaluation time: {}s'.format(round(done - start, 7)))
print('Recommended move: A = {}, B = {}'.format(team_a, team_b))
end

player_a = int(input('Insert the A coordinate: '))
player_b = int(input('Insert the B coordinate: '))

team_a = player_a
team_b = player_b
if self.valid_move(player_a, player_b)
self.current_state[player_a][player_b] = 'A'
self.player_turn = '0'
break

end

else
print('The move is not valid! Try again.')

else
(m, player_a, player_b) = self.max_alpha_beta(-2, 2)
self.current_state[player_a][player_b] = '0'
self.player_turn = 'A'
end
end

if name == "main"
values = [0, 2, 3, 1, -2, 4]
print("The Final Result is :", minimax(0, 0, true, values, min, max))
