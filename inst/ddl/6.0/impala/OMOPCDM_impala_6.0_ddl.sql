--impala CDM DDL Specification for OMOP Common Data Model 6.0
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.PERSON (
			person_id BIGINT,
			gender_concept_id INT,
			year_of_birth INT,
			month_of_birth integer NULL,
			day_of_birth integer NULL,
			birth_datetime TIMESTAMP,
			death_datetime TIMESTAMP,
			race_concept_id INT,
			ethnicity_concept_id INT,
			location_id BIGINT,
			provider_id BIGINT,
			care_site_id BIGINT,
			person_source_value VARCHAR(50),
			gender_source_value VARCHAR(50),
			gender_source_concept_id INT,
			race_source_value VARCHAR(50),
			race_source_concept_id INT,
			ethnicity_source_value VARCHAR(50),
			ethnicity_source_concept_id INT );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.OBSERVATION_PERIOD (
			observation_period_id BIGINT,
			person_id BIGINT,
			observation_period_start_date TIMESTAMP,
			observation_period_end_date TIMESTAMP,
			period_type_concept_id INT );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.VISIT_OCCURRENCE (
			visit_occurrence_id BIGINT,
			person_id BIGINT,
			visit_concept_id INT,
			visit_start_date TIMESTAMP,
			visit_start_datetime TIMESTAMP,
			visit_end_date TIMESTAMP,
			visit_end_datetime TIMESTAMP,
			visit_type_concept_id INT,
			provider_id BIGINT,
			care_site_id BIGINT,
			visit_source_value VARCHAR(50),
			visit_source_concept_id INT,
			admitted_from_concept_id INT,
			admitted_from_source_value VARCHAR(50),
			discharge_to_concept_id INT,
			discharge_to_source_value VARCHAR(50),
			preceding_visit_occurrence_id BIGINT );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.VISIT_DETAIL (
			visit_detail_id BIGINT,
			person_id BIGINT,
			visit_detail_concept_id INT,
			visit_detail_start_date TIMESTAMP,
			visit_detail_start_datetime TIMESTAMP,
			visit_detail_end_date TIMESTAMP,
			visit_detail_end_datetime TIMESTAMP,
			visit_detail_type_concept_id INT,
			provider_id BIGINT,
			care_site_id BIGINT,
			visit_detail_source_value VARCHAR(50),
			visit_detail_source_concept_id INT,
			admitted_from_concept_id VARCHAR(50),
			admitted_from_source_value INT,
			discharge_to_source_value VARCHAR(50),
			discharge_to_concept_id INT,
			preceding_visit_detail_id BIGINT,
			visit_detail_parent_id BIGINT,
			visit_occurrence_id BIGINT );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.CONDITION_OCCURRENCE (
			condition_occurrence_id BIGINT,
			person_id BIGINT,
			condition_concept_id INT,
			condition_start_date TIMESTAMP,
			condition_start_datetime TIMESTAMP,
			condition_end_date TIMESTAMP,
			condition_end_datetime TIMESTAMP,
			condition_type_concept_id INT,
			condition_status_concept_id INT,
			stop_reason VARCHAR(20),
			provider_id BIGINT,
			visit_occurrence_id BIGINT,
			visit_detail_id BIGINT,
			condition_source_value VARCHAR(50),
			condition_source_concept_id INT,
			condition_status_source_value VARCHAR(50) );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.DRUG_EXPOSURE (
			drug_exposure_id BIGINT,
			person_id BIGINT,
			drug_concept_id INT,
			drug_exposure_start_date TIMESTAMP,
			drug_exposure_start_datetime TIMESTAMP,
			drug_exposure_end_date TIMESTAMP,
			drug_exposure_end_datetime TIMESTAMP,
			verbatim_end_date TIMESTAMP,
			drug_type_concept_id INT,
			stop_reason VARCHAR(20),
			refills integer NULL,
			quantity FLOAT,
			days_supply integer NULL,
			sig VARCHAR(MAX),
			route_concept_id integer NULL,
			lot_number VARCHAR(50),
			provider_id BIGINT,
			visit_occurrence_id BIGINT,
			visit_detail_id BIGINT,
			drug_source_value VARCHAR(50),
			drug_source_concept_id INT,
			route_source_value VARCHAR(50),
			dose_unit_source_value VARCHAR(50) );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.PROCEDURE_OCCURRENCE (
			procedure_occurrence_id BIGINT,
			person_id BIGINT,
			procedure_concept_id INT,
			procedure_date TIMESTAMP,
			procedure_datetime TIMESTAMP,
			procedure_type_concept_id INT,
			modifier_concept_id integer NULL,
			quantity integer NULL,
			provider_id BIGINT,
			visit_occurrence_id BIGINT,
			visit_detail_id BIGINT,
			procedure_source_value VARCHAR(50),
			procedure_source_concept_id INT,
			modifier_source_value VARCHAR(50) );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.DEVICE_EXPOSURE (
			device_exposure_id BIGINT,
			person_id BIGINT,
			device_concept_id INT,
			device_exposure_start_date TIMESTAMP,
			device_exposure_start_datetime TIMESTAMP,
			device_exposure_end_date TIMESTAMP,
			device_exposure_end_datetime TIMESTAMP,
			device_type_concept_id INT,
			unique_device_id VARCHAR(255),
			quantity integer NULL,
			provider_id BIGINT,
			visit_occurrence_id BIGINT,
			visit_detail_id BIGINT,
			device_source_value VARCHAR(50),
			device_source_concept_id INT );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.MEASUREMENT (
			measurement_id BIGINT,
			person_id BIGINT,
			measurement_concept_id INT,
			measurement_date TIMESTAMP,
			measurement_datetime TIMESTAMP,
			measurement_time VARCHAR(10),
			measurement_type_concept_id INT,
			operator_concept_id integer NULL,
			value_as_number FLOAT,
			value_as_concept_id integer NULL,
			unit_concept_id integer NULL,
			range_low FLOAT,
			range_high FLOAT,
			provider_id BIGINT,
			visit_occurrence_id BIGINT,
			visit_detail_id BIGINT,
			measurement_source_value VARCHAR(50),
			measurement_source_concept_id INT,
			unit_source_value VARCHAR(50),
			value_source_value VARCHAR(50) );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.OBSERVATION (
			observation_id BIGINT,
			person_id BIGINT,
			observation_concept_id INT,
			observation_date TIMESTAMP,
			observation_datetime TIMESTAMP,
			observation_type_concept_id INT,
			value_as_number FLOAT,
			value_as_string VARCHAR(60),
			value_as_concept_id Integer NULL,
			qualifier_concept_id integer NULL,
			unit_concept_id integer NULL,
			provider_id BIGINT,
			visit_occurrence_id BIGINT,
			visit_detail_id BIGINT,
			observation_source_value VARCHAR(50),
			observation_source_concept_id INT,
			unit_source_value VARCHAR(50),
			qualifier_source_value VARCHAR(50),
			observation_event_id BIGINT,
			obs_event_field_concept_id integer NULL,
			value_as_datetime TIMESTAMP );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.NOTE (
			note_id INT,
			person_id BIGINT,
			note_event_id BIGINT,
			note_event_field_concept_id integer NULL,
			note_date TIMESTAMP,
			note_datetime TIMESTAMP,
			note_type_concept_id INT,
			note_class_concept_id INT,
			note_title VARCHAR(250),
			note_text VARCHAR(MAX),
			encoding_concept_id INT,
			language_concept_id INT,
			provider_id BIGINT,
			visit_occurrence_id BIGINT,
			visit_detail_id BIGINT,
			note_source_value VARCHAR(50) );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.NOTE_NLP (
			note_nlp_id BIGINT,
			note_id INT,
			section_concept_id integer NULL,
			snippet VARCHAR(250),
			"offset" VARCHAR(50),
			lexical_variant VARCHAR(250),
			note_nlp_concept_id integer NULL,
			note_nlp_source_concept_id integer NULL,
			nlp_system VARCHAR(250),
			nlp_date TIMESTAMP,
			nlp_datetime TIMESTAMP,
			term_exists VARCHAR(1),
			term_temporal VARCHAR(50),
			term_modifiers VARCHAR(2000) );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.SPECIMEN (
			specimen_id BIGINT,
			person_id BIGINT,
			specimen_concept_id INT,
			specimen_type_concept_id INT,
			specimen_date TIMESTAMP,
			specimen_datetime TIMESTAMP,
			quantity FLOAT,
			unit_concept_id integer NULL,
			anatomic_site_concept_id integer NULL,
			disease_status_concept_id integer NULL,
			specimen_source_id VARCHAR(50),
			specimen_source_value VARCHAR(50),
			unit_source_value VARCHAR(50),
			anatomic_site_source_value VARCHAR(50),
			disease_status_source_value VARCHAR(50) );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.FACT_RELATIONSHIP (
			domain_concept_id_1 INT,
			fact_id_1 BIGINT,
			domain_concept_id_2 INT,
			fact_id_2 BIGINT,
			relationship_concept_id INT );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.SURVEY_CONDUCT (
			survey_conduct_id BIGINT,
			person_id BIGINT,
			survey_concept_id INT,
			survey_start_date TIMESTAMP,
			survey_start_datetime TIMESTAMP,
			survey_end_date TIMESTAMP,
			survey_end_datetime TIMESTAMP,
			provider_id BIGINT,
			assisted_concept_id INT,
			respondent_type_concept_id INT,
			timing_concept_id INT,
			collection_method_concept_id INT,
			assisted_source_value VARCHAR(50),
			respondent_type_source_value VARCHAR(100),
			timing_source_value VARCHAR(100),
			collection_method_source_value VARCHAR(100),
			survey_source_value VARCHAR(100),
			survey_source_concept_id INT,
			survey_source_identifier VARCHAR(100),
			validated_survey_concept_id INT,
			validated_survey_source_value integer NULL,
			survey_version_number VARCHAR(20),
			visit_occurrence_id BIGINT,
			response_visit_occurrence_id BIGINT );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.`location` (
			location_id BIGINT,
			address_1 VARCHAR(50),
			address_2 VARCHAR(50),
			city VARCHAR(50),
			state VARCHAR(2),
			zip VARCHAR(9),
			county VARCHAR(20),
			location_source_value VARCHAR(50),
			latitude FLOAT,
			longitude FLOAT );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.LOCATION_HISTORY (
			location_id BIGINT,
			relationship_type_concept_id INT,
			domain_id VARCHAR(50),
			entity_id BIGINT,
			start_date TIMESTAMP,
			end_date TIMESTAMP );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.CARE_SITE (
			care_site_id BIGINT,
			care_site_name VARCHAR(255),
			place_of_service_concept_id INT,
			location_id BIGINT,
			care_site_source_value VARCHAR(50),
			place_of_service_source_value VARCHAR(50) );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.PROVIDER (
			provider_id BIGINT,
			provider_name VARCHAR(255),
			npi VARCHAR(20),
			dea VARCHAR(20),
			specialty_concept_id INT,
			care_site_id BIGINT,
			year_of_birth integer NULL,
			gender_concept_id INT,
			provider_source_value VARCHAR(50),
			specialty_source_value VARCHAR(50),
			specialty_source_concept_id INT,
			gender_source_value VARCHAR(50),
			gender_source_concept_id INT );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.PAYER_PLAN_PERIOD (
			payer_plan_period_id BIGINT,
			person_id BIGINT,
			contract_person_id BIGINT,
			payer_plan_period_start_date TIMESTAMP,
			payer_plan_period_end_date TIMESTAMP,
			payer_concept_id INT,
			payer_source_value VARCHAR(50),
			payer_source_concept_id INT,
			plan_concept_id INT,
			plan_source_value VARCHAR(50),
			plan_source_concept_id INT,
			contract_concept_id INT,
			contract_source_value VARCHAR(50),
			contract_source_concept_id INT,
			sponsor_concept_id INT,
			sponsor_source_value VARCHAR(50),
			sponsor_source_concept_id integer NULL,
			family_source_value VARCHAR(50),
			stop_reason_concept_id integer NULL,
			stop_reason_source_value VARCHAR(50),
			stop_reason_source_concept_id integer NULL );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.COST (
			cost_id BIGINT,
			person_id BIGINT,
			cost_event_id BIGINT,
			cost_event_field_concept_id INT,
			cost_concept_id integer NULL,
			cost_type_concept_id integer NULL,
			cost_source_concept_id integer NULL,
			cost_source_value VARCHAR(50),
			currency_concept_id integer NULL,
			cost FLOAT,
			incurred_date TIMESTAMP,
			billed_date TIMESTAMP,
			paid_date TIMESTAMP,
			revenue_code_concept_id integer NULL,
			drg_concept_id integer NULL,
			revenue_code_source_value VARCHAR(50),
			drg_source_value VARCHAR(50),
			payer_plan_period_id BIGINT );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.DRUG_ERA (
			drug_era_id BIGINT,
			person_id BIGINT,
			drug_concept_id INT,
			drug_era_start_datetime TIMESTAMP,
			drug_era_end_datetime TIMESTAMP,
			drug_exposure_count integer NULL,
			gap_days integer NULL );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.DOSE_ERA (
			dose_era_id BIGINT,
			person_id BIGINT,
			drug_concept_id INT,
			unit_concept_id INT,
			dose_value FLOAT,
			dose_era_start_datetime TIMESTAMP,
			dose_era_end_datetime TIMESTAMP );
