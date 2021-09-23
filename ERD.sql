-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "cause" (
    "fire_number" int   NOT NULL,
    "responsible_group_desc" str   NOT NULL,
    "activity_class" str   NOT NULL,
    "true_cause" str   NOT NULL,
    "permit_detail_desc" str   NOT NULL,
    "fire_start_date" date   NOT NULL,
    CONSTRAINT "pk_Cause" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "detection" (
    "fire_number" int   NOT NULL,
    "industry_identifier_desc" str   NOT NULL,
    "det_agent_Type" str   NOT NULL,
    "det_agent" str   NOT NULL,
    "discovered_date" date   NOT NULL,
    "reported_date" date   NOT NULL,
    CONSTRAINT "pk_Detection" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "labels" (
    "fire_number" int   NOT NULL,
    "fire_type" str   NOT NULL,
    "fire_position_on_slope" str   NOT NULL,
    "weather_conditions_over_fire" str   NOT NULL,
    "fuel_type" str   NOT NULL,
    "other_fuel_type" str   NOT NULL,
    CONSTRAINT "pk_Labels" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "loc" (
    "fire_number" int   NOT NULL,
    "fire_location_latitude" double   NOT NULL,
    "fire_location_longitude" double   NOT NULL,
    CONSTRAINT "pk_Loc" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "response" (
    "fire_number" int   NOT NULL,
    "start_for_fire_date" date   NOT NULL,
    "fire_fighting_start_size" double   NOT NULL,
    "initial_action_by" str   NOT NULL,
    "bh_fs_date" date   NOT NULL,
    "bh_hectares" double   NOT NULL,
    "uc_fs_date" date   NOT NULL,
    "uc_hectares" double   NOT NULL,
    CONSTRAINT "pk_Response" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "extra" (
    "fire_number" int   NOT NULL,
    "fire_name" str   NOT NULL,
    "fire_year" int   NOT NULL,
    "calendar_year" int   NOT NULL,
    "assessment_datetime" date   NOT NULL,
    "assessment_hectares" size   NOT NULL,
    "current_Size" double   NOT NULL,
    "size_class" str   NOT NULL,
    "fire_origin" str   NOT NULL,
    CONSTRAINT "pk_Extra" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "det_agent" (
    "det_agent" str   NOT NULL,
    "description" str   NOT NULL,
    CONSTRAINT "pk_det_agent" PRIMARY KEY (
        "det_agent"
     )
);

CREATE TABLE "det_agent_type" (
    "det_agent_type" str   NOT NULL,
    "description" str   NOT NULL,
    CONSTRAINT "pk_det_agent_type" PRIMARY KEY (
        "det_agent_type"
     )
);

CREATE TABLE "fuel_type" (
    "fuel_Type" str   NOT NULL,
    "description" str   NOT NULL,
    CONSTRAINT "pk_fuel_type" PRIMARY KEY (
        "fuel_Type"
     )
);

CREATE TABLE "initial_action_by" (
    "initial_action_by" str   NOT NULL,
    "description" str   NOT NULL,
    CONSTRAINT "pk_initial_action_by" PRIMARY KEY (
        "initial_action_by"
     )
);

-- Free plan table limit reached. SUBSCRIBE for more.



ALTER TABLE "cause" ADD CONSTRAINT "fk_Cause_fire_number" FOREIGN KEY("fire_number")
REFERENCES "detection" ("fire_number");

ALTER TABLE "detection" ADD CONSTRAINT "fk_Detection_det_agent_Type" FOREIGN KEY("det_agent_Type")
REFERENCES "det_agent_type" ("det_agent_type");

ALTER TABLE "detection" ADD CONSTRAINT "fk_Detection_det_agent" FOREIGN KEY("det_agent")
REFERENCES "det_agent" ("det_agent");

ALTER TABLE "labels" ADD CONSTRAINT "fk_Labels_fire_number" FOREIGN KEY("fire_number")
REFERENCES "Cause" ("fire_number");

ALTER TABLE "labels" ADD CONSTRAINT "fk_Labels_fuel_type" FOREIGN KEY("fuel_type")
REFERENCES "fuel_type" ("fuel_Type");

ALTER TABLE "loc" ADD CONSTRAINT "fk_Loc_fire_number" FOREIGN KEY("fire_number")
REFERENCES "Detection" ("fire_number");

ALTER TABLE "response" ADD CONSTRAINT "fk_Response_fire_number" FOREIGN KEY("fire_number")
REFERENCES "Detection" ("fire_number");

ALTER TABLE "response" ADD CONSTRAINT "fk_Response_initial_action_by" FOREIGN KEY("initial_action_by")
REFERENCES "initial_action_by" ("initial_action_by");

ALTER TABLE "extra" ADD CONSTRAINT "fk_Extra_fire_number" FOREIGN KEY("fire_number")
REFERENCES "cause" ("fire_number");




