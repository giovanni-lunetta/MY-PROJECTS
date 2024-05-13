# STAT-4185-FINAL-PROJECT

## Conclusions

The goal of this project was to take NBA players from the past 10 seasons and use both normal and advanced regular season statistics per 36 minutes of game play to differentiate between different player archetypes. 

I found that the best model was using PCA Dimension Reduction to three principal components, of these variables:

Advanced Statistics:
* ORB% -- Offensive Rebound Percentage
    * An estimate of the percentage of available offensive rebounds a player grabbed while they were on the floor.

* DRB% -- Defensive Rebound Percentage
    * An estimate of the percentage of available defensive rebounds a player grabbed while they were on the floor.

* AST% -- Assist Percentage
    * An estimate of the percentage of teammate field goals a player assisted while they were on the floor.

* STL% -- Steal Percentage
    * An estimate of the percentage of opponent possessions that end with a steal by the player while they were on the floor.

* BLK% -- Block Percentage
    * An estimate of the percentage of opponent two-point field goal attempts blocked by the player while they were on the floor.

* TOV% -- Turnover Percentage
    * An estimate of turnovers committed per 100 plays.

* USG% -- Usage Percentage
    * An estimate of the percentage of team plays used by a player while they were on the floor.

Normal Statistics:
* Per 36 Minutes Played
* 2P -- 2-Point Field Goals
* 2PA -- 2-Point Field Goal Attempts
* 3P -- 3-Point Field Goals
* 3PA -- 3-Point Field Goal Attempts
* FT -- Free Throws
* FTA -- Free Throw Attempts
* PTS -- Points


8 clusters were created and here is the archetype breakdown for each cluster:

* Cluster 1 - Rim Protectors / Rebounders: These players are primarily known for their shot-blocking and rebounding skills. They are usually big men who play near the basket and make their impact felt on the defensive end. They may not be the most skilled offensively, but their size, athleticism, and hustle allow them to contribute on that end as well.
    * Examples: Steven Adams, DeAndre Jordan, and Joakim Noah.

* Cluster 2 - Playmaking Guards: Players in this cluster are primarily ball handlers who excel at creating scoring opportunities for their teammates. They tend to be skilled passers with good court vision and can break down defenses with their dribbling skills. They can score as well, but their primary role is to facilitate the offense.
    * Examples: Chris Paul, Kyrie Irving, and Kemba Walker.

* Cluster 3 - Scoring Wings: These players are known for their scoring abilities, particularly from the perimeter. They can shoot well from beyond the arc, create their own shots off the dribble, and find ways to score in transition. They may contribute in other areas like rebounding and defense, but their primary role is to put points on the board.
    * Examples: Klay Thompson, Jaylen Brown, and Devin Booker.

* Cluster 4 - Skilled Big Men: Players in this cluster are typically tall and strong with a versatile skill set. They can score inside and outside, rebound, and defend. Some may have a more refined post game, while others can stretch the floor with their shooting ability. They contribute on both ends of the court and can be matchup nightmares for opponents.
    * Examples: Anthony Davis, Karl-Anthony Towns, and Kristaps Porziņģis.

* Cluster 5 - Superstars / All-Around Stars: This cluster consists of the elite players in the league, who excel in multiple aspects of the game. They can score, pass, rebound, and defend at a high level. They are often the focal points of their teams and can carry their teams to success. These players tend to be some of the most well-known and popular players in the league.
    * Examples: LeBron James, Kevin Durant, and Giannis Antetokounmpo.

* Cluster 6 - Role Players: Mainly comprises role players, including guards, forwards, and wings, who provide solid contributions off the bench or in limited minutes. Examples: Danny Green, Kentavious Caldwell-Pope, and Trevor Ariza.
    * Examples: Danny Green, Kentavious Caldwell-Pope, and Trevor Ariza.

* Cluster 7 - Defensive Specialists: Players in this cluster are valued primarily for their defensive abilities. They are often tasked with guarding the opposing team's best scorer and can be disruptive forces on that end of the court. They may not contribute much offensively, but their defensive impact is significant enough to warrant a place on the roster.
    * Examples: Marcus Smart, Patrick Beverley, and Tony Allen.

* Cluster 8 - Lower End Forwards & Centers: These players are skilled enough to warrant a spot on the roster but only as a backup or during times where a better option in not available.
    * Examples: Ryan Anderson, Channing Frye, and Ersan İlyasova.

Overall, kmeans with PCA was able to create 8 NBA archetypes that can be used by team managers and coaches to determine what type of player they may need for their team.

In the future, I would like to explore other clustering algorithms to see if they can make more accurate clusters. Also, it would be interesting to explore clustering in a position level.

Sources:
https://alexcstern.github.io/hoopDown.html 