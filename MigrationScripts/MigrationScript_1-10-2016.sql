
CREATE TABLE dmhelper_client.regiontype
(
  regiontypeid serial NOT NULL,
  name character varying(100) NOT NULL,
  CONSTRAINT regiontype_pk PRIMARY KEY (regiontypeid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dmhelper_client.regiontype
  OWNER TO postgres;
GRANT ALL ON TABLE dmhelper_client.regiontype TO postgres;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE dmhelper_client.regiontype TO "DB_ReadWrite" WITH GRANT OPTION;

CREATE TABLE dmhelper_client.region
(
  regionid serial NOT NULL,
  name character varying(100) NOT NULL,
  shortdescription character varying(200) NOT NULL,
  longdescription text,
  regiontype integer,
  parentregion integer,
  worldid integer,
  CONSTRAINT region_pk PRIMARY KEY (regionid),
  CONSTRAINT region_type_fk FOREIGN KEY (regiontype)
      REFERENCES dmhelper_client.regiontype (regiontypeid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT regoin_world_fk FOREIGN KEY (worldid)
      REFERENCES dmhelper_client.world (worldid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dmhelper_client.region
  OWNER TO postgres;
GRANT ALL ON TABLE dmhelper_client.region TO postgres;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE dmhelper_client.region TO "DB_ReadWrite" WITH GRANT OPTION;
