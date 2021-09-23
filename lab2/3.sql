create table students(
    full_name       varchar primary key,
    age             integer not null,
    birth_date      date not null,
    gender          varchar not null,
    average_grade   double precision not null,
    information     text not null,
    need_for_dorm   boolean not null,
    additional_info text
);
create table instructors(
    full_name       varchar primary key,
    remote_lessons  boolean not null
);

create table work_experience(
    instructor_name   varchar not null,
    company_name      varchar not null,
    primary key(instructor_name,company_name),
    foreign key(instructor_name) references instructors(full_name)
);

create table lan(
    instructor_name varchar not null,
    lan_name        varchar not null,
    primary key(instructor_name,lan_name),
    foreign key(instructor_name) references instructors(full_name)
);

create table lesson_part(
    lesson_title varchar,
    instructor   varchar,
    room_num     integer not null,
    primary key(lesson_title,instructor),
    foreign key(instructor) references instructors(full_name)
);

create table studying_students(
    full_name            varchar not null,
    studying_lesson      varchar not null,
    teaching_instructor  varchar not null,
    primary key(full_name,studying_lesson),
    foreign key(studying_lesson,teaching_instructor) references lesson_part,
    foreign key(full_name) references students(full_name)
);
