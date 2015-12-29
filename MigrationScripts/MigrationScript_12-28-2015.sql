CREATE DATABASE "DmHelper"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English_United States.1252'
       LC_CTYPE = 'English_United States.1252'
       CONNECTION LIMIT = -1;
GRANT ALL ON DATABASE "DmHelper" TO postgres;
GRANT CONNECT, TEMPORARY ON DATABASE "DmHelper" TO "DB_ReadWrite" WITH GRANT OPTION;
REVOKE ALL ON DATABASE "DmHelper" FROM public;


CREATE SCHEMA dmhelper_client
  AUTHORIZATION postgres;

CREATE TABLE dmhelper_client.image
(
  imageid serial NOT NULL,
  imageurl character varying(150) NOT NULL,
  isdeleted boolean DEFAULT false,
  CONSTRAINT image_pkey PRIMARY KEY (imageid),
  CONSTRAINT img_url_unique UNIQUE (imageurl)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dmhelper_client.image
  OWNER TO postgres;

CREATE TABLE dmhelper_client.world
(
  worldid serial NOT NULL,
  name character varying(100) NOT NULL,
  defaultimageid integer,
  shortdescription character varying(200),
  longdescription text,
  CONSTRAINT world_pkey PRIMARY KEY (worldid),
  CONSTRAINT world_defaultimageid_fkey FOREIGN KEY (defaultimageid)
      REFERENCES dmhelper_client.image (imageid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dmhelper_client.world
  OWNER TO postgres;