--HINT DISTRIBUTE ON KEY (person_id)
CREATE TABLE @cdmDatabaseSchema.CONDITION_ERA (
			condition_era_id BIGINT,
			person_id BIGINT,
			condition_concept_id INT,
			condition_era_start_datetime TIMESTAMP,
			condition_era_end_datetime TIMESTAMP,
			condition_occurrence_count integer NULL );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.METADATA (
			metadata_concept_id INT,
			metadata_type_concept_id INT,
			name VARCHAR(250),
			value_as_string VARCHAR(250),
			value_as_concept_id integer NULL,
			metadata_date TIMESTAMP,
			metadata_datetime TIMESTAMP );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.CDM_SOURCE (
			cdm_source_name VARCHAR(255),
			cdm_source_abbreviation VARCHAR(25),
			cdm_holder VARCHAR(255),
			source_description VARCHAR(MAX),
			source_documentation_reference VARCHAR(255),
			cdm_etl_reference VARCHAR(255),
			source_release_date TIMESTAMP,
			cdm_release_date TIMESTAMP,
			cdm_version VARCHAR(10),
			vocabulary_version VARCHAR(20) );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.CONCEPT (
			concept_id INT,
			concept_name VARCHAR(255),
			domain_id VARCHAR(20),
			vocabulary_id VARCHAR(20),
			concept_class_id VARCHAR(20),
			standard_concept VARCHAR(1),
			concept_code VARCHAR(50),
			valid_start_date TIMESTAMP,
			valid_end_date TIMESTAMP,
			invalid_reason VARCHAR(1) );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.VOCABULARY (
			vocabulary_id VARCHAR(20),
			vocabulary_name VARCHAR(255),
			vocabulary_reference VARCHAR(255),
			vocabulary_version VARCHAR(255),
			vocabulary_concept_id INT );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.DOMAIN (
			domain_id VARCHAR(20),
			domain_name VARCHAR(255),
			domain_concept_id INT );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.CONCEPT_CLASS (
			concept_class_id VARCHAR(20),
			concept_class_name VARCHAR(255),
			concept_class_concept_id INT );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.CONCEPT_RELATIONSHIP (
			concept_id_1 INT,
			concept_id_2 INT,
			relationship_id VARCHAR(20),
			valid_start_date TIMESTAMP,
			valid_end_date TIMESTAMP,
			invalid_reason VARCHAR(1) );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.RELATIONSHIP (
			relationship_id VARCHAR(20),
			relationship_name VARCHAR(255),
			is_hierarchical VARCHAR(1),
			defines_ancestry VARCHAR(1),
			reverse_relationship_id VARCHAR(20),
			relationship_concept_id INT );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.CONCEPT_SYNONYM (
			concept_id INT,
			concept_synonym_name VARCHAR(1000),
			language_concept_id INT );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.CONCEPT_ANCESTOR (
			ancestor_concept_id INT,
			descendant_concept_id INT,
			min_levels_of_separation INT,
			max_levels_of_separation INT );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.SOURCE_TO_CONCEPT_MAP (
			source_code VARCHAR(50),
			source_concept_id INT,
			source_vocabulary_id VARCHAR(20),
			source_code_description VARCHAR(255),
			target_concept_id INT,
			target_vocabulary_id VARCHAR(20),
			valid_start_date TIMESTAMP,
			valid_end_date TIMESTAMP,
			invalid_reason VARCHAR(1) );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.DRUG_STRENGTH (
			drug_concept_id INT,
			ingredient_concept_id INT,
			amount_value FLOAT,
			amount_unit_concept_id integer NULL,
			numerator_value FLOAT,
			numerator_unit_concept_id integer NULL,
			denominator_value FLOAT,
			denominator_unit_concept_id integer NULL,
			box_size integer NULL,
			valid_start_date TIMESTAMP,
			valid_end_date TIMESTAMP,
			invalid_reason VARCHAR(1) );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.COHORT (
			cohort_definition_id INT,
			subject_id INT,
			cohort_start_date TIMESTAMP,
			cohort_end_date TIMESTAMP );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE @cdmDatabaseSchema.COHORT_DEFINITION (
			cohort_definition_id INT,
			cohort_definition_name VARCHAR(255),
			cohort_definition_description VARCHAR(MAX),
			definition_type_concept_id INT,
			cohort_definition_syntax VARCHAR(MAX),
			subject_concept_id INT,
			cohort_initiation_date TIMESTAMP );