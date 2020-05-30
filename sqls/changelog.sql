-- liquibase formatted sql

-- changeset bob:1
create table click_item (
  username    text,
  item        text,
  time        timestamptz,

  constraint pk_click_item
    primary key (username,item, time)
);

