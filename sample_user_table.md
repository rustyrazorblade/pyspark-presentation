## Create our demo user table

    create TABLE user ( name text PRIMARY KEY,
        				favorite_food text );

    insert into user (name, favorite_food) values ('jon', 'bacon');
    insert into user (name, favorite_food) values ('luke', 'pie');
    insert into user (name, favorite_food) values ('patrick', 'pizza');
    insert into user (name, favorite_food) values ('rachel', 'pizza');

    create table favorite_foods ( food text, name text,
    		primary key (food, name));
