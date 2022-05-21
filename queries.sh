#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.
#done
echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"
#done
echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals) + SUM(opponent_goals) FROM games")"
#done
echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"
#done
echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games")"
#done
echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT ROUND((AVG(winner_goals) + AVG(opponent_goals)), 16) FROM games")"
#done
echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(GREATEST(winner_goals, opponent_goals)) FROM games")"
#done
echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2")"
# done
echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM games FULL JOIN teams ON games.winner_id = teams.team_id WHERE year=2018 AND round='Final'")"
#done BUT MAYBE SHOULD BE ALPHABETHICAL?
echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo -e "$($PSQL "SELECT name FROM games FULL JOIN teams ON games.winner_id = teams.team_id WHERE year=2014 AND round='Eighth-Final' UNION SELECT name FROM games FULL JOIN teams ON games.opponent_id = teams.team_id WHERE year=2014 AND round='Eighth-Final' ORDER BY name")"
#done
echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT(name) FROM games LEFT JOIN teams ON games.winner_id = teams.team_id ORDER BY name")"
#done
echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year, name FROM games FULL JOIN teams ON games.winner_id = teams.team_id WHERE round='Final' ORDER BY year")"
#done
echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM games FULL JOIN teams ON games.winner_id = teams.team_id WHERE name LIKE 'Co%'")"