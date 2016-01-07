ALTER TABLE dmhelper_client.world
  OWNER TO postgres;
GRANT ALL ON TABLE dmhelper_client.world TO postgres;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE dmhelper_client.world TO "DB_ReadWrite" WITH GRANT OPTION;


ALTER TABLE dmhelper_client.image
  OWNER TO postgres;
GRANT ALL ON TABLE dmhelper_client.image TO postgres;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE dmhelper_client.image TO "DB_ReadWrite";