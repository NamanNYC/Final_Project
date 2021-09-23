-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "cause" (
    "fire_number" int   NOT NULL,
    "responsible_group_desc" varchar   NOT NULL,
    "activity_class" varchar   NOT NULL,
    "true_cause" varchar   NOT NULL,
    "permit_detail_desc" varchar   NOT NULL,
    "fire_start_date" date   NOT NULL,
    CONSTRAINT "pk_Cause" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "detection" (
    "fire_number" int   NOT NULL,
    "industry_identifier_desc" varchar   NOT NULL,
    "det_agent_Type" varchar   NOT NULL,
    "det_agent" varchar   NOT NULL,
    "discovered_date" date   NOT NULL,
    "reported_date" date   NOT NULL,
    CONSTRAINT "pk_Detection" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "labels" (
    "fire_number" int   NOT NULL,
    "fire_type" varchar   NOT NULL,
    "fire_position_on_slope" varchar   NOT NULL,
    "weather_conditions_over_fire" varchar   NOT NULL,
    "fuel_type" varchar   NOT NULL,
    "other_fuel_type" varchar   NOT NULL,
    CONSTRAINT "pk_Labels" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "loc" (
    "fire_number" int   NOT NULL,
    "fire_location_latitude" float   NOT NULL,
    "fire_location_longitude" float   NOT NULL,
    CONSTRAINT "pk_Loc" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "response" (
    "fire_number" int   NOT NULL,
    "start_for_fire_date" date   NOT NULL,
    "fire_fighting_start_size" float   NOT NULL,
    "initial_action_by" varchar   NOT NULL,
    "bh_fs_date" date   NOT NULL,
    "bh_hectares" float   NOT NULL,
    "uc_fs_date" date   NOT NULL,
    "uc_hectares" float   NOT NULL,
    CONSTRAINT "pk_Response" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "extra" (
    "fire_number" int   NOT NULL,
    "fire_name" varchar   NOT NULL,
    "fire_year" int   NOT NULL,
    "calendar_year" int   NOT NULL,
    "assessment_datetime" date   NOT NULL,
    "assessment_hectares" size   NOT NULL,
    "current_Size" float   NOT NULL,
    "size_class" varchar   NOT NULL,
    "fire_origin" varchar   NOT NULL,
    CONSTRAINT "pk_Extra" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "det_agent" (
    "det_agent" varchar   NOT NULL,
    "description" varchar   NOT NULL,
    CONSTRAINT "pk_det_agent" PRIMARY KEY (
        "det_agent"
     )
);

CREATE TABLE "det_agent_type" (
    "det_agent_type" varchar   NOT NULL,
    "description" varchar   NOT NULL,
    CONSTRAINT "pk_det_agent_type" PRIMARY KEY (
        "det_agent_type"
     )
);

CREATE TABLE "fuel_type" (
    "fuel_Type" varchar   NOT NULL,
    "description" varchar   NOT NULL,
    CONSTRAINT "pk_fuel_type" PRIMARY KEY (
        "fuel_Type"
     )
);

CREATE TABLE "initial_action_by" (
    "initial_action_by" varchar   NOT NULL,
    "description" varchar   NOT NULL,
    CONSTRAINT "pk_initial_action_by" PRIMARY KEY (
        "initial_action_by"
     )
);




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




