BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "ActivityLog" (
	"NAME"	TEXT NOT NULL,
	"LENGTH"	INTEGER,
	"DATE"	TEXT NOT NULL,
	"DESCRIPTION"	TEXT
);
CREATE TABLE IF NOT EXISTS "Activities" (
	"NAME"	TEXT,
	"DESCRIPTION"	TEXT,
	PRIMARY KEY("NAME")
);
CREATE TABLE IF NOT EXISTS "Main" (
	"DATE"	TEXT,
	"SLEEP"	INTEGER,
	"WATER"	INTEGER,
	"STRESS"	INTEGER,
	"EXERCISE"	INTEGER,
	"LOCATION"	TEXT,
	"ALCOHOL"	INTEGER,
	"MOOD"	INTEGER,
	"PRODUCTIVITY"	INTEGER,
	"NOTES"	TEXT,
	PRIMARY KEY("DATE")
);
INSERT INTO "ActivityLog" VALUES ('Walking',1,'07-03-2020','Walked to university');
INSERT INTO "ActivityLog" VALUES ('Football',2,'07-03-2020','Played for my football team in the evening');
INSERT INTO "ActivityLog" VALUES ('Studying',8,'07-03-2020','Spent the day in the library at the university working on my assignment');
INSERT INTO "ActivityLog" VALUES ('Studying',8,'08-03-2020','Spent most of the day in the library');
INSERT INTO "ActivityLog" VALUES ('Walking',1,'08-03-2020','Walked up to university');
INSERT INTO "ActivityLog" VALUES ('Walking',1,'09-03-2020','Walked to university');
INSERT INTO "ActivityLog" VALUES ('Dodgeball',1,'09-03-2020','Played dodgeball at the university');
INSERT INTO "ActivityLog" VALUES ('Gym',2,'09-03-2020','Went to the gym with my friends');
INSERT INTO "ActivityLog" VALUES ('Walking',1,'10-03-2020','Walked to uni');
INSERT INTO "ActivityLog" VALUES ('Studying',6,'10-03-2020','Worked on my dissertation');
INSERT INTO "ActivityLog" VALUES ('Gym',2,'10-03-2020','Went to the gym alone');
INSERT INTO "ActivityLog" VALUES ('Partying',6,'11-03-2020','Went on a night out with my friends');
INSERT INTO "ActivityLog" VALUES ('Studying',6,'12-03-2020','Worked on my dissertation from home');
INSERT INTO "ActivityLog" VALUES ('Gym',2,'12-03-2020','Went to the gym alone and focused on cardio');
INSERT INTO "ActivityLog" VALUES ('Walking',1,'12-03-2020','I walked to and from the gym');
INSERT INTO "ActivityLog" VALUES ('Studying',5,'13-03-2020','Struggled to complete much of my dissertation today');
INSERT INTO "ActivityLog" VALUES ('Studying',4,'14-03-2020','Didn''t get much done');
INSERT INTO "ActivityLog" VALUES ('Studying',8,'15-03-2020','Completed a large amount of my dissertation');
INSERT INTO "Activities" VALUES ('Running','Exercise');
INSERT INTO "Activities" VALUES ('Studying','Academic');
INSERT INTO "Activities" VALUES ('Work','Essential');
INSERT INTO "Activities" VALUES ('Shopping','Leisure');
INSERT INTO "Activities" VALUES ('Walking','Exercise');
INSERT INTO "Activities" VALUES ('Cooking','Essential');
INSERT INTO "Activities" VALUES ('Eating out','Leisure');
INSERT INTO "Activities" VALUES ('Football','Exercise');
INSERT INTO "Activities" VALUES ('Movies','Leisure');
INSERT INTO "Activities" VALUES ('Coffee','Leisure');
INSERT INTO "Activities" VALUES ('Dodgeball','Exercise');
INSERT INTO "Activities" VALUES ('Gym','Exercise');
INSERT INTO "Activities" VALUES ('Partying','Leisure');
INSERT INTO "Main" VALUES ('07-03-2020',8,2,3,3,'University',0,3,7,'Today I completed a large amount of my assignment that is due in next week');
INSERT INTO "Main" VALUES ('08-03-2020',5,1,7,1,'University',0,7,3,'I came across some difficulties completing my assignment so I procrastinated for a large part of the day');
INSERT INTO "Main" VALUES ('09-03-2020',10,3,4,4,'University',0,2,9,'Today I worked on my assignment, played dodgeball and went to the gym');
INSERT INTO "Main" VALUES ('10-03-2020',8,3,3,3,'University',0,2,7,'Worked on my assignment');
INSERT INTO "Main" VALUES ('11-03-2020',4,3,6,0,'Home',15,8,1,'Went on a night out the night before');
INSERT INTO "Main" VALUES ('12-03-2020',10,4,3,1,'Home',0,3,7,'Studied from home and went to the gym');
INSERT INTO "Main" VALUES ('13-03-2020',8,2,5,0,'Home',0,7,5,'Studied from home but got distracted');
INSERT INTO "Main" VALUES ('14-03-2020',5,1,8,1,'University',0,8,3,'Tried to work on my dissertation but I got distracted');
INSERT INTO "Main" VALUES ('15-03-2020',8,3,3,1,'University',0,3,9,NULL);
COMMIT;
