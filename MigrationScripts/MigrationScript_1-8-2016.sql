CREATE TABLE dmhelper_client.world_images
(
  worldid integer NOT NULL,
  imageid integer NOT NULL,
  isdeleted boolean DEFAULT false,
  CONSTRAINT worldimage_pkey PRIMARY KEY (worldid, imageid),
  CONSTRAINT worldimage_imageid_fkey FOREIGN KEY (imageid)
      REFERENCES dmhelper_client.image (imageid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT worldimage_worldid_fkey FOREIGN KEY (worldid)
      REFERENCES dmhelper_client.world (worldid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dmhelper_client.world_images
  OWNER TO postgres;
GRANT ALL ON TABLE dmhelper_client.world_images TO postgres;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE dmhelper_client.world_images TO "DB_ReadWrite" WITH GRANT OPTION;

INSERT INTO dmhelper_client.image(
            imageid, imageurl, isdeleted)
    VALUES ("treasureMapIcon.png", false);

INSERT INTO dmhelper_client.world(
            name, defaultimageid, shortdescription, longdescription)
    VALUES ("Lyrentia", 1, "Discover the struggles of a kingdom rising from the ashes of a great cataclysm.","Eons ago in an age before remembering, there was a vast Empire. Its fingers stretched across everywhere the Gods could touch, and yet now there remains but whispers of their greatness. It is said that the leaders of the Empire touched upon a power not mean (...)";

INSERT INTO dmhelper_client.world_images(
            worldid, imageid, isdeleted)
    VALUES (1, 1, false);


