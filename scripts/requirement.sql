--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: requirement; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE requirement (
    requirement_id character varying(20) NOT NULL,
    requirement_type_id character varying(20),
    facility_id character varying(20),
    deliverable_id character varying(20),
    fixed_asset_id character varying(20),
    product_id character varying(20),
    status_id character varying(20),
    description character varying(255),
    requirement_start_date timestamp with time zone,
    required_by_date timestamp with time zone,
    estimated_budget numeric(18,2),
    quantity numeric(18,6),
    use_case text,
    reason character varying(255),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    facility_id_to character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.requirement OWNER TO ofbiz;

--
-- Name: requirement pk_requirement; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement
    ADD CONSTRAINT pk_requirement PRIMARY KEY (requirement_id);


--
-- Name: req_deliverable; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_deliverable ON requirement USING btree (deliverable_id);


--
-- Name: req_facility; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_facility ON requirement USING btree (facility_id);


--
-- Name: req_fixed_asset; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_fixed_asset ON requirement USING btree (fixed_asset_id);


--
-- Name: req_product; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_product ON requirement USING btree (product_id);


--
-- Name: req_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_stts ON requirement USING btree (status_id);


--
-- Name: req_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_type ON requirement USING btree (requirement_type_id);


--
-- Name: requirement_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX requirement_txcrts ON requirement USING btree (created_tx_stamp);


--
-- Name: requirement_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX requirement_txstmp ON requirement USING btree (last_updated_tx_stamp);


--
-- Name: requirement req_deliverable; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement
    ADD CONSTRAINT req_deliverable FOREIGN KEY (deliverable_id) REFERENCES deliverable(deliverable_id);


--
-- Name: requirement req_facility; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement
    ADD CONSTRAINT req_facility FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: requirement req_fixed_asset; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement
    ADD CONSTRAINT req_fixed_asset FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: requirement req_product; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement
    ADD CONSTRAINT req_product FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: requirement req_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement
    ADD CONSTRAINT req_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: requirement req_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement
    ADD CONSTRAINT req_type FOREIGN KEY (requirement_type_id) REFERENCES requirement_type(requirement_type_id);


--
-- PostgreSQL database dump complete
--

