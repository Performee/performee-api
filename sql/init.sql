CREATE DATABASE performee;

CREATE TABLE IF NOT EXISTS public.plans
(
    plan_id    SERIAL,
    username   VARCHAR(150) NOT NULL,
    start_date TIMESTAMP WITH TIME ZONE,
    end_date   TIMESTAMP WITH TIME ZONE,
    comments   TEXT,
    PRIMARY KEY (plan_id)
);

CREATE TABLE IF NOT EXISTS public.objectives
(
    objective_id SERIAL,
    plan_id      INT          NOT NULL,
    title        VARCHAR(150) NOT NULL,
    category     VARCHAR(100) NOT NULL,
    description  TEXT,
    comments     TEXT,
    PRIMARY KEY (objective_id),
    CONSTRAINT fk_plan FOREIGN KEY (plan_id) REFERENCES plans (plan_id)
);

CREATE TABLE IF NOT EXISTS public.goals
(
    goal_id             SERIAL,
    objective_id        INT          NOT NULL,
    title               VARCHAR(150) NOT NULL,
    description         TEXT,
    resources           VARCHAR(500) NOT NULL,
    acceptance_criteria VARCHAR(500) NOT NULL,
    comments            TEXT,
    PRIMARY KEY (goal_id),
    CONSTRAINT fk_objective FOREIGN KEY (objective_id) REFERENCES objectives (objective_id)
);

insert into public.plans (plan_id, username, start_date, end_date, comments)
values (1, 'Tony Montana', '2022-01-01 01:00:00.981000 +00:00', '2022-01-15 01:19:22.944000 +00:00', 'First comment'),
       (2, 'Sauron', '2022-02-14 01:00:00.981000 +02:00', '2022-02-14 05:25:22.944000 +02:00', 'Second comment'),
       (3, 'John', '2022-05-01 12:00:18.981000 +03:00', null, 'Third comment');

insert into public.objectives (objective_id, plan_id, title, category, description, comments)
values (1, 1, 'Start objective 1', 'Common', null, 'Init comment'),
       (2, 1, 'Objective 2', 'Basketball', 'Huge description', 'Nothing to say'),
       (3, 2, 'Day of Valentine', 'Love', 'Create love atmosphere', 'Buy flowers and vodka'),
       (4, 3, 'First objective ', 'Three', null, null),
       (5, 3, 'Second objective', 'Three', null, null),
       (6, 3, 'Third objective', 'Three', null, null);

insert into public.goals (goal_id, objective_id, title, description, resources, acceptance_criteria, comments)
values (1, 1, 'Goal 1', 'Description g1', 'Books g1', 'AC g1', 'Comment g1'),
       (2, 1, 'Goal 2', 'Description g2', 'Books g2', 'AC g2', 'Comment g2'),
       (3, 2, 'Goal 3', 'Description g3', 'Books g3', 'AC g3', 'Comment g3'),
       (4, 3, 'Goal 4', 'Description g4', 'Books g4', 'AC g4', 'Comment g4'),
       (5, 4, 'Goal 5', 'Description g5', 'Books g5', 'AC g5', 'Comment g5'),
       (6, 5, 'Goal 6', 'Description g6', 'Books g6', 'AC g6', 'Comment g6'),
       (7, 5, 'Goal 7', 'Description g7', 'Books g7', 'AC g7', 'Comment g7'),
       (8, 6, 'Goal 8', 'Description g8', 'Books g8', 'AC g8', 'Comment g8');