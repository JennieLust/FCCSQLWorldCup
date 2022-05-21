#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.



# clear data on first run
echo "$($PSQL "TRUNCATE games, teams")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
# checks if team is there, if else inserts team into team table
  # WINNER
  # exclude title row
  if [[  $WINNER != "winner" ]]
  then
    # selects team_id based on winner
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # if team doesn't already exist insert
    if [[ -z $WINNER_ID  ]]
    then
      # insert tem
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    fi
    # get new team_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

  # exlude title / OPPONENT
  if [[  $OPPONENT != "opponent" ]]
  then
    # selects team_id based on winner
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # if team doesn't already exist insert
    if [[ -z $OPPONENT_ID  ]]
    then
      # insert tem
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    fi
    # get new team_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  fi
  if [[ $YEAR != 'year' ]]
  then
    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  fi

  
  








  
  if [[ $OPPONENT != "opponent" ]]
  then 
    echo $TEAM_ID
  fi
done

# for each row

# if team is not alreay in teams.team_id
# insert into teams (name)

# query team id from name
# insert into games (year, round, winner_id, opponent_id, winner_goals, opponent_goals)