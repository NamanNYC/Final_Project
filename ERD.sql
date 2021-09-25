-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "cause" (
    "fire_number" int ,
    "responsible_group_desc" varchar ,
    "activity_class" varchar ,
    "true_cause" varchar ,
    "permit_detail_desc" varchar ,
    "fire_start_date" date ,
    CONSTRAINT "pk_cause" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "detection" (
    "fire_number" int ,
    "industry_identifier_desc" varchar ,
    "det_agent_Type" varchar ,
    "det_agent" varchar ,
    "discovered_date" date ,
    "reported_date" date ,
    CONSTRAINT "pk_detection" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "labels" (
    "fire_number" int ,
    "fire_type" varchar ,
    "fire_position_on_slope" varchar ,
    "weather_conditions_over_fire" varchar ,
    "fuel_type" varchar ,
    "other_fuel_type" varchar ,
    CONSTRAINT "pk_labels" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "loc" (
    "fire_number" int ,
    "fire_location_latitude" float ,
    "fire_location_longitude" float ,
    CONSTRAINT "pk_loc" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "response" (
    "fire_number" int ,
    "start_for_fire_date" date ,
    "fire_fighting_start_size" float ,
    "initial_action_by" varchar ,
    "bh_fs_date" date ,
    "bh_hectares" float ,
    "uc_fs_date" date ,
    "uc_hectares" float ,
    CONSTRAINT "pk_response" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "extra" (
    "fire_number" int ,
    "fire_name" varchar ,
    "fire_year" int ,
    "calendar_year" int ,
    "assessment_datetime" date ,
    "assessment_hectares" float ,
    "current_Size" float ,
    "size_class" varchar ,
    "fire_origin" varchar ,
    CONSTRAINT "pk_extra" PRIMARY KEY (
        "fire_number"
     )
);

CREATE TABLE "det_agent" (
    "det_agent" varchar ,
    "description" varchar ,
    CONSTRAINT "pk_det_agent" PRIMARY KEY (
        "det_agent"
     )
);

CREATE TABLE "det_agent_type" (
    "det_agent_type" varchar ,
    "description" varchar ,
    CONSTRAINT "pk_det_agent_type" PRIMARY KEY (
        "det_agent_type"
     )
);

CREATE TABLE "fuel_type" (
    "fuel_Type" varchar ,
    "description" varchar ,
    CONSTRAINT "pk_fuel_type" PRIMARY KEY (
        "fuel_Type"
     )
);

CREATE TABLE "initial_action_by" (
    "initial_action_by" varchar ,
    "description" varchar ,
    CONSTRAINT "pk_initial_action_by" PRIMARY KEY (
        "initial_action_by"
     )
);

-- Free plan table limit reached. SUBSCRIBE for more.



ALTER TABLE "cause" ADD CONSTRAINT "fk_cause_fire_number" FOREIGN KEY("fire_number")
REFERENCES "detection" ("fire_number");

ALTER TABLE "detection" ADD CONSTRAINT "fk_detection_det_agent_Type" FOREIGN KEY("det_agent_Type")
REFERENCES "det_agent_type" ("det_agent_type");

ALTER TABLE "detection" ADD CONSTRAINT "fk_detection_det_agent" FOREIGN KEY("det_agent")
REFERENCES "det_agent" ("det_agent");

ALTER TABLE "labels" ADD CONSTRAINT "fk_labels_fire_number" FOREIGN KEY("fire_number")
REFERENCES "cause" ("fire_number");

ALTER TABLE "labels" ADD CONSTRAINT "fk_labels_fuel_type" FOREIGN KEY("fuel_type")
REFERENCES "fuel_type" ("fuel_Type");

ALTER TABLE "loc" ADD CONSTRAINT "fk_loc_fire_number" FOREIGN KEY("fire_number")
REFERENCES "detection" ("fire_number");

ALTER TABLE "response" ADD CONSTRAINT "fk_response_fire_number" FOREIGN KEY("fire_number")
REFERENCES "detection" ("fire_number");

ALTER TABLE "response" ADD CONSTRAINT "fk_response_initial_action_by" FOREIGN KEY("initial_action_by")
REFERENCES "initial_action_by" ("initial_action_by");

ALTER TABLE "extra" ADD CONSTRAINT "fk_extra_fire_number" FOREIGN KEY("fire_number")
REFERENCES "cause" ("fire_number");




